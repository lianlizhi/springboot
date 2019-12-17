package com.example.springboot.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.config.SystemConfig;
import com.example.springboot.consts.BaseResponseInfo;

@RestController
@RequestMapping("/hello")
public class HelloController {

	private final Logger log = Logger.getLogger(HelloController.class) ;
	
	@Autowired 
	private SystemConfig systemConfig;
	
	 @RequestMapping("test") 
	  public BaseResponseInfo hello(){ 
		 BaseResponseInfo info  = new BaseResponseInfo() ;
		 String address = systemConfig.getAddress();
		log.info(address);
		System.out.println(address);
		info.data = "hello ,world";
		info.code = 200 ;
		return info ; 
	  } 
	 
	 
	 @RequestMapping("hello") 
	  public BaseResponseInfo hello(HttpServletRequest request, String username){ 
		 BaseResponseInfo info  = new BaseResponseInfo() ;
		 String address = systemConfig.getAddress();
		log.info(address);
		String username1 = request.getParameter("username") ;
		System.out.println(username1);
		System.out.println(username);
		System.out.println(address);
		info.data = "hello ,world";
		info.code = 200 ;
		return info ; 
	  } 
	
	
}
