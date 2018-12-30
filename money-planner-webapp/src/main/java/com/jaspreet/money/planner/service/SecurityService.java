package com.jaspreet.money.planner.service;

/**
 * @author jaspreet
 *
 */
public interface SecurityService {
	
    public String findLoggedInEmailAddress();

    public void loginUser(String emailAddress, String password);
}
