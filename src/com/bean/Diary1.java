package com.bean;

import java.sql.Blob;

public class Diary1 {
	private int diaryId;
	private String diaryTitle;
	private String diaryImage;
	private String diaryContent;
	private String userName;
	public String getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
