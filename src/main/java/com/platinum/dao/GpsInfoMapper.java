package com.platinum.dao;

import java.io.IOException;
import java.util.List;

import com.platinum.pojo.GpsInfoPojo;

public interface GpsInfoMapper {
	public int insertGpsInfo(GpsInfoPojo gpsInfoPojo) throws IOException;
	public List<GpsInfoPojo> getAllGps();
//	public GpsInfoPojo getLastestGps() throws IOException;
//	public List<GpsInfoPojo> getAllGps() throws IOException;
}
