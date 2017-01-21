<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% //maintining session
		String ss = (String)session.getAttribute("sessionId");
		String username="";
		boolean flag = false;
	//if session isnt set redirect to loginPage
		if(ss == null || ss.isEmpty()){
			response.sendRedirect("login.jsp?status=2");
		}else{
			String URL = "jdbc:mysql://localhost:3306/wingman_db";
			String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			String USER = "root";
			String PASS = "3070";
			Connection conn = null;
	        try {
	        	Class.forName(JDBC_DRIVER);
	    		conn = DriverManager.getConnection(URL,USER,PASS);
	    	} catch (SQLException e) {
	    		// TODO Auto-generated catch block
	    		e.printStackTrace();
	    	} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        ResultSet rs = conn.createStatement().executeQuery("SELECT * from login_session");
	        while(rs.next()){
	        	if(rs.getString("Sessionid").equals(ss))	{
	        		username = rs.getString("username");
	        		flag = true;
	        	}
	        }
	        if(!flag){
	        	session.removeAttribute("sessionId");
	        	response.sendRedirect("login.jsp?status=2");
	        }
		}
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sender" method="post">
<input type="hidden" name="name" value="<%=username%>"/><br>
<label>Date of Delivery:</label><input type="date" name="ddate" id="dd"/><br>
<label>Email:</label><input type="email" name="email" id="em"/><br>
<label>Phone:</label><input type="tel" name="phone" id="ph"/><br>
<label>Weight of Package:</label><input type="number" name="weight" id="w"/><br>
</form>
<input type="submit" value="Submit" id="sub"/>
<input type="reset" value="Reset"/><br>
			<a href="homepage.jsp">Homepage</a>

</body>
</html>