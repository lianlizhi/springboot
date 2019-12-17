package com.example.demo.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;
import org.springframework.jdbc.core.CallableStatementCreator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import com.mysql.jdbc.PreparedStatement;

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
    @ResponseBody
    @RequestMapping(value={"/user/list"}, method=RequestMethod.GET)
    public List<User> getUserList(){
    	return userService.selectUserList();
    }
    
    
    @Autowired
    JdbcTemplate jdbcTemplate ;
    
    @ResponseBody
    @RequestMapping(value={"/user/all"}, method=RequestMethod.GET)
    public List<Map<String,Object>> getUserAll(){
    	String sql = "select *  from  user ";
		return jdbcTemplate.queryForList(sql);
    }
    
    
    @ResponseBody
    @RequestMapping(value={"/users"}, method=RequestMethod.GET)
    public List<String> doDeposit() {
    	@SuppressWarnings("unchecked")
		List<String> resultList = (List<String>) jdbcTemplate.execute(new CallableStatementCreator() {
    	@Override
    	public CallableStatement createCallableStatement(Connection con) throws SQLException {
    	String storedProc = "{call user_count(?,?)}";// 调用的sql
    	CallableStatement cs = con.prepareCall(storedProc);
				  cs.setInt(1, 1);
				  cs.registerOutParameter(2,java.sql.Types.INTEGER);// 注册输出参数 返回信息
				     	return cs;
    	}

    	}, new CallableStatementCallback<Object>() {
    		
    	public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException {
    	List<String> result = new ArrayList<String>();
    	cs.execute();

    	result.add(cs.getString(2));
    	return result;
    	}
    	});

    		System.out.println(resultList.get(0));
    	return resultList;

    	}
    	
    
    
    @ResponseBody
    @RequestMapping(value={"/user/insert"}, method=RequestMethod.GET)
    public int addUser(){
    	int a = 500 ;
    	
		 try {
			userService.addUser(a);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		 
		 return a ;
		 
    }
	
}
