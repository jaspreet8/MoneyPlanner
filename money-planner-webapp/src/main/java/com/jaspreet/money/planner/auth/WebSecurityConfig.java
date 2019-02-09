package com.jaspreet.money.planner.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author jaspreet
 *
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		 http
         	.authorizeRequests()
	            .antMatchers("/", "/resources/**","/registration","/social/**","/h2-console/**").permitAll()
	            .anyRequest().authenticated()
            .and()
            	.formLogin()
            	.loginPage("/")
				.loginProcessingUrl("/login")
				.defaultSuccessUrl("/dashboard")
				.failureUrl("/?error=true")
				.usernameParameter("email")
				.passwordParameter("password")
			.and()
        		.logout()
	        	.invalidateHttpSession(true)
	        	.clearAuthentication(true)
				.logoutUrl("/logout")
	        	.logoutSuccessUrl("/?logout=true")
	        	.permitAll()
	        .and()
	        	.headers().frameOptions().disable()
	        .and()
	        	.csrf().disable();
	}
	
	@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }
	
	@Bean
	public AuthenticationManager customAuthenticationManager() throws Exception {
		return authenticationManager();
	}
}
