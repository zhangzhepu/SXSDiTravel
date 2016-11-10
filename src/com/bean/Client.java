package com.bean;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Client {

	public static void main(String[] args) {
		
		Configuration cfg = new Configuration().configure();
		
		SessionFactory factory = cfg.buildSessionFactory();
		
		Session session = null;
		
		try {
			session = factory.openSession();
			
			session.beginTransaction();
			User user = new User();
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			if(session!=null){
				if(session.isOpen()){
					session.close();
				}
			}
		}
		
		

	}

}
