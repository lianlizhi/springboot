package com.example.springboot.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.util.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.springboot.consts.BaseResponseInfo;
import com.example.springboot.model.SysUser;
import com.example.springboot.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@GetMapping("/{userId}")
	public SysUser getUserById(@PathVariable String userId) {
		return userService.getUserById(userId);
	}

	@PostMapping("/add")
	@RequiresPermissions("user:create")
	public BaseResponseInfo insertUser(@RequestBody SysUser user) {
		BaseResponseInfo info = new BaseResponseInfo();
		try {
			userService.insertUser(user);
			info.code = 200 ;
		} catch (Exception e) {
			// TODO: handle exception
			info.code = 500 ;
		}
		return info;
	}

	@GetMapping("/all")
	@RequiresPermissions("user:get")
	public PageInfo<SysUser> getAllUser(@RequestParam(value = "pageNum ", defaultValue = "1") int pageNum,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			@RequestParam("username") String username, @RequestParam("email") String email,
			@RequestParam("phoneNumber") String phoneNumber) {
		PageHelper.startPage(pageNum, pageSize);
		List<SysUser> users = userService.getAllUser(username, email, phoneNumber);
		PageInfo<SysUser> pageInfo = new PageInfo(users);
		return pageInfo;
	}

	@PutMapping("/update")
	@RequiresPermissions("user:update")
	public BaseResponseInfo updateUser(@RequestBody SysUser user) {
		BaseResponseInfo info = new BaseResponseInfo();
		Assert.notNull(user.getUserId(), "userId不能为空");
		  try {
			  userService.updateUser(user);
			  info.code = 200 ;
		} catch (Exception e) {
			// TODO: handle exception
			 info.code = 500 ;
		}
		  return info ;
	}

	@PutMapping("/delete")
	@RequiresPermissions("user:delete")
	public BaseResponseInfo deleteUserByIds(@RequestParam("ids") List<String> ids) {
		BaseResponseInfo info = new BaseResponseInfo();
		Assert.notEmpty(ids, "id能为空");
		try {
			 userService.deleteUserByIds(ids);
			 info.data = "刪除chenggong" ;
				info.code = 200 ;
		} catch (Exception e) {
			// TODO: handle exception
			info.data = "出現異常,刪除失敗" ;
			info.code = 500 ;
		}
		return info ;
	}
	
	
	@GetMapping("/userAll")
	public BaseResponseInfo userAll() {
		BaseResponseInfo info = new BaseResponseInfo();
		try {
			 userService.userAll();
			info.code = 200 ;
		} catch (Exception e) {
			info.code = 500 ;
		}
		return info ;
	}
	
}

