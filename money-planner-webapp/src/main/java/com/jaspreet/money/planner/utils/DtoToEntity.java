package com.jaspreet.money.planner.utils;

import com.jaspreet.money.planner.dto.LoginInfoDTO;
import com.jaspreet.money.planner.entity.User;

/**
 * @author jaspreet
 *
 */

public class DtoToEntity {
	
	public static void convertLoginInfoVoToUser(LoginInfoDTO vo,User user) {
		user.setEmailAddress(vo.getEmail());
		user.setName(vo.getName());
		user.setPassword(vo.getPassword());
	}
}