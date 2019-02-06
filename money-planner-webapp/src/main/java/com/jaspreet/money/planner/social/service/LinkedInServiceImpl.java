package com.jaspreet.money.planner.social.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.linkedin.api.LinkedIn;
import org.springframework.social.linkedin.api.LinkedInProfileFull;
import org.springframework.social.linkedin.api.impl.LinkedInTemplate;
import org.springframework.social.linkedin.connect.LinkedInConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Service;

/**
 * @author jaspreet
 *
 */
@Service
public class LinkedInServiceImpl implements LinkedInService{

	@Value("${spring.social.linkedIn.appId}")
	private String linkedInAppId;
	@Value("${spring.social.linkedIn.appSecret}")
	private String linkedInAppSecret;
	@Value("${spring.social.linkedIn.redirectUri}")
	private String linkedInRedirectUri;
	
	private LinkedInConnectionFactory createLinkedInConnection(){
		return new LinkedInConnectionFactory(linkedInAppId, linkedInAppSecret);
	}
	
	@Override
	public String linkedInLogin() {
		OAuth2Parameters parameters = new OAuth2Parameters();
		parameters.setRedirectUri(linkedInRedirectUri);
		parameters.setScope("r_basicprofile,r_emailaddress");
		return createLinkedInConnection().getOAuthOperations().buildAuthenticateUrl(parameters);
	}

	@Override
	public String getLinkedInAccessToken(String code) {
		return createLinkedInConnection().getOAuthOperations().exchangeForAccess(code,linkedInRedirectUri,null).getAccessToken();
	}

	@Override
	public LinkedInProfileFull getLinkedInUserProfile(String accessToken) {
		LinkedIn linkedIn = new LinkedInTemplate(accessToken);
		LinkedInProfileFull linkedInProfileFull = linkedIn.profileOperations().getUserProfileFull();
		return linkedInProfileFull;
	}
}
