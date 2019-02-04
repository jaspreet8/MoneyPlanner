package com.jaspreet.money.planner.social.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Service;

/**
 * @author jaspreet
 *
 */
@Service
public class GoogleServiceImpl implements GoogleService{

	@Value("${spring.social.google.appId}")
	private String googleAppId;
	@Value("${spring.social.google.appSecret}")
	private String googleAppSecret;
	@Value("${spring.social.google.redirectUri}")
	private String googleRedirectUri;
	
	private GoogleConnectionFactory createGoogleConnection(){
		return new GoogleConnectionFactory(googleAppId, googleAppSecret);
	}
	
	@Override
	public String googleLogin() {
		OAuth2Parameters parameters = new OAuth2Parameters();
		parameters.setRedirectUri(googleRedirectUri);
		parameters.setScope("profile email");
		return createGoogleConnection().getOAuthOperations().buildAuthenticateUrl(parameters);
	}

	@Override
	public String getGoogleAccessToken(String code) {
		return createGoogleConnection().getOAuthOperations().exchangeForAccess(code,googleRedirectUri,null).getAccessToken();
	}

	@Override
	public Person getGoogleUserProfile(String accessToken) {
		Google google = new GoogleTemplate(accessToken);
		Person person = google.plusOperations().getGoogleProfile();
		return person;
	}
}
