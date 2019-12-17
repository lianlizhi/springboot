package com.example.springboot.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.consts.BaseResponseInfo;
import com.example.springboot.model.SysUser;
import com.example.springboot.service.UserService;
import com.example.springboot.utils.WebUtil;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService ;
	
	
	  @GetMapping("/start")
	  public String login() {
		  return "login"; 
		  }
	 

	/**
	@GetMapping("index")
	public String login(SysUser user) {
		Assert.notNull(user.getUsername(), "username不能为空");
		Assert.notNull(user.getPassword(), "password不能为空");
		UsernamePasswordToken upToken = new UsernamePasswordToken(user.getUsername(), user.getPassword());
		Subject subject = SecurityUtils.getSubject();
		if (subject == null) {
			throw new RuntimeException("登陆异常");
		}
		try {
			subject.login(upToken);
		} catch (Exception e) {
			e.printStackTrace();
			return "login";
		}
		System.out.println("成功登陸,歡迎觀影");
		return "index";
	}
	 */
	  
	  @ResponseBody
	@GetMapping("login")
	public BaseResponseInfo login(SysUser user) {
		BaseResponseInfo info = new BaseResponseInfo();
		Assert.notNull(user.getUsername(), "username不能为空");
		Assert.notNull(user.getPassword(), "password不能为空"); 
		
		boolean flag = false;
		try {
			flag = userService.selectUser(user);
			info.code = 200 ;
			flag = true ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			info.code = 500 ;
		}
		info.data = flag ;
		
		
		System.out.println("成功登陸,歡迎觀影");
		return info ;
	}
	
}
