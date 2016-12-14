package com.buaa.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.dao.Blog;
import com.buaa.springmvc.dao.Msg;
import com.buaa.springmvc.service.BlogService;
import com.buaa.springmvc.service.MessageService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author theo
 * @time:2016年11月11日 下午11:02:03
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
public class IndexController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private MessageService messageService;

    @RequestMapping(value={"index"})
    public ModelAndView index(HttpServletRequest request,HttpServletResponse response) {
    	List<Blog> blogs = blogService.get5Blog();
        List<Msg> messages = messageService.get5Message();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        mv.addObject("blogs", blogs);
        mv.addObject("messages", messages);
        return mv;
    }
}
