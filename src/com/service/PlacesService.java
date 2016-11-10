package com.service;

import java.util.List;

import com.bean.Places;
import com.dao.impl.PlaceDaoImpl;

public class PlacesService {
	public List<Places> getHotPlaces() {

		List<Places> listHot = new PlaceDaoImpl().searchPlaceTop();
		return listHot;
	}
	
}
