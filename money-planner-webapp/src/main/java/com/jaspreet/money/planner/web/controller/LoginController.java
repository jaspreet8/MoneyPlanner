package com.jaspreet.money.planner.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jaspreet.money.planner.dto.ErrorResponseDTO;
import com.jaspreet.money.planner.dto.LoginInfoDTO;
import com.jaspreet.money.planner.entity.User;
import com.jaspreet.money.planner.service.SecurityService;
import com.jaspreet.money.planner.service.UserService;
import com.jaspreet.money.planner.utils.DtoToEntity;
import com.jaspreet.money.planner.validator.UserValidator;

/**
 * @author jaspreet
 *
 */
@Controller
public class LoginController {

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getHomePage(Model model, HttpServletRequest request,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		HttpSession session= request.getSession(false);
		SecurityContextHolder.clearContext();
		if(session != null) {
			session.invalidate();
		}

		if (error != null && "true".equals(error)) {
			model.addAttribute("errors", "Invalid username and password!");
			model.addAttribute("activeScreen","signIn");
		}
		if (logout != null && "true".equals(logout)){
			model.addAttribute("logout", "You have been logged out successfully.");
		}

		return "index";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(LoginInfoDTO loginInfoDTO,Model model) {
		User user = new User();
		DtoToEntity.convertLoginInfoVoToUser(loginInfoDTO, user);
		List<ErrorResponseDTO> errors = userValidator.validate(user);

		if (errors != null && !errors.isEmpty()) {
			ObjectMapper mapper = new ObjectMapper();
			String errorsJson = "",loginInfoDTOJson = "";
			try {
				errorsJson = mapper.writeValueAsString(errors);
				loginInfoDTOJson = mapper.writeValueAsString(loginInfoDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("errors", errorsJson);
			model.addAttribute("activeScreen","signUp");
			model.addAttribute("loginInfoDTO", loginInfoDTOJson);
			return "index";
		}
		userService.save(user);
		securityService.loginUser(loginInfoDTO.getEmail(), loginInfoDTO.getPassword());

		return "redirect:/dashboard";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String getDashBoardPage() {
		return "dashboard";
	}

}
