package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Diary;
import com.bean.User;
import com.dao.UserDao;
import com.dao.impl.DiaryDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.utils.MD5;

public class LoginAction extends HttpServlet {
	private UserDao userdao = new UserDaoImpl();

	/**
	 * Constructor of the object.
	 */
	public LoginAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String userMail=(String)request.getParameter("stu_mail");
		String userPwd=(String)request.getParameter("stu_pwd");
		StringBuffer requestUrl = request.getRequestURL();
		userPwd = new MD5().GetMD5Code(userPwd);
		User user= new User();
		
		user.setUserMail(userMail);
		user.setUserPwd(userPwd);
		
		System.out.println(requestUrl);
		User userLogin=userdao.checkLogin(user);
		if(userLogin==null){
			request.setAttribute("stu_mail", userMail);
			request.setAttribute("stu_pwd", userPwd);
			response.sendRedirect("../login1.jsp?id=0&mail="+userMail);		
		}else{
			List<Diary> diaryList = new DiaryDaoImpl().getUserDiary(userLogin.getUserId());
			request.getSession().setAttribute("diaryList", diaryList);
			request.getSession().setAttribute("user", userLogin);
			response.sendRedirect("../index.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
