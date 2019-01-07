package com.jaspreet.money.planner.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.jaspreet.money.planner.social.service.FacebookService;

/**
 * @author jaspreet
 *
 */
@Controller
@RequestMapping(value="/social")
public class FacebookController {

	@Autowired
	private FacebookService facebookService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private SecurityService securityService;
	
	@RequestMapping(value = "/facebookLogin", method = RequestMethod.GET)
	public RedirectView facebookLogin() {
		RedirectView  redirectView = new RedirectView();
		String url = facebookService.facebookLogin();
		redirectView.setUrl(url);
		return redirectView;
	}
	
	@RequestMapping(value = "/facebook", method = RequestMethod.GET)
	public String facebook(@RequestParam("code")String code) {
		String accessToken = facebookService.getFacebookAccessToken(code);
		return "redirect:/social/facebookProfileData/"+accessToken;
	}
	
	@RequestMapping(value = "/facebookProfileData/{accessToken:.+}", method = RequestMethod.GET)
	public String facebookProfileData(@PathVariable	String accessToken, Model model, HttpServletRequest request) {
		org.springframework.social.facebook.api.User user = facebookService.getFacebookUserProfile(accessToken);
		User dbUser = userService.findByEmailAddressAndEnabled(user.getEmail(), true);
		Role role = null;
		if(dbUser != null){
			dbUser.setName(user.getFirstName()+(StringUtils.hasText(user.getLastName()) ? " "+user.getLastName() : ""));
			userService.update(dbUser);
			role = dbUser.getRole();
		}else{
			User newUser = new User();
			newUser.setEmailAddress(user.getEmail());
			newUser.setName(user.getFirstName()+(StringUtils.hasText(user.getLastName()) ? " "+user.getLastName() : ""));
			role = roleRepository.findByName("ROLE_USER");
			newUser.setRole(role);
			userService.save(newUser);
		}
		
		securityService.loginUser(user.getEmail(), null, role, request);
		return "redirect:/dashboard";
	}

}
