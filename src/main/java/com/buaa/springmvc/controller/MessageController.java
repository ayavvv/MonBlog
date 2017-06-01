package com.buaa.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.buaa.springmvc.dao.Blog;
import com.buaa.springmvc.dao.Msg;
import com.buaa.springmvc.service.BlogService;
import com.buaa.springmvc.service.MessageService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller

public class MessageController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private MessageService messageService;
    @RequestMapping("message.do")
    public @ResponseBody
    Map<String, Object> save(HttpServletRequest request, String name, String content, String code) {

        //从session中获取系统生成的验证码
        String kaptchaExpected = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);

        //进行比较
        Map<String, Object> map = new HashMap<String, Object>();

        if (code.equals(kaptchaExpected)) {
            Msg message1 = new Msg();
            message1.setAuthor(name);
            message1.setContent(content);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = format.format(new Date());
            String id = "index";
            message1.setDate(date);
            messageService.createAMessage(message1);
            map.put("msg", "true");
        } else {
            map.put("msg", "false");
        }
        return map;
    }

    @RequestMapping(value = "messages")
    public ModelAndView requestHandel() {
        List<Msg> messages = messageService.getAllMessage();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("messages");
        mv.addObject("messages", messages);
        return mv;
    }
}
