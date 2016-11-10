package com.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.utils.MD5;

public class RegAction extends HttpServlet {
	private UserDao userdao = new UserDaoImpl();

	/**
	 * Constructor of the object.
	 */
	public RegAction() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String userMail = req.getParameter("stu_mail");
		String userName = req.getParameter("stu_name");
		String userPwd = req.getParameter("stu_pwd");
		String userSex = req.getParameter("user_sex");

		String userBirth = req.getParameter("year") + "-"
				+ req.getParameter("month") + "-" + req.getParameter("day");
		String userHome = req.getParameter("s2");

		// 进行MD5加密
		userPwd = new MD5().GetMD5Code(userPwd);

		User user = new User();
		user.setUserMail(userMail);
		user.setUserPwd(userPwd);
		user.setUserName(userName);
		user.setUserSex(userSex);
		user.setUserBirth(userBirth);
		user.setUserHome(userHome);
		
		if (userdao.addUser(user)) {
			resp.sendRedirect("../login1.jsp?id=1&mail="+userMail);
		}

		/*if (userdao.addUser(user)) {

			PrintWriter out = resp.getWriter();
			out.print("[{\"regin\":\"success\"}]");

		} else {
			req.setAttribute("stu_mail", userMail);
			req.getRequestDispatcher("login.jsp?id=1").forward(req, resp);
		}*/
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
