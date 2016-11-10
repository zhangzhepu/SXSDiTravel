package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.DiaryFull;
import com.bean.Places;
import com.bean.User;
import com.dao.PlaceDao;
import com.utils.HibernateUtils;

public class PlaceDaoImpl implements PlaceDao {

	public boolean addPlace(Places places) {
		boolean flag = false;
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			session.save(places);

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

	public List<Places> searchPlace(String wd) {
		List<Places> list = new ArrayList<Places>();
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();
			
			String hql = "FROM Places AS p WHERE p.placeName LIKE :param or p.placeInfo LIKE :param";
			Query query = session.createQuery(hql);
			query.setString("param", "%" + wd + "%");

			list = query.list();

			System.out.println(list.size());
			if (list.size() == 0) {
				list= null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return list;
	}
	
	public static void main(String[] args) {
		Places list =  new PlaceDaoImpl().getPlace(10005+"") ;
		System.out.println(list.getPlaceInfo());
	}

	public Places getPlace(String id) {
		List<Places> place = new ArrayList<Places>();
		Places p = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session.createQuery("from Places where  placeId=?");
			query.setString(0, id);
			place = query.list();
			if (place.size() > 0) {
				p = place.get(0);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return p;
	}

	public List<Places> searchPlaceRandom() {
		// TODO Auto-generated method stub
		List<Places> list = new ArrayList<Places>();
		Session session = null;
		session = HibernateUtils.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from Places order by rand()");
		query.setMaxResults(8);
		list = query.list();
		return list;
	}

	public List<Places> searchPlaceTop() {
		// TODO Auto-generated method stub
		List<Places> list = new ArrayList<Places>();
		Session session = null;
		session = HibernateUtils.getSession();
		session.beginTransaction();
		Query query = session.createQuery("from Places order by placeHot desc");
		query.setMaxResults(8);
		list = query.list();
		return list;
	}
	

}
