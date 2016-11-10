<%@ page contentType="text/html; charset=gb2312"%>
<jsp:directive.page import="java.sql.Connection"/>
<jsp:directive.page import="java.sql.DriverManager"/>
<jsp:directive.page import="java.sql.PreparedStatement"/>
<jsp:directive.page import="java.sql.ResultSet"/>
<html>
  <head>
   
    
    <title></title>
    

  </head>
  
  <body>
   <%
   		//接收index传过来的p_id
   		String str_id = request.getParameter("p_id");
   		if(str_id != null){
   			int p_id = Integer.parseInt(str_id);
   			//链接数据库
   			Class.forName("com.mysql.jdbc.Driver");
   			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/lovo","root","root");
  			String sql = "select * from city where p_id = ?";
  			PreparedStatement pstmt = con.prepareStatement(sql);
  			pstmt.setInt(1,p_id);
  			ResultSet rs = pstmt.executeQuery();
  			//发送转换为XML传出去
  			response.setContentType("text/xml;charset=utf-8");
  			out.println("<province>");
  			while(rs.next()){
  				out.println("<city>");
  					out.print("<c_id>" + rs.getInt(1) + "</c_id>");
  					out.print("<c_name>" + rs.getString(2) + "</c_name>");
  				out.println("</city>");
  			}
  			out.println("</province>");
   		}
    %>
  </body>
</html>
