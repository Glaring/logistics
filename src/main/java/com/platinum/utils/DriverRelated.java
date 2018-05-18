package com.platinum.utils;

import java.util.List;

import lombok.Getter;

@Getter
public enum DriverRelated {
	B2("重型载货", "中型载货", "小型载货", "微型载货", "小型自动挡载货", "微型自动挡载货"),
	C1("小型载货", "微型载货", "小型自动挡载货", "微型自动挡载货"),
	C2("小型自动挡载货", "微型自动挡载货");
	
	private List<String> carTypeList;
	
	DriverRelated(String... carType) {
		for (String str : carType) {
			this.carTypeList.add(str);
		}
	}
}
