package com.example.springboot.service;

import java.util.List;

import com.example.springboot.model.SysMenu;

public interface MenuService {

	List<SysMenu> getMenusByUserId(String userId);

}
