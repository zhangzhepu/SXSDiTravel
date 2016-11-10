<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bean.*"%>
<%@ page import="com.dao.impl.*"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<Diary> diarysbycount = new DiaryDaoImpl().getAllDiaryByCount();
		 //String content = null;  
		// Blob b;
		
			//content = new String(b.getBytes((long)1, (int)b.length()));
		int i=0;
%>
<div class="tuwen">
	<h3>点击排行</h3>
	<ul>
		<%for(Diary d:diarysbycount){ 
		i++;
		if(i==6)break;
		%>
	
			<li><a href='servlet/ShowDiaryAction?diaryId=<%=d.getDiaryId()%>'><img
					width="70px" height="50px" src='<%=d.getDiaryImage()%>'><b><%=d.getDiaryTitle() %></b>
			</a>
				<p>
					<span class="tulanmu"><a href='servlet/ShowDiaryAction?diaryId=<%=d.getDiaryId()%>'><%=(d.getDiaryTime()).substring(0,10) %></a> </span><span
						class="tutime"><%=d.getReadTimes() %></span>
				</p>
			</li>
			<%} %>
	</ul>
</div>