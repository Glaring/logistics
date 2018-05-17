package com.platinum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TurnToController {

	// 跳转到WEB-INF/jsp/superIndex.jsp页面
	@RequestMapping("superIndex")
	public String turnToSuperIndex() {
		return "superIndex";
	}

	// 跳转到WEB-INF/jsp/superIndex.jsp页面
	@RequestMapping("normalIndex")
	public String turnToNormalIndex() {
		return "normalIndex";
	}
	
	// 跳转到WEB-INF/jsp/BaiduMap2.jsp页面
	@RequestMapping("BaiduMap2")
	public String turnToBaiduMap2() {
		return "BaiduMap2";
	}
}
