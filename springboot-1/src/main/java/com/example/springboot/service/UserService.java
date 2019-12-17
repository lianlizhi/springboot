package com.example.springboot.service;

import java.util.List;
import java.util.Map;

import com.example.springboot.model.SysUser;

public interface UserService {


	List<SysUser> selectUserList();

	List<Map<String, Object>> createExceldata(List<SysUser> userList);

	void insertUser(SysUser user) throws Exception;

	SysUser getUserByUsername(String username);

	void updateUser(SysUser user);

	List<SysUser> getAllUser(String username, String email, String phoneNumber);

	SysUser getUserById(String userId);

	void deleteUserByIds(List<String> ids);

	boolean selectUser(SysUser user) throws Exception;

	void userAll();

}
