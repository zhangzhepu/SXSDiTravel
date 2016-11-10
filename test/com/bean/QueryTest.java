package com.bean;

import java.util.List;
import junit.framework.TestCase;

import org.hibernate.Query;
import org.hibernate.Session;

import com.utils.HibernateUtils;


public class QueryTest extends TestCase {

	public void testQuery() {
		Session session = null;
		try {
			session = HibernateUtils.getSession();
			session.beginTransaction();
	
			Query query = session.createQuery("from User where userMail = '1234@qq.com'");
			List<User> userList = query.list();
			
			if(userList.size()>0){
				System.out.println("该邮箱已被注册");
			}else{
				System.out.println("OK");
			}
			
			/*for(User user:userList){
				System.out.println(user.getUserId());
				System.out.println(user.getUserName());
				
			}*/

			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtils.closeSession(session);
		}
	}

}
