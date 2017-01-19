<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Signup Page</title>
</head>
<body>
<form action="Register" method="post">
<label>First Name:</label><input type="text" name="firstname" id="fn"/><br>
<label>Last Name:</label><input type="text" name="lastname" id="ln"/><br>
<label>Age:</label><input type="number" name="age"/><br>
<label>Email:</label><input type="email" name="email" id="em"/><br>
<label>Phone:</label><input type="tel" name="phone" id="ph"/><br>
<label>DOB:</label><input type="date" name="dob"/><br>
<label>Address:</label><input type="text" name="add"/><br>
<label>Username:</label><input type="text" name="username" id="un"/><br>
<label>Password:</label><input type="password" name="password" id="pass"><br>
<label>Confirm Password:</label><input type="password" name="cpassword" id="cpass"><br>
<input type="submit" value="Sign Up" id="sub" onclick="return Validate()"/>
<input type="reset" value="Reset"/>
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("pass").value;
        var confirmPassword = document.getElementById("cpass").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</form>
</body>
</html>