package com.dao;

import com.bean.User;

public interface UserDao {
	
	public boolean addUser(User user);
	public boolean checkMail(String mail);
	public User checkLogin(User user);

}
