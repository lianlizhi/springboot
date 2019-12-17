package com.example.springboot.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.springboot.mapper.SysUserMapper;
import com.example.springboot.model.SysUser;
import com.example.springboot.model.SysUserExample;
import com.example.springboot.model.SysUserExample.Criteria;
import com.example.springboot.service.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.np.sz.util.StringHelper;




@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired(required = true)
	SysUserMapper mapper ;
	
	@Override
	public List<SysUser> selectUserList() {
		// TODO Auto-generated method stub
		return mapper.selectByExample(null);
	}

	public List<Map<String, Object>> createExceldata(List<SysUser> alarmList) {
		List<Map<String, Object>> recordMapList = new ArrayList<Map<String, Object>>();
		Map<String, Object> recordMap = new HashMap<String, Object>();
		recordMap.put("sheetName", "sheet1");
		recordMapList.add(recordMap);
		for (Iterator<SysUser> iterator = alarmList.iterator(); iterator.hasNext();) {
			recordMap = new HashMap<String, Object>();
			SysUser alarm = (SysUser) iterator.next();
			// 名称
			/*recordMap.put("Name", alarm.getName());
			// 设备类型
			recordMap.put("DeviceType", alarm.getDeviceType()) ;
			//设备编号
			recordMap.put("Code", alarm.getCode()) ;
			// ip地址
			recordMap.put("IpAddress", alarm.getIpAddress()) ;
			// 端口 
			recordMap.put("Port", alarm.getPort()) ;
			//所属路段
			recordMap.put("RoadName", alarm.getRoadName()) ;
			//所属方向
			recordMap.put("Direction", alarm.getDirection()) ;*/
			recordMapList.add(recordMap);
		}
		return recordMapList;
	}

	
	@Transactional
	@Override
	public void insertUser(SysUser user) throws Exception {
		mapper.insert(user);
	}

	@Override
	public SysUser getUserByUsername(String username) {
		SysUserExample example = new SysUserExample();
		Criteria criteria = example.createCriteria();
		if(StringHelper.isNotEmpty(username)) {
			criteria.andUsernameEqualTo(username);
		}
		List<SysUser> list = mapper.selectByExample(example);
		return list.size() > 0 ? list.get(0):null ;
	}

	@Override
	public void updateUser(SysUser user) {
		// TODO Auto-generated method stub
		mapper.updateByPrimaryKey(user);
		
	}

	@Override
	public List<SysUser> getAllUser(String username, String email, String phoneNumber) {
		SysUserExample example = new SysUserExample();
		Criteria criteria = example.createCriteria();
		if(StringHelper.isNotEmpty(username)) {
			criteria.andUsernameEqualTo(username);
		}
		if(StringHelper.isNotEmpty(email)) {
			criteria.andEmailEqualTo(email);
		}
		if(StringHelper.isNotEmpty(phoneNumber)) {
			criteria.andPhonenumberEqualTo(phoneNumber);
		}
		// TODO Auto-generated method stub
		return mapper.selectByExample(example);
	}

	@Override
	public SysUser getUserById(String userId) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(userId);
	}

	@Override
	public void deleteUserByIds(List<String> ids) {
		for (String id : ids) {
			// TODO Auto-generated method stub
			mapper.deleteByPrimaryKey(id);
		}
	}

	@Override
	public boolean selectUser(SysUser user) throws Exception {
		Integer i = mapper.selectUser(user);
		return i > 0 ? true : false ;
	}

	@Override
	public void userAll() {
		int pageNum = 1 ;
		int pageSize = 10;
		PageHelper.startPage(pageNum, pageSize) ;
		//Page<SysUser> info = (Page<SysUser>)mapper.selectByExample(null);
		//List<SysUser> list = info.getResult();
		 List<SysUser> list = mapper.selectByExample(null);
		 PageInfo<SysUser>  info = new PageInfo<SysUser>(list) ;
		
		
		System.out.println(info);
	}

}
