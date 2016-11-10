package com.dao;

import java.util.List;

import com.bean.Places;

public interface PlaceDao {
	
	public boolean addPlace(Places places);
	
	public List<Places> searchPlace(String wd);
	
	public Places getPlace(String id);
	
	public List<Places> searchPlaceRandom();
	
	public List<Places> searchPlaceTop();

}
