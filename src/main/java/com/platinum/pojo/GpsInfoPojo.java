package com.platinum.pojo;

import java.sql.Date;

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
public class GpsInfoPojo {
	//主键，id号
	private Integer id;
	//订单号
	private Integer orderId;
	//经度
	private Float longitude;
	//纬度
	private Float latitude;
	//传回经纬度的时间
	private Date time;
}
