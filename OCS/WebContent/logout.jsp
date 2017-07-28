<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.uhg.ocs.util.Authentication"%>
<%@page import="com.uhg.ocs.util.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging out</title>
</head>
<body>

	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="user" />

	<%
		Authentication.changeLoginStatus(user, 0);
		session.invalidate();
		response.sendRedirect("OCSHome.jsp");
	%>

</body>
</html>