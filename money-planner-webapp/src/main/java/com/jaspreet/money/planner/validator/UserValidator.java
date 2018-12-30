package com.jaspreet.money.planner.validator;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.jaspreet.money.planner.dto.ErrorResponseDTO;
import com.jaspreet.money.planner.entity.User;
import com.jaspreet.money.planner.service.UserService;

/**
 * @author jaspreet
 *
 */
@Component
public class UserValidator {
	
    @Autowired
    private UserService userService;

    public List<ErrorResponseDTO> validate(User user) {
    	List<ErrorResponseDTO> errors = new ArrayList<>();
    	
    	//Name validation
    	if (user.getName() == null ||!StringUtils.hasText(user.getName())) {
			errors.add(new ErrorResponseDTO("Name","The Name field is required."));
		}
    	if (user.getName().length() > 32) {
        	errors.add(new ErrorResponseDTO("Name","The Name field must not be greater than 32 characters."));
        }
    	
    	//Email Address validation
    	if (user.getEmailAddress() == null ||!StringUtils.hasText(user.getEmailAddress())) {
			errors.add(new ErrorResponseDTO("Email Address","The Email Address field is required."));
		}
    	if (!EmailValidator.getInstance().isValid(user.getEmailAddress()) ) {
			errors.add(new ErrorResponseDTO("Email Address","The Email Address field must be a valid email."));
		}
    	if (userService.findByEmailAddress(user.getEmailAddress()) != null) {
            errors.add(new ErrorResponseDTO("Email Address","Another account is using "+user.getEmailAddress()));
        }
    	
    	//Password validation
    	if (user.getPassword() == null || !StringUtils.hasText(user.getPassword())) {
			errors.add(new ErrorResponseDTO("Password","The Password field is required."));
		}
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
        	errors.add(new ErrorResponseDTO("Password","The Password field must be between 8-32 characters."));
        }

        return errors; 
    }
}
