package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/hello")
public class HelloController {

	 @RequestMapping("test") 
	  public String hello(){ 
	  return"Hello world!1111122222";
	  } 
	
	
}
