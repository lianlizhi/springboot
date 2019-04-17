package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.UserMapper;
import com.example.demo.model.User;
import com.example.demo.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {

	
	
	/*
	 * @Autowired UserMapper userMapper;
	 */
	
	@Autowired 
	UserService  userService ;

	/*
	 * @RequestMapping(value={"/selectUserById"}, method=RequestMethod.GET) public
	 * User selectUserById(String id){ System.out.println("ssssssssssssssssssss");
	 * User user = userMapper.selectUserById(Integer.parseInt(id)); return user; }
	 * 
	 * @RequestMapping(value={"/selectUserByName"}, method=RequestMethod.GET) public
	 * List<User> selectUserByName(String userName){ return
	 * userMapper.selectUserByName(userName); }
	 * 
	 * @RequestMapping(value={"/addUser"}, method=RequestMethod.POST) public void
	 * addUser(User user){ userMapper.addUser(user); }
	 * 
	 * @RequestMapping(value={"/updateUser"}, method=RequestMethod.POST) public void
	 * updateUser(User user){ userMapper.updateUser(user); }
	 * 
	 * @RequestMapping(value={"/deleteUser"}, method=RequestMethod.POST) public void
	 * deleteUser(String id){ userMapper.deleteUser(Integer.parseInt(id)); }
	 */
    
    @RequestMapping(value={"/user/list"}, method=RequestMethod.GET)
    public List<User> getUserList(){
    	return userService.selectUserList();
    }
	
}
