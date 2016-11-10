package com.bean;

import java.util.Date;

import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.utils.HibernateUtils;

public class SessionTest extends TestCase {

	public void testSave1() {
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			User user = new User();
			user.setUserName("王吊");
			user.setUserMail("123@qq.com");
			user.setUserPwd("123456");
			user.setUserSex("男");
			user.setUserBirth("1988-11-19");
			user.setUserHome("西安市");
			

			session.save(user);

			//user.setName("锟斤拷锟斤拷");
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
	}

	public void testReadByGetMethod(){
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();
			User user = (User)session.get(User.class,1);
			System.out.println(user.getUserName());
			//user.setName("锟斤拷禄锟�);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();	
		}finally{
			HibernateUtils.closeSession(session);
		}
	}

	public void testUpdate() {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();
			User user = new User();
			//user.setId("8a16457b4ad93d01014ad93d02a70001");
			//user.setName("ahah");
			session.update(user);

			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
	}

	public void testDelete() {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();
			User user = (User) session.get(User.class,
					"8a16457b4ad93d01014ad93d02a70001");

			session.delete(user);

			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
	}

}
