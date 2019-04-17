package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.UserMapper;
import com.example.demo.model.User;
import com.example.demo.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper mapper ;
	
	@Override
	public List<User> selectUserList() {
		// TODO Auto-generated method stub
		return mapper.selectByExample(null);
	}

}
