<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%
    String URL = "jdbc:mysql://localhost:3306/airline_db";
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String USER = "root";
    String PASS = "3070";
    Connection conn=null;
    try {
    	Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(URL,USER,PASS);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
    	boolean flag = false;
    	Statement s = conn.createStatement();
    	String sql = "select * from sender_details";
    	ResultSet rs = s.executeQuery(sql);
    	%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Customers </title>
</head>
<body>
<%
while(rs.next()){
%>
<h1>Customers</h1>
<table>
	   <tr><td><%out.println(rs.getString("Name")); %></td></tr>
       <tr><td><%out.println(rs.getString("Ddate")); %></td></tr>
       <tr><td><%out.println(rs.getString("Email")); %></td></tr>
       <tr><td><%out.println(rs.getString("Phone")); %></td></tr>
       <tr><td><%out.println(rs.getInt("Weight")); %></td></tr>
       <tr><td><%out.println(rs.getString("Source")); %></td></tr>
       <tr><td><%out.println(rs.getString("Destination")); %></td></tr>
       <tr><td><%out.println(rs.getString("Id")); %></td></tr>
</table>
    <%	}%>


</body>
</html>