package com.recommend;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Places;

public class Random extends BaseDao {

	public List<Places> getAllUsers() {
		List<Places> arr = new ArrayList<Places>();
		String sql = "SELECT * FROM users where userStatus='0' order by userNumber";
		this.executeQuery(sql);
		Places user = null;
		try {
			while (rs.next()) {
				user = new Places();
				arr.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}

}
