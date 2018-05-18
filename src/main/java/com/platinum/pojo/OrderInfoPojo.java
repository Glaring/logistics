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
	private Integer id;
	private String carType;
	private String destination;
	private String origin;
	private Date orderDate;
	private Date finishDate;
	private Integer driverId;
	private Integer carId;
	private Integer status;
}
