package com.example.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.consts.BaseResponseInfo;
import com.example.springboot.service.RoleService;

@RestController
@RequestMapping("/role")
public class RoleController {


	@Autowired 
	private RoleService roleService ;
	
	/*
	 * @RequestMapping("/role/all") public BaseResponseInfo hello(){
	 * BaseResponseInfo info = new BaseResponseInfo() ;
	 * roleService.getRolesByUserId(userId); info.data = "hello ,world"; info.code =
	 * 200 ; return info ; }
	 */
}
