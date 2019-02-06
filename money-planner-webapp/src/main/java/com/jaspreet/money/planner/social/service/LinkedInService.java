package com.jaspreet.money.planner.social.service;

import org.springframework.social.linkedin.api.LinkedInProfileFull;

/**
 * @author jaspreet
 *
 */
public interface LinkedInService {
	
	public String linkedInLogin();

	public String getLinkedInAccessToken(String code);

	public LinkedInProfileFull getLinkedInUserProfile(String accessToken);
	
}
