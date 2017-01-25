<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%
    String URL = "jdbc:mysql://localhost:3306/wingman_db";
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String USER = "root";
    String PASS = "3070";
    Connection conn=null;
    try {
    	Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL,USER,PASS);
	} catch (SQLException e) {
		e.printStackTrace();
	} 
    	Statement s = conn.createStatement();
    	String sql = "select * from Customer_Details";
    	ResultSet rs = s.executeQuery(sql);
    	%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Customers </title>
</head>
<body>
<h1>Customers</h1>
<%
while(rs.next()){
%>
<table>
	  <tr><td><%out.println(rs.getString("FirstName")); %></td></tr>
       <tr><td><%out.println(rs.getString("LastName")); %></td></tr>
       <tr><td><%out.println(rs.getInt("Age")); %></td></tr>
       <tr><td><%out.println(rs.getString("Email")); %></td></tr>
       <tr><td><%out.println(rs.getString("Phone")); %></td></tr>
       <tr><td><%out.println(rs.getString("DOB")); %></td></tr>
       <tr><td><%out.println(rs.getString("Address")); %></td></tr>
       <tr><td><%out.println(rs.getString("Username")); %></td></tr>
</table>
    <%	}%>


</body>
</html>