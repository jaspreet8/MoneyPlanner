package com.jaspreet.money.planner.service;

import javax.servlet.http.HttpServletRequest;

import com.jaspreet.money.planner.entity.Role;

/**
 * @author jaspreet
 *
 */
public interface SecurityService {
	
	public String findLoggedInEmailAddress();

	public void loginUser(String emailAddress, String password, Role role, HttpServletRequest request);

}
