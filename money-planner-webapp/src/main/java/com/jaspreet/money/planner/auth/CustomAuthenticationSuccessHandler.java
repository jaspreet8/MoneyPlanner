package com.jaspreet.money.planner.auth;

import java.io.IOException;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.jaspreet.money.planner.dao.UserRepository;


@Component
@Scope(scopeName="prototype")
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
	 
	@Autowired
    private UserRepository userRepository;
	
    @Override
    @Transactional
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        HttpSession session = httpServletRequest.getSession();
       
        User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        com.jaspreet.money.planner.entity.User user = userRepository.findByEmailAddressAndEnabled(authUser.getUsername(),true);
        user.setLastLogin(Instant.now());
        session.setAttribute("username", user.getName());
        session.setAttribute("authorities", authentication.getAuthorities());
 
        httpServletResponse.setStatus(HttpServletResponse.SC_OK);
        httpServletResponse.sendRedirect("dashboard");
    }
}
