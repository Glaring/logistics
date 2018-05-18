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
public class driverInfoPojo {
	private Integer id;
	private String name;
	private String sex;
	private Integer telePhone;
	private String license;
	private Date licenseDate;
	private Integer driverYears;
	private Integer status;
}
