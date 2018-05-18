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
public class CarInfoPojo {
	private Integer id;
	private String number;
	private Date buyDate;
	private Integer carYears;
	private String type;
	private Integer staus;
}
