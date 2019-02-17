package com.jaspreet.money.planner.service;

import com.jaspreet.money.planner.dto.MailDTO;

/**
 * @author jaspreet
 *
 */
public interface MailService {
	
	public void sendEmail(MailDTO mail,boolean withAttachment);

}
