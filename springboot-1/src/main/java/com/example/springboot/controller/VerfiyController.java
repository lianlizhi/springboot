package com.example.springboot.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.springboot.ApplicationContextHelper;
import com.example.springboot.redis.RedisUtils;

@Controller
public class VerfiyController {
    //注入redis服务
	RedisUtils redis = null ;
	static {
		RedisUtils redis = (RedisUtils)ApplicationContextHelper.getBean(RedisUtils.class);
	}
 
    @RequestMapping("/verfiy")
    public ModelAndView login(HttpServletRequest request){
    	
        ModelAndView modelAndView = new ModelAndView();
        //获取用户输入的手机号和验证码
        String phoneNum = request.getParameter("mobile"); //客户端用户输入的手机号
        String code = request.getParameter("code"); //客户端用户输入的验证码
 
        //获取redis中存放的验证码
        String redisCode = (String) redis.get("sms_"+phoneNum);
 
        if(code!=null && !"".equals(code)){
            //如果用户输入的验证码和生成的验证码保持一致
            if(code.equals(redisCode)){
                //删除redis中存放的验证码缓存
                redis.del("sms_"+phoneNum);
                //同时删除redis中存放的用户输入验证码的错误次数
                redis.del("error_"+phoneNum);
                modelAndView.setViewName("index");
            }else {
                //如果验证失败  给该用户总共三次输入机会，大于三次重新获取验证码
                //如果是第一次错误，则第一次给用户创建错误次数并存放于redis中，每次错误都会在原有的键上对其值+1
                Long incr = redis.incr("error_"+phoneNum, 0);
                if (incr > 3){  //如果用户错误的次数大于三次
                    //清除旧的验证码
                    redis.del("sms_"+phoneNum);
                    //清除redis中存放的用户输入验证码的错误次数
                    redis.del("error_"+phoneNum);
                    modelAndView.addObject("error","超过验证码错误次数，请重新获取验证码！");
                    modelAndView.setViewName("error");
                }else { //如果用户输入错误且错误小于3次 则刷新一次页面用户继续输入
                    modelAndView.setViewName("mtlogin");
                }
 
            }
        }
 
 
        return modelAndView;
 
    }
}

