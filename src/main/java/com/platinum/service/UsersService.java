package com.platinum.service;

import java.util.List;

import com.platinum.pojo.Pages;
import com.platinum.pojo.UsersPojo;

public interface UsersService {
	// 获取单个用户信息
	public UsersPojo getUser(UsersPojo usersPojo);

	// 获取单页管理员（5条），分页用
	public List<UsersPojo> getUserByPage(Pages pages);
	
	//获取页数信息
	public Pages getPagesInfo(Pages pages);
	
	//增加管理员
	public Integer insertUser(UsersPojo usersPojo);
}
