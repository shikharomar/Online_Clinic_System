<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.uhg.ocs.service.Administrator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Doctor Details</title>
</head>
<body>

	<jsp:useBean id="DocBean" class="com.uhg.ocs.bean.DoctorBean"></jsp:useBean>
	<jsp:setProperty property="*" name="DocBean" />
	
	<%
		String status = Administrator.addDoctor(DocBean);
		
		out.println("Adding Doctor :"+status);
	%>
	
	<br>
	<a href="AdminHome.jsp">Click here</a> to return to home page
	
</body>
</html>