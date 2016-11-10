package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;

import com.bean.Diary;
import com.bean.Places;
import com.dao.PlaceDao;
import com.dao.impl.DiaryDaoImpl;
import com.dao.impl.PlaceDaoImpl;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class AddPlaceAction extends HttpServlet {
	private PlaceDao placeDao = new PlaceDaoImpl();

	/**
	 * Constructor of the object.
	 */
	public AddPlaceAction() {
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
					img.saveAs("/Upload/place/" + xuelie);
					xuelie = "Upload/place/" + xuelie;
				} catch (SmartUploadException e) {
					e.printStackTrace();
				}
			}
		}
		
		if(xuelie.length()==0){
			xuelie ="images/moren.png";
		}
		
		String placeName = smart.getRequest().getParameter("name");
		//String placeImage = smart.getRequest().getParameter("image");
		String placeType = smart.getRequest().getParameter("type");
		String s1 = smart.getRequest().getParameter("s1");
		String s2 = smart.getRequest().getParameter("s2");
		String s3 = smart.getRequest().getParameter("s3");
		String placeLocation =s1+s2+s3;
		String ray_x = smart.getRequest().getParameter("x");
		String ray_y = smart.getRequest().getParameter("y");
		String placeInfo = smart.getRequest().getParameter("info");
		String placeRate = smart.getRequest().getParameter("rate");
		String placeCost = smart.getRequest().getParameter("cost");
		String placeHot = smart.getRequest().getParameter("hot");
		
		//int userId = Integer.parseInt(smart.getRequest().getParameter("userId"));
		/*SimpleDateFormat dateformat1 = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		String diaryImage = xuelie;
		String diaryTime = dateformat1.format(new Date());*/
		//System.out.println("文章标题：\t"+diaryTitle + "\n图片位置：\t" + diaryImage + "\n文章内容：\t" + diaryContent + "\n作者ID：\t"
		//		+ userId + "\n生成时间：\t"+diaryTime+"\n");
		Places place = new Places();
		String placeImage = xuelie;
		//int readTimes = 0;
		//String diaryImage = xuelie;
		place.setPlaceName(placeName);
		place.setPlaceImage(placeImage);
		place.setPlaceType(placeType);
		place.setPlaceLocation(placeLocation);
		place.setRay_x(ray_x);
		place.setRay_y(ray_y);
		place.setPlaceInfo(placeInfo);
		place.setPlaceRate(placeRate);
		place.setPlaceCost(placeCost);
		place.setPlaceHot(Integer.parseInt(placeHot));
		
		
		
		
		if(placeDao.addPlace(place)){
			resp.getWriter().print("添加景点成功");
		}else{
			resp.getWriter().print("添加景点出错");
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
