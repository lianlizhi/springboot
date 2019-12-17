package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.example.demo.mapper.UserMapper;
import com.example.demo.model.User;
import com.example.demo.model.UserExample;
import com.example.demo.redis.RedisService;
import com.example.demo.service.UserService;
import com.example.demo.utils.RedisUtils;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper mapper ;
	
	@Autowired 
	RedisService redisService ;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> selectUserList() {
			
		List<User> list = new ArrayList<User>() ;
		 //System.out.println("第二次");
		 //String string = redisService.get("all");
		// List<User> list = JSON.parseArray(code, User.class);
		if(list.isEmpty()  || null == list ) {
			System.out.println(list);
			list = mapper.selectByExample(null);
			redisService.set("all", JSON.toJSON(list));
			System.out.println("第一次");
		}
		return list;
	}
	
	
	
	@Override
	//@Transactional
	public Object addUser(Integer user) throws Exception {
		UserExample example = new UserExample();
		example.createCriteria().andIdEqualTo(1);
		List<User> list = mapper.selectByExample(example);
		User user2 = list.get(0);
		user2.setUserage(user2.getUserage()+user);
			mapper.updateByExample(user2, example) ;
		int b = 10 / 0 ;
		
		UserExample example2 = new UserExample();
		example.createCriteria().andIdEqualTo(2);
		List<User> list2 = mapper.selectByExample(example);
		User user3 = list2.get(0);
		user2.setUserage(user3.getUserage()+user);
			mapper.updateByExample(user3, example) ;
			
			return null ;
			
	}

}
