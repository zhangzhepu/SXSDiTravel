package com.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.User;
import com.dao.UserDao;
import com.utils.HibernateUtils;

public class UserDaoImpl implements UserDao {

	public boolean addUser(User user) {
		boolean flag = false;
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			session.save(user);

			tx.commit();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return flag;
	}

	public boolean checkMail(String mail) {
		boolean flag = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session.createQuery("from User where userMail=?");
			query.setString(0, mail);
			List<User> userList = query.list();

			System.out.println(userList.size());
			if (userList.size() == 0) {
				flag = true;
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return flag;
	}

	public static void main(String... args) {
		System.out.println(new UserDaoImpl().checkMail("123@qq.com"));
	}

	public User checkLogin(User user) {
		User user1 = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session
					.createQuery("from User where userMail=? and userPwd = ?");
			query.setString(0, user.getUserMail());
			query.setString(1, user.getUserPwd());
			List<User> userList = query.list();

			System.out.println(userList.size());
			if (userList.size() > 0) {
				user1 = userList.get(0);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return user1;
	}

}
