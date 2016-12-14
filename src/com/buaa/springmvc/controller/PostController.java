package com.buaa.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.dao.Blog;
import com.buaa.springmvc.service.BlogService;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpSession;


/**
 *
 * @author theo
 * @time:2016年10月29日 下午8:44:57
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

public class PostController {

	@Autowired
	private BlogService blogService;

	@RequestMapping("post")
	public ModelAndView handleRequest(HttpSession session,@RequestParam("p")int p) {
		System.out.println(session.getAttribute("username"));
		if(session.getAttribute("username")==null){
			return new ModelAndView("redirect:" + "login");
		}
		if(p==0){
			return new ModelAndView("post");
		}else{
			ModelAndView mv=new ModelAndView ();
			mv.setViewName("post");
			mv.addObject("blog",blogService.getBlogbyId(p));
			return mv;
		}
	}

	@RequestMapping(value = "post.do", method = RequestMethod.POST)
	public ModelAndView handleRequestpost(@RequestParam(value = "editorTitle") String title,@RequestParam(value = "p") int p,
			@RequestParam(value = "editorAuthor") String author,
			@RequestParam(value = "editorCategory") String category,
			@RequestParam(value = "editorPreview") String preview, @RequestParam(value = "editorValue") String value) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(new Date());
		Blog blog = new Blog(title, value, preview, author, category, date);
		if(p==0){
			blogService.createBlog(blog);
		}else{
			blogService.updateBlogbyId(p,blog);
		}
		ModelAndView mv = new ModelAndView("redirect:" + "index");
		return mv;
	}
}
