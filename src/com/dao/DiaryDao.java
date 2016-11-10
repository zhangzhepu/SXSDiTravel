package com.dao;

import java.util.List;

import com.bean.Diary;
import com.bean.Diary1;
import com.bean.DiaryFull;


public interface DiaryDao {
	
	public boolean addDiary(Diary diary);
	public boolean scanDiary(int diaryId);
	public List<Diary> getUserDiary(int userId);
	public DiaryFull getDairyById(int diaryId);
	public List<Diary1> getAllDiaryByTime();
	public List<Diary> getAllDiaryByCount();

}
