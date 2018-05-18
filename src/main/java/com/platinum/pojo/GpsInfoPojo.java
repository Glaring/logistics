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
	private Integer id;
	private Float longitude;
	private Float latitude;
	private Date time;
}
