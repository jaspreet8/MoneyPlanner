package com.jaspreet.money.planner.web.controller;

import java.time.Instant;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.api.plus.Person;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.jaspreet.money.planner.dao.RoleRepository;
import com.jaspreet.money.planner.entity.Role;
import com.jaspreet.money.planner.entity.User;
import com.jaspreet.money.planner.service.SecurityService;
import com.jaspreet.money.planner.service.UserService;
import com.jaspreet.money.planner.social.service.GoogleService;

/**
 * @author jaspreet
 *
 */
@Controller
@RequestMapping(value="/social")
public class GoogleController {

	@Autowired
	private GoogleService googleService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value = "/googleLogin", method = RequestMethod.GET)
	public RedirectView googleLogin() {
		RedirectView  redirectView = new RedirectView();
		String url = googleService.googleLogin();
		redirectView.setUrl(url);
		return redirectView;
	}
	
	@RequestMapping(value = "/google", method = RequestMethod.GET)
	public String google(@RequestParam("code")String code) {
		String accessToken = googleService.getGoogleAccessToken(code);
		return "redirect:/social/googleProfileData/"+accessToken;
	}
	
	@RequestMapping(value = "/googleProfileData/{accessToken:.+}", method = RequestMethod.GET)
	public String googleProfileData(@PathVariable	String accessToken, Model model, HttpServletRequest request) {
		Person user = googleService.getGoogleUserProfile(accessToken);
		User dbUser = userService.findByEmailAddressAndEnabled(user.getAccountEmail(), true);
		Role role = null;
		if(dbUser != null){
			dbUser.setName(user.getGivenName()+(StringUtils.hasText(user.getFamilyName()) ? " "+user.getFamilyName() : ""));
			dbUser.setLastLogin(Instant.now());
			userService.update(dbUser);
			role = dbUser.getRole();
		}else{
			User newUser = new User();
			newUser.setEmailAddress(user.getAccountEmail());
			newUser.setName(user.getGivenName()+(StringUtils.hasText(user.getFamilyName()) ? " "+user.getFamilyName() : ""));
			role = roleRepository.findByName("ROLE_USER");
			newUser.setRole(role);
			newUser.setLastLogin(Instant.now());
			userService.save(newUser);
		}
		
		securityService.loginUser(user.getAccountEmail(), null, role, request);
		return "redirect:/dashboard";
	}

}
