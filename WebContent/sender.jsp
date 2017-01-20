<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sender" method="post">
<label>Name:</label><input type="text" name="name" id="name"/><br>
<label>Date of Delivery:</label><input type="date" name="ddate" id="dd"/><br>
<label>Email:</label><input type="email" name="email" id="em"/><br>
<label>Phone:</label><input type="tel" name="phone" id="ph"/><br>
<label>Weight of Package:</label><input type="number" name="weight" id="w"/><br>
</form>
<input type="submit" value="Submit" id="sub"/>
<input type="reset" value="Reset"/>
</body>
</html>