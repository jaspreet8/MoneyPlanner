package com.jaspreet.money.planner.social.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Service;

/**
 * @author jaspreet
 *
 */
@Service
public class FacebookServiceImpl implements FacebookService{

	@Value("${spring.social.facebook.appId}")
	private String facebookAppId;
	@Value("${spring.social.facebook.appSecret}")
	private String facebookAppSecret;
	@Value("${spring.social.facebook.redirectUri}")
	private String facebookRedirectUri;
	
	private FacebookConnectionFactory createFacebookConnection(){
		return new FacebookConnectionFactory(facebookAppId, facebookAppSecret);
	}
	
	@Override
	public String facebookLogin() {
		OAuth2Parameters parameters = new OAuth2Parameters();
		parameters.setRedirectUri(facebookRedirectUri);
		parameters.setScope("public_profile,email");
		return createFacebookConnection().getOAuthOperations().buildAuthenticateUrl(parameters);
	}

	@Override
	public String getFacebookAccessToken(String code) {
		return createFacebookConnection().getOAuthOperations().exchangeForAccess(code,facebookRedirectUri,null).getAccessToken();
	}

	@Override
	public User getFacebookUserProfile(String accessToken) {
		Facebook facebook = new FacebookTemplate(accessToken);
		String[] fields = {"id","first_name","last_name","email"};
		return facebook.fetchObject("me",User.class,fields);
	}
}
