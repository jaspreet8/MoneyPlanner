package com.jaspreet.money.planner.web.controller;

import java.time.Instant;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.linkedin.api.LinkedInProfileFull;
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
import com.jaspreet.money.planner.social.service.LinkedInService;

/**
 * @author jaspreet
 *
 */
@Controller
@RequestMapping(value="/social")
public class LinkedInController {

	@Autowired
	private LinkedInService linkedInService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value = "/linkedInLogin", method = RequestMethod.GET)
	public RedirectView linkedInLogin() {
		RedirectView  redirectView = new RedirectView();
		String url = linkedInService.linkedInLogin();
		redirectView.setUrl(url);
		return redirectView;
	}
	
	@RequestMapping(value = "/linkedIn", method = RequestMethod.GET)
	public String linkedIn(@RequestParam("code")String code) {
		String accessToken = linkedInService.getLinkedInAccessToken(code);
		return "redirect:/social/linkedInProfileData/"+accessToken;
	}
	
	@RequestMapping(value = "/linkedInProfileData/{accessToken:.+}", method = RequestMethod.GET)
	public String linkedInProfileData(@PathVariable String accessToken, Model model, HttpServletRequest request) {
		LinkedInProfileFull user = linkedInService.getLinkedInUserProfile(accessToken);
		User dbUser = userService.findByEmailAddressAndEnabled(user.getEmailAddress(), true);
		Role role = null;
		if(dbUser != null){
			dbUser.setName(user.getFirstName()+(StringUtils.hasText(user.getLastName()) ? " "+user.getLastName() : ""));
			dbUser.setLastLogin(Instant.now());
			userService.update(dbUser);
			role = dbUser.getRole();
		}else{
			User newUser = new User();
			newUser.setEmailAddress(user.getEmailAddress());
			newUser.setName(user.getFirstName()+(StringUtils.hasText(user.getLastName()) ? " "+user.getLastName() : ""));
			role = roleRepository.findByName("ROLE_USER");
			newUser.setRole(role);
			newUser.setLastLogin(Instant.now());
			userService.save(newUser);
		}
		
		securityService.loginUser(user.getEmailAddress(), null, role, request);
		return "redirect:/dashboard";
	}

}
