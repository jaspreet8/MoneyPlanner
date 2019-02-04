package com.jaspreet.money.planner.social.service;

import org.springframework.social.google.api.plus.Person;

/**
 * @author jaspreet
 *
 */
public interface GoogleService {
	
	public String googleLogin();

	public String getGoogleAccessToken(String code);

	public Person getGoogleUserProfile(String accessToken);
	
}
