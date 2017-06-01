package com.buaa.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.service.MailService;

/**
 *
 * @author theo
 * @time:2016年11月11日 下午11:01:58
 *
 *----------Dragon be here!----------/
 *　　　┏┓　　　┏┓
 *　　┏┛┻━━━┛┻┓
 *　　┃　　　　　　　┃
 *　　┃　　　━　　　┃
 *　　┃　┳┛　┗┳　┃
 *　　┃　　　　　　　┃
 *　　┃　　　┻　　　┃
 *　　┃　　　　　　　┃
 *　　┗━┓　　　┏━┛
 *　　　　┃　　　┃神兽保佑
 *　　　　┃　　　┃代码无BUG！
 *　　　　┃　　　┗━━━┓
 *　　　　┃　　　　　　　┣┓
 *　　　　┃　　　　　　　┏┛
 *　　　　┗┓┓┏━┳┓┏┛
 *　　　　　┃┫┫　┃┫┫
 *　　　　　┗┻┛　┗┻┛
 *---------------神兽出没--------------/
 * 
 */
@Controller
public class ContactController {
	@Autowired
	private MailService mailService;

	@RequestMapping(value="mail",method= RequestMethod.POST)
	public ModelAndView handelRequest(HttpServletRequest request, HttpServletResponse response) {
		// 设置收件人，寄件人 用数组发送多个邮件
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String message=request.getParameter("message");
		System.out.println("name"+name+" ,phone"+phone+" ,email"+email+", message"+message);
		String[] array1 = new String[] {"duan.z@qq.com"};
		// 设置内容
		String subject1="New message from MonBlog";
		String content1 = "There is a new message from MonBlog, \nName: {"+name+"}, \nphone: {"+phone+"}, \nemail: {"+email+"}\nmessage: {"+message+"}.";
		String []array2=new String[]{email};
		String subject2="Thank you for your message";
		String content2 ="Hi,\nI have received your message {"+message+"} and I will try to get back to you within 24 hours, Thank you very much !\n\n---------------\nBest regards,\nDUAN Zhangbo";
		mailService.sendmail(array1,subject1,content1);
		mailService.sendmail(array2,subject2,content2);
		return null;
	}
	@RequestMapping("contact")
	public ModelAndView handleRequest(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("contact");
		return mv;
	}
}
