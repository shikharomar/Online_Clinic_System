<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.uhg.ocs.service.Administrator"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<%@page import="com.uhg.ocs.util.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modifying details......</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	<%
		if (user.getUserID() == null || !User.login(user).equals("A")) {
			response.sendRedirect("ErrorPage.jsp");
		}
	%>
	<div class="container-fluid" style="background-color: #D3D3D3;">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-5"><a href="ChangePasswordForm.jsp"><jsp:getProperty property="userID"
					name="user" /></a></div>
			<div class="col-sm-2">
				<a href="AdminHome.jsp">Home</a>
			</div>
			<div class="col-sm-2">
				<a href="logout.jsp">Logout</a>
			</div>
		</div>
	</div>


	<jsp:useBean id="upDocBean" class="com.uhg.ocs.bean.DoctorBean"></jsp:useBean>
	<jsp:setProperty property="*" name="upDocBean" />

	<div class="row">
		<div class="col-sm-5 col-sm-offset-2">
			<%
				if (Administrator.modifyDoctor(upDocBean)) {
					out.println("<h4>Updated doctor details</h4>");
				} else {
					out.println("<h4>cannot Update doctor details</h4>");
				}
			%>
		</div>
	</div>
</body>
</html>