package com.platinum.utils;

import java.util.List;

import lombok.Getter;

@Getter
public enum CarRelated {
	B21("重型载货车", "A1", "A2", "B2"),
	B22("中型载货车", "A1", "A2", "B2"),
	C11("小型载货车", "A1", "A2", "A3", "B1", "B2", "C1"),
	C12("微型载货车", "A1", "A2", "A3", "B1", "B2", "C1"),
	C21("小型自动挡载货车", "A1", "A2", "A3", "B1", "B2", "C1", "C2"),
	C22("微型自动挡载货车", "A1", "A2", "A3", "B1", "B2", "C1", "C2");
	
	private List<String> driverLicenseList;
	private String carType;
	
	CarRelated(String carType, String... license) {
		this.carType = carType;
		for (String str : license) {
			this.driverLicenseList.add(str);
		}
	}
}
