<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="useraction.rbis?action=save" method="post">
		
	<fieldset>
    <legend>Registration Info:</legend>
		<table align="center">
			<tr>
				<td>User name:</td>
				<td><input type="text" name="user_name"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Role id</td>
				<td><input type="text" name="role_id"></td>
			</tr>
			
			<tr>
				<td>Email id</td>
				<td><input type="text" name="email_id"></td>
			</tr>
			<tr>
				<td>DOB</td>
				<td><input type="text" name="dob"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>First name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit"></td>
				<td><input type="reset" name="reset"></td>
			</tr>


		</table>
		</fieldset>
	</form>
</body>
</html>