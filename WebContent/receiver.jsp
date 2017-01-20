<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="receiver" method="post">
<label>Name:</label><input type="text" name="name" id="name"/><br>
<label>Date of Travel:</label><input type="date" name="ddate" id="dd"/><br>
<label>Email:</label><input type="email" name="email" id="em"/><br>
<label>Phone:</label><input type="tel" name="phone" id="ph"/><br>
<label>Flight Number:</label><input type="text" name="fno"/><br>
<label>Weight allowed:</label><input type="number" name="weight" id="w"/><br>
<input type="submit" value="Submit" id="sub"/>
<input type="reset" value="Reset"/>
</form>
</body>
</html>