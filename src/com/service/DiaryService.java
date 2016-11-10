package com.service;

import java.util.List;

import com.bean.Diary;
import com.bean.Diary1;
import com.bean.Places;
import com.dao.impl.DiaryDaoImpl;
import com.dao.impl.PlaceDaoImpl;

public class DiaryService {

	public List<Diary> getHotDiary() {

		List<Diary> listHot = new DiaryDaoImpl().getAllDiaryByCount();
		return listHot;
	}
	public List<Diary1> getLatestDiary() {

		List<Diary1> listHot = new DiaryDaoImpl().getAllDiaryByTime();
		return listHot;
	}
}
