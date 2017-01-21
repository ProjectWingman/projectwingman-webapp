<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<% //maintining session
		String ss = (String)session.getAttribute("sessionId");
		String username;
		boolean flag = false;
	//if session isnt set redirect to loginPage
		if(ss != null && !ss.isEmpty()){
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
	        		response.sendRedirect("homepage.jsp");
	        	}
	        }
		}
	%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login Page</title>
	</head>
	<body>
		<%
			String status = request.getParameter("status");
			if(status != null && !status.isEmpty()){
				if(status.equals("1")){
					%>Wrong Credentials<%
					
				}else if(status.equals("2")){
					%>Please Login<%
				}
			}
			
		%>
		<form action="Login" method="post">
			<label>Username:</label><input type="text" name="username" id="un"/><br>
			<label>Password</label><input type="password" name="password" id="pass"/><br>
			<input type="submit" value="Login"/>
		</form>
	</body>
</html>