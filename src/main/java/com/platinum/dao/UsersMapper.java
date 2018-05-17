package com.platinum.dao;

import java.util.HashMap;
import java.util.List;

import com.platinum.pojo.Pages;
import com.platinum.pojo.UsersPojo;

public interface UsersMapper {
	//获取单个管理员信息
	public UsersPojo getUser(UsersPojo usersPojo);
	//获取单页管理员（5条），分页用
	public List<UsersPojo> getUserByPage(HashMap map);
	//获取全部管理员信息
	public List<UsersPojo> getAllUsers();
	//添加管理员信息
	public Integer insertUser(UsersPojo usersPojo);
}
