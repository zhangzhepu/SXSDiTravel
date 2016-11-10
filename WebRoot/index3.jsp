<%@ page contentType="text/html; charset=gb2312"%>
<jsp:directive.page import="java.sql.*"/>

<html>
  <head>
   
    
    <title></title>
    

  </head>
  
  <body>
   <%
   		String str_id = request.getParameter("c_id");
   		if(str_id != null){
   			int c_id = Integer.parseInt(str_id);
   			Class.forName("com.mysql.jdbc.Driver");

   			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/lovo","root","root");

  			String sql = "select * from district where c_id = ?";

  			PreparedStatement pstmt = con.prepareStatement(sql);

  			pstmt.setInt(1,c_id);

  			ResultSet rs = pstmt.executeQuery();
  			response.setContentType("text/xml;charset=utf-8");
  			out.println("<city>");
  			while(rs.next()){
  				out.println("<district>");
  					out.print("<d_id>" + rs.getInt(1) + "</d_id>");
  					out.print("<d_name>" + rs.getString(2) + "</d_name>");
  				out.println("</district>");
  				//System.out.println(rs.getInt(1));
  				//System.out.println(rs.getString(2));
  			}
  			out.println("</city>");
   		}
    %>
  </body>
</html>
