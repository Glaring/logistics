package com.platinum.service.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.platinum.dao.GpsInfoMapper;
import com.platinum.pojo.GpsInfoPojo;
import com.platinum.service.GpsInfoService;

@Service
public class GpsInfoServiceImpl implements GpsInfoService {
	@Autowired
	private GpsInfoMapper gpsInfoMapper;
	
	public int insertGpsInfo(GpsInfoPojo gpsInfoPojo) throws IOException {
		// TODO Auto-generated method stub
		return gpsInfoMapper.insertGpsInfo(gpsInfoPojo);
	}

	@Override
	public List<GpsInfoPojo> getAllGps(){
		// TODO Auto-generated method stub
		return gpsInfoMapper.getAllGps();
	}

}
