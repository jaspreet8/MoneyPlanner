package com.jaspreet.money.planner.social.service;

import org.springframework.social.facebook.api.User;

/**
 * @author jaspreet
 *
 */
public interface FacebookService {
	
	public String facebookLogin();

	public String getFacebookAccessToken(String code);

	public User getFacebookUserProfile(String accessToken);
	
}
