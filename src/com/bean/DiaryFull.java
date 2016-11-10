package com.bean;

public class DiaryFull {
	public DiaryFull( Diary diary, String userName) {
		super();
		this.diary = diary;
		this.userName = userName;
	}
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private Diary diary;
	private String userName;
	public Diary getDiary() {
		return diary;
	}
	public void setDiary(Diary diary) {
		this.diary = diary;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

}
