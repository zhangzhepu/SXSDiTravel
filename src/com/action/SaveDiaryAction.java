package com.action;

import java.io.IOException;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.hibernate.Hibernate;

import com.bean.Diary;
import com.bean.User;
import com.dao.DiaryDao;
import com.dao.impl.DiaryDaoImpl;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageDecoder;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.utils.MD5;

public class SaveDiaryAction extends HttpServlet {
	
	private Diary diary ;
	private DiaryDao diaryDao = new DiaryDaoImpl();
	

	/**
	 * Constructor of the object.
	 */
	public SaveDiaryAction() {
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

		req.setCharacterEncoding("GBK");
		resp.setCharacterEncoding("GBK");
		SmartUpload smart = new SmartUpload();
		smart.initialize(super.getServletConfig(), req, resp);
		try {
			smart.upload();
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		String xuelie = "";
		for (int i = 0; i < smart.getFiles().getCount(); i++) {
			com.jspsmart.upload.File img = smart.getFiles().getFile(i);
			if (img != null && img.getSize() > 0) {
				xuelie = UUID.randomUUID().toString() + "." + img.getFileExt();
				//System.out.println("文件名" + img.getFileName());
				//System.out.println("文件大小" + img.getSize() / 1000);
				try {
					img.saveAs("/Upload/" + xuelie);
					xuelie = "Upload/" + xuelie;
				} catch (SmartUploadException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(xuelie.length()==0){
			xuelie ="images/moren.png";
		}
		String diaryTitle = smart.getRequest().getParameter("title");
		String diaryContent = smart.getRequest().getParameter("content");
		int userId = Integer.parseInt(smart.getRequest().getParameter("userId"));
		SimpleDateFormat dateformat1 = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String diaryImage = xuelie;
		String diaryTime = dateformat1.format(new Date());
		System.out.println("文章标题：\t"+diaryTitle + "\n图片位置：\t" + diaryImage + "\n文章内容：\t" + diaryContent + "\n作者ID：\t"
				+ userId + "\n生成时间：\t"+diaryTime+"\n");
		diary = new Diary();
		
		int readTimes = 0;
		
		diary.setDiaryTitle(diaryTitle);
		diary.setDiaryImage(diaryImage);
		Blob blob = Hibernate.createBlob(diaryContent.getBytes());
		diary.setDiaryContent(blob);
		diary.setUserId(userId);
		diary.setReadTimes(readTimes);
		diary.setDiaryTime(diaryTime);
		
		if(diaryDao.addDiary(diary)){
			List<Diary> diaryList = new DiaryDaoImpl().getUserDiary(userId);
			req.getSession().setAttribute("diaryList", diaryList);
			resp.sendRedirect("../diary.jsp");
		}else{
			resp.getWriter().print("写日志出错");
		}
		
		
		
		

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
	}

}
