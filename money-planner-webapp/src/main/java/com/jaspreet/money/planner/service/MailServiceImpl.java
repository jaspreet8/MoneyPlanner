package com.jaspreet.money.planner.service;

import java.nio.charset.StandardCharsets;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.jaspreet.money.planner.dto.MailDTO;
import com.jaspreet.money.planner.exception.MoneyPlannerInternalException;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * @author jaspreet
 *
 */
@Service
public class MailServiceImpl implements MailService {
	
	private static final Logger logger = LoggerFactory.getLogger(MailServiceImpl.class);
	
	@Autowired
    private JavaMailSender sender;

    @Autowired
    private Configuration freemarkerConfig;

	@Override
	public void sendEmail(MailDTO mail, boolean withAttachment) {
		MimeMessage message = sender.createMimeMessage();
		try {
	        MimeMessageHelper helper = new MimeMessageHelper(message,MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,StandardCharsets.UTF_8.name());
	        if(withAttachment){
	        	mail.getAttachments().forEach((k,v)->{
					try {
						helper.addAttachment(k, v);
					} catch (MessagingException e) {
						logger.error("Error occured while adding attachment:- {} to the email",k);
						throw new MoneyPlannerInternalException("Error occured while adding attachment to the email.");
					}
	        	});
	        }
	        Template t = freemarkerConfig.getTemplate(mail.getTemplateName());
	        String text = FreeMarkerTemplateUtils.processTemplateIntoString(t, mail.getModel());
	
	        helper.setTo(mail.getTo());
	        helper.setText(text, true);
	        helper.setSubject(mail.getSubject());

	        sender.send(message);
		}catch(Exception ex){
			logger.error("Error occured while sending mail to the email id:- {}",mail.getTo(),ex);
			throw new MoneyPlannerInternalException("Error occured while sending email.");
		}
	}

}
