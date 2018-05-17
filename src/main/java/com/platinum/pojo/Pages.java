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
	private Integer pages; // 待显示页面
	private Integer count; // 总条数
	private Integer totalPages; // 总页数
	private Integer limit; // 每页显示记录条数
}
