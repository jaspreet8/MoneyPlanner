package com.jaspreet.money.planner.web.controller;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jaspreet.money.planner.dao.PasswordResetTokenRepository;
import com.jaspreet.money.planner.dto.MailDTO;
import com.jaspreet.money.planner.dto.PasswordResetDTO;
import com.jaspreet.money.planner.entity.PasswordResetToken;
import com.jaspreet.money.planner.entity.User;
import com.jaspreet.money.planner.exception.MoneyPlannerValidationException;
import com.jaspreet.money.planner.service.MailService;
import com.jaspreet.money.planner.service.UserService;

/**
 * @author jaspreet
 *
 */
@Controller
@RequestMapping(value = "/web")
public class PasswordResetController {

	@Autowired
	private UserService userService;

	@Autowired
	private MailService mailService;

	@Autowired
	private PasswordResetTokenRepository passwordResetTokenRepository; 

	@PostMapping("/forgetPassword")
	@ResponseBody
	public void processForgotPassword(@RequestParam(value = "email", required = true) String email, HttpServletRequest request) {

		if (StringUtils.isBlank(email)) {
			throw new MoneyPlannerValidationException("Email Address","The Email Address field is required.");
		}else if (!EmailValidator.getInstance().isValid(email) ) {
			throw new MoneyPlannerValidationException("Email Address","The Email Address field must be a valid email.");
		}

		User user = userService.findByEmailAddressAndEnabled(email, true);
		if (user == null){
			throw new MoneyPlannerValidationException("Email Address","We could not find an account for that e-mail address.");
		}

		PasswordResetToken token = new PasswordResetToken();
		token.setToken(UUID.randomUUID().toString());
		token.setUser(user);
		token.setExpiryDate(Instant.now().plus(24, ChronoUnit.HOURS));
		passwordResetTokenRepository.save(token);

		MailDTO mail = new MailDTO();
		mail.setTo(email);
		mail.setSubject("MoneyPlanner account password reset");
		mail.setTemplateName("forgetPassword.ftl");
		Map<String, Object> model = new HashMap<>();
		model.put("token", token);
		model.put("user", user);
		String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		model.put("baseUrl", baseUrl);
		model.put("resetUrl", "/web/resetPassword?token=" + token.getToken());
		mail.setModel(model);
		mailService.sendEmail(mail, false);

	}

	@GetMapping("/resetPassword")
	public String displayResetPasswordPage(@RequestParam(required = true) String token, Model model) {
		PasswordResetToken resetToken = passwordResetTokenRepository.findByToken(token);
		if (resetToken == null){
			model.addAttribute("error", "Could not find password reset token.");
			model.addAttribute("resetToken", "");
		} else if (resetToken.isExpired()){
			model.addAttribute("error", "Token has expired, please request a new password reset.");
			model.addAttribute("resetToken", "");
		} else {
			model.addAttribute("error", "");
			model.addAttribute("resetToken", resetToken.getToken());
		}

		return "resetPassword";
	}

	@PostMapping("/resetPassword")
	@Transactional
	public void handlePasswordReset(@RequestBody PasswordResetDTO passwordResetDTO) {
		if (StringUtils.isBlank(passwordResetDTO.getNewPassword())) {
			throw new MoneyPlannerValidationException("New Password","The New Password field is required.");
		}else if (passwordResetDTO.getNewPassword().length() < 8 || passwordResetDTO.getNewPassword().length() > 32) {
			throw new MoneyPlannerValidationException("New Password","The Password field must be between 8-32 characters.");
        }
		
		PasswordResetToken token = passwordResetTokenRepository.findByToken(passwordResetDTO.getResetToken());
		if(token.isExpired()){
			throw new MoneyPlannerValidationException(null,"Token has expired, please request a new password reset.");
		}
		User user = token.getUser();
		userService.updatePassword(passwordResetDTO.getNewPassword(), user.getId());
		passwordResetTokenRepository.delete(token);
	}
}
