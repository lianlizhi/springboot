package com.example.springboot.service;

import java.util.List;

import com.example.springboot.model.SysRole;

public interface RoleService {

	List<SysRole> getRolesByUserId(String userId);

}
