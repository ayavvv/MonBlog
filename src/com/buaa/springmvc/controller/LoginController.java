package com.buaa.springmvc.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.service.UserService;

/**
 *
 * @author theo
 * @time:2016年12月12日 下午8:49:22
 *
 *                   ----------Dragon be here!----------/ ┏┓ ┏┓ ┏┛┻━━━┛┻┓ ┃ ┃ ┃
 *                   ━ ┃ ┃ ┳┛ ┗┳ ┃ ┃ ┃ ┃ ┻ ┃ ┃ ┃ ┗━┓ ┏━┛ ┃ ┃神兽保佑 ┃ ┃代码无BUG！ ┃
 *                   ┗━━━┓ ┃ ┣┓ ┃ ┏┛ ┗┓┓┏━┳┓┏┛ ┃┫┫ ┃┫┫ ┗┻┛ ┗┻┛
 *                   ---------------神兽出没--------------/
 * 
 */
@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping("login")
	public ModelAndView handelRequest() {
		ModelAndView mv = new ModelAndView("Login");
		return mv;
	}

	@RequestMapping("login.do")
	public ModelAndView handelRequest1(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String username = request.getParameter("username");
		String psswd = request.getParameter("psswd");
		if (userService.isUserTrue(username, psswd) == 1) {
			ModelAndView mv = new ModelAndView();
			
				mv.setViewName("redirect:blog?p=0");
			
			session.setAttribute("username", username);
			return mv;
		} else {
			System.out.println("username false");
			return new ModelAndView("redirect:login");
		}
	}
}
