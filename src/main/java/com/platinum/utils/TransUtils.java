package com.platinum.utils;

import java.util.List;

public class TransUtils {
	//根据车辆传入的status值，返回前台所需要的可视化的信息
	public static String getCarStatus(Integer status) {
		if(status == 0) {
			return "故障";
		}else if(status == 1) {
			return "空闲";
		}else {
			return "作业中";
		}
	}
	//根据司机传入的status值，返回前台所需要的可视化的信息
	public static String getDriverStatus(Integer status) {
		if(status == 0) {
			return "休假";
		}else if(status == 1) {
			return "在岗";
		}else {
			return "驾驶中";
		}
	}
	//根据订单传入的status值，返回前台所需要的可视化的信息
	public static String getOrderStatus(Integer status) {
		if(status == 0) {
			return "已完成";
		}else if(status == 1) {
			return "未处理";
		}else {
			return "运送中";
		}
	}
	//根据传入的驾照信息，返回所有该驾照可以开的车型的集合
	public static List<String> getCarType(String license) {
		if(DriverRelated.B2.equals(license)) {
			return DriverRelated.B2.getCarTypeList();
		}else if (DriverRelated.C2.equals(license)) {
			return DriverRelated.C2.getCarTypeList();
		}else {
			return DriverRelated.C1.getCarTypeList();
		}
	}
	//根据传入的车型信息，返回所有可以开该车型的驾照的集合
	public static List<String> getDriverLicense(String type) {
		if(CarRelated.B21.getCarType().equals(type)) {
			return CarRelated.B21.getDriverLicenseList();
		}else if (CarRelated.B22.getCarType().equals(type)) {
			return CarRelated.B22.getDriverLicenseList();
		}else if (CarRelated.C11.getCarType().equals(type)) {
			return CarRelated.C11.getDriverLicenseList();
		}else if (CarRelated.C12.getCarType().equals(type)) {
			return CarRelated.C12.getDriverLicenseList();
		}else if (CarRelated.C21.getCarType().equals(type)) {
			return CarRelated.C21.getDriverLicenseList();
		}else {
			return CarRelated.C22.getDriverLicenseList();
		}
	}
}
