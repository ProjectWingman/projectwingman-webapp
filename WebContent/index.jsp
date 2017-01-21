<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Homepage</title>
</head>
<body>
<form action="signup.jsp" method="post">
	<button>Sign Up</button>
</form>
<form action="login.jsp" method="post">
	<button>Login</button>
</form>
</body>
</html>