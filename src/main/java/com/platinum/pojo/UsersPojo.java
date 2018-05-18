package com.platinum.pojo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UsersPojo {
	//主键,id号
	private Integer id;
	//用户名
	private String username;
	//密码
	private String password;
	//身份识别位，权限1为超级管理员，2为普通管理员
	private Integer identity;
	
}
