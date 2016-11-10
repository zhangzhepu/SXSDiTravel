package com.dao.impl;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Diary;
import com.bean.Diary1;
import com.bean.DiaryFull;
import com.bean.User;
import com.dao.DiaryDao;
import com.utils.HibernateUtils;

public class DiaryDaoImpl implements DiaryDao {

	public boolean addDiary(Diary diary) {
		boolean flag = false;
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();

			session.save(diary);

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

	public List<Diary> getUserDiary(int userId) {
		List<Diary> diaryList = new ArrayList<Diary>();

		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session
					.createQuery("from Diary where userId=? order by diaryTime desc");
			query.setLong(0, userId);
			diaryList = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return diaryList;
	}

	public List<Diary1> getAllDiaryByTime() {
		List<DiaryFull> diaryList = new ArrayList<DiaryFull>();

		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session
					.createQuery("select new DiaryFull(diary,user.userName) from Diary diary ,User user where  diary.userId=user.userId order by diaryTime desc");
			diaryList = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		
		String content = null;  
		 Blob b;
		 Diary1 diary;
		 List<Diary1> diaryListsss = new ArrayList<Diary1>();
		 //System.out.println(diaryList.size());
		for(DiaryFull d:diaryList){
			//System.out.println(d.getDiary().getDiaryTitle());
			diary = new Diary1();
			diary.setDiaryId(d.getDiary().getDiaryId());
			diary.setDiaryTitle(d.getDiary().getDiaryTitle());
			diary.setDiaryImage(d.getDiary().getDiaryImage());
			diary.setUserName(d.getUserName());
			diary.setDiaryTime(d.getDiary().getDiaryTime());
			diary.setReadTimes(d.getDiary().getReadTimes());
			b=d.getDiary().getDiaryContent();
			
			try {
				content = new String(b.getBytes((long)1, (int)b.length()));
				diary.setDiaryContent(content);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			diaryListsss.add(diary);
		}
		return diaryListsss;
	}

	public static void main(String[] args) {
		
		List<Diary1> diaryLists = new DiaryDaoImpl().getAllDiaryByTime();
		
		/*
		 * List<Diary> diaryList = new DiaryDaoImpl().getUserDiary(1); for
		 * (Diary d : diaryList) { System.out.println(d.getDiaryContent()); }
		 */
	}

	public DiaryFull getDairyById(int diaryId) {
		List<DiaryFull> diaryList = new ArrayList<DiaryFull>();
		DiaryFull diary = null;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session.createQuery("select new DiaryFull(diary,user.userName) from Diary diary ,User user where  diary.userId=user.userId and diary.diaryId = ? order by diaryTime desc");
			query.setLong(0, diaryId);
			diaryList = query.list();
			if (diaryList.size() > 0) {
				diary = diaryList.get(0);
			}
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return diary;
	}

	public boolean scanDiary(int diaryId) {
		Boolean flag = false;
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Diary diary = (Diary) session.get(Diary.class, diaryId);
			diary.setReadTimes(diary.getReadTimes() + 1);
			session.save(diary);
			session.getTransaction().commit();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return flag;
	}

	public List<Diary> getAllDiaryByCount() {
		List<Diary> diaryList = new ArrayList<Diary>();

		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();

			Query query = session
					.createQuery("from Diary order by readTimes desc");
			diaryList = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
		return diaryList;
	}

}
