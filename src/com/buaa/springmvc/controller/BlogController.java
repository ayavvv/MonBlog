package com.buaa.springmvc.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.service.BlogService;




/**
 *
 * @author theo
 * @time:2016年10月29日 下午7:37:42
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
public class BlogController {

    @Autowired
    private BlogService blogService ;

    @RequestMapping("blog")
    public ModelAndView handleRequest(@RequestParam("p")int p) {
        // 读取对应 blog(s)
    	ModelAndView mv=new ModelAndView();
        if (p == 0) {
        	mv.setViewName("blogs");//调用blogs.jsp
            mv.addObject("blogs", blogService.getAllBlog());
            return mv;
        } else {
        	mv.setViewName("blog");//调用blog.jsp
            mv.addObject("blog", blogService.getBlogbyId(p));
            return mv;
        }
    }
    @RequestMapping("category")
    public ModelAndView handleCategoryRequest(@RequestParam(value="category")String category) {
    	ModelAndView mv=new ModelAndView();
    	mv.setViewName("blogs");
        mv.addObject("blogs", blogService.getBlogbyCategory(category));
        return mv;
    }
    
    @RequestMapping("delete")
    public ModelAndView handleDelete(HttpSession session,@RequestParam(value="p")int p){
		if(session.getAttribute("username")==null){
			return new ModelAndView("redirect:" + "login");
		}
    	blogService.deleteBlogbyId(p);
		return new ModelAndView("redirect:blog?p=0");
    }
}

