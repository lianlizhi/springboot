package com.example.springboot.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.utils.EmailUtils;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class EmailController {

  

    @RequestMapping("sendEmail")
    public String sendEmail() throws JsonProcessingException {
        boolean isSend = EmailUtils.sendEmail("这是一封测试邮件", new String[]{"153069491@qq.com"}, null, "<h3><a href='http://www.baidu.com'>百度一下，你就知道</a></h3>", null);
        return "发送邮件:" + isSend;
    }
}