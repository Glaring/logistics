package com.platinum.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.platinum.dao.UsersMapper;
import com.platinum.pojo.Pages;
import com.platinum.pojo.UsersPojo;
import com.platinum.service.UsersService;
import com.sun.javafx.collections.MappingChange.Map;

@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersMapper usersMapper;
	
	@Override
	public UsersPojo getUser(UsersPojo usersPojo) {
		// TODO Auto-generated method stub
		return usersMapper.getUser(usersPojo);
	}

	@Override
	public List<UsersPojo> getUserByPage(Pages pages) {
		// TODO Auto-generated method stub
		Integer rowStart = (pages.getPages()-1)*pages.getLimit();
		HashMap map = new HashMap();
		map.put("rowStart", rowStart);
		map.put("limit", pages.getLimit());
		return usersMapper.getUserByPage(map);
	}

	@Override
	public Pages getPagesInfo(Pages pages) {
		// TODO Auto-generated method stub
		Pages page = new Pages();
		page.setCount(usersMapper.getAllUsers().size());
		page.setLimit(pages.getLimit());
		page.setPages(pages.getPages());
		Integer totalPages = 0;
		if(page.getCount() % page.getLimit() != 0) {
			totalPages = page.getCount() / page.getLimit() + 1;
		}else {
			totalPages = page.getCount() / page.getLimit();
		}
		page.setTotalPages(totalPages);
		return page;
	}

	@Override
	public Integer insertUser(UsersPojo usersPojo) {
		// TODO Auto-generated method stub
		return usersMapper.insertUser(usersPojo);
	}
	
	
}
