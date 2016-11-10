package com.recommend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDao {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1/lovo";
	private static final String DBUSER = "root";
	private static final String DBPWD = "root";
	private Connection conn;
	public Statement stmt;
	public ResultSet rs;
	
    /*
     * ������
     */
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * ��ȡ����
	 */
	private void getConn() {
		try {
			conn = DriverManager.getConnection(URL, DBUSER, DBPWD);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*
	 * ͨ�ò�ѯ
	 */
	public void executeQuery(String sql){
		getConn();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/*
	 * ִ����ɾ��
	 */
	public void executeUpdate(String sql) {
		getConn();
		try {
			this.stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
	}

	/**
	 * �ͷ���Դ
	 * 
	 * @param args
	 */
	public void closeAll() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if(stmt!=null){
				stmt.close();
				stmt=null;
			}
			if(conn!=null){
				conn.close();
				conn=null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
