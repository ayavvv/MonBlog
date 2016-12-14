package com.buaa.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.dao.Blog;
import com.buaa.springmvc.dao.Msg;
import com.buaa.springmvc.service.BlogService;
import com.buaa.springmvc.service.MessageService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author theo
 * @time:2016年11月11日 下午11:02:17
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

public class MessageController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private MessageService messageService;


    @RequestMapping(value="message",method=RequestMethod.POST)
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response){
    	Msg message1=new Msg();
    	message1.setAuthor(request.getParameter("author"));
    	message1.setContent(request.getParameter("content"));
    	System.out.println(message1);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = format.format(new Date());
        String id="index";
        ModelAndView mv=new ModelAndView("redirect:"+id);
        message1.setDate(date);
        messageService.createAMessage(message1);
        List<Blog> blogs = blogService.getAllBlog();
        List<Msg> messages = messageService.getAllMessage();
        mv.addObject("blogs", blogs);
        mv.addObject("messages", messages);
        return mv;
    }
    
    @RequestMapping(value="messages")
    public ModelAndView requestHandel(){
    	List<Msg> messages = messageService.getAllMessage();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("messages");
        mv.addObject("messages", messages);
        return mv;
    }
}
