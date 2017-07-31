<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Welcome User!!</h3>
	<h1>Enter The Date:</h1>
	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	<form action="Requestforappointment.jsp" method="post">
		<table>
			<tr>
				<th>Date:</th>
			</tr>
			<tr>
		<input type="date" name="mydate" ><br><br>	</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>

	<br>

	<br> 

	<br>
	<br>
	<br>
	<br> click to
	<a href="contact.html">Contact US</a>

</body>

</html>