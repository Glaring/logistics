package com.platinum.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.platinum.pojo.Pages;
import com.platinum.pojo.UsersPojo;
import com.platinum.service.UsersService;

@Controller
@SessionAttributes("user")
public class UsersController {

	@Autowired
	private UsersService usersService;

	// 根据登陆凭证返回用户身份，前台进行跳转
	@ResponseBody
	@RequestMapping("login")
	public String getUrl(UsersPojo usersPojo, ModelMap modelMap) {
		UsersPojo user = usersService.getUser(usersPojo);
		if (user != null) {
			modelMap.addAttribute("user", user);
			if (user.getIdentity() == 1) {
				return "superAdmin";
			}
			if (user.getIdentity() == 2) {
				return "normalAdmin";
			}
		}
		return "failed";
	}

	// 分页查询管理员信息
	@ResponseBody
	@RequestMapping("getUserByPage")
	public List<UsersPojo> getUserByPage(Pages pages) {
		List<UsersPojo> list = usersService.getUserByPage(pages);
		return list;
	}

	// 分页信息
	@ResponseBody
	@RequestMapping("getPagesInfo")
	public Pages getPagesInfo(Pages pages) {
		return usersService.getPagesInfo(pages);
	}
	
	//增添管理员
	@RequestMapping("insertUser")
	@ResponseBody
	public Integer insertUser(UsersPojo usersPojo) {
		return usersService.insertUser(usersPojo);
	}
}
