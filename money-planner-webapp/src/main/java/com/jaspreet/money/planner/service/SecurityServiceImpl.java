package com.jaspreet.money.planner.service;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jaspreet.money.planner.entity.Role;

/**
 * @author jaspreet
 *
 */
@Service
public class SecurityServiceImpl implements SecurityService{

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserDetailsService userDetailsService;

	private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);
	
	@Override
    public String findLoggedInEmailAddress() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails)userDetails).getUsername();
        }
        return null;
    }

	@Override
	public void loginUser(String emailAddress, String password, Role role, HttpServletRequest request) {
		Authentication authentication;
		if(StringUtils.hasText(password)){
			UserDetails userDetails = userDetailsService.loadUserByUsername(emailAddress);
			authentication = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
			authenticationManager.authenticate(authentication);
		}else{
			Collection<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			GrantedAuthority grantedAuthority = (GrantedAuthority)new GrantedAuthority() {
				private static final long serialVersionUID = 1L;
				public String getAuthority() {
					return role.getName();
				}
			};
			grantedAuthorities.add(grantedAuthority);

			authentication = new UsernamePasswordAuthenticationToken(emailAddress, null, grantedAuthorities);
		}
		SecurityContextHolder.getContext().setAuthentication(authentication);
		request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
		logger.debug(String.format("Login for email: %s successfully!", emailAddress));
	}
}
