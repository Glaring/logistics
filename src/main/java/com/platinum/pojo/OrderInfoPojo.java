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
public class OrderInfoPojo {
	//主键，id号
	private Integer id;
	//需要的车类型
	private String carType;
	//目的地
	private String destination;
	//出发地
	private String origin;
	//下单时间
	private Date orderDate;
	//完成时间
	private Date finishDate;
	//分配的司机Id
	private Integer driverId;
	//分配的车辆Id
	private Integer carId;
	//状态位，0为已完成，1为未处理，2为运输中
	private Integer status;
	//前台可视化的状态信息，根据状态位status，调用setter(TransUtils.getOrderStatus(status))方法获得
	private String orderStatus; 
}
