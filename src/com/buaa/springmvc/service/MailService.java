package com.buaa.springmvc.service;

public interface MailService {
	//参数 收件人，主题，内容
	public void sendmail(String[] array,String subject,String content);

}
