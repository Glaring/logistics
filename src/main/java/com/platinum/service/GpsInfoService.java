package com.platinum.service;

import java.io.IOException;
import java.util.List;

import com.platinum.pojo.GpsInfoPojo;

public interface GpsInfoService {
	public int insertGpsInfo(GpsInfoPojo gpsInfoPojo) throws IOException;
	public List<GpsInfoPojo> getAllGps() throws IOException;
}
