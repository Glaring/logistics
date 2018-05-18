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
public class Pages {
	// 待显示页面
	private Integer pages; 
	// 总条数
	private Integer count;
	// 总页数
	private Integer totalPages;
	// 每页显示记录条数
	private Integer limit; 
}
