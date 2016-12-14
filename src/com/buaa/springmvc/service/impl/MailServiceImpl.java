package com.buaa.springmvc.service.impl;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.buaa.springmvc.service.MailService;


/**
 * @author theo
 *
 */
@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	private SimpleMailMessage templateMessage;

	public void sendmail(String[] array,String subject,String content){
		templateMessage.setTo(array);
		templateMessage.setText(content);
		templateMessage.setSubject(subject);
		Boolean result=true;
		try {
			mailSender.send(templateMessage);
		} catch (MailException e) {
			e.printStackTrace();
			result = false;
		}
		if (result) {
			System.out.println("发送邮件成功。。。。");
		}
	}
}