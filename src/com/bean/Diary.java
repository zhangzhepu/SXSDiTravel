package com.bean;

import java.sql.Blob;

public class Diary {
	private int diaryId;
	private String diaryTitle;
	private String diaryImage;
	private Blob diaryContent;
	public Blob getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(Blob diaryContent) {
		this.diaryContent = diaryContent;
	}
	private String diaryTime;
	private int userId;
	private int readTimes;
	public int getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(int diaryId) {
		this.diaryId = diaryId;
	}
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	public String getDiaryImage() {
		return diaryImage;
	}
	public void setDiaryImage(String diaryImage) {
		this.diaryImage = diaryImage;
	}
	public String getDiaryTime() {
		return diaryTime;
	}
	public void setDiaryTime(String diaryTime) {
		this.diaryTime = diaryTime;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getReadTimes() {
		return readTimes;
	}
	public void setReadTimes(int readTimes) {
		this.readTimes = readTimes;
	} 

}
