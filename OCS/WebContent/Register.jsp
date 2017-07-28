<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.uhg.ocs.util.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration status</title>
</head>
<body>
	<jsp:useBean id="ProfBean" class="com.uhg.ocs.bean.ProfileBean"></jsp:useBean>
	<jsp:setProperty property="*" name="ProfBean" />

	<h3>Registered Successfully</h3>
	<br>
	<p>please note your USER ID for login :</p>
	<%
		String userID = User.register(ProfBean);
		out.println("<h4>"+userID+"</h4>");
	%>
	<a href="OCSHome.jsp">click here</a> go login
</body>
</html>