<%@page import="com.uhg.ocs.dao.AppointmentsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Rejected Appointment</title>
</head>
<body>
	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	<%
		if (user.getUserID() == null) {
			response.sendRedirect("ErrorPage.jsp");
		}
	%>
	<div class="container-fluid" style="background-color: #D3D3D3;">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-5"><jsp:getProperty property="userID"
					name="user" /></div>
			<div class="col-sm-2">
				<a href="AdminHome.jsp">Home</a>
			</div>
			<div class="col-sm-2">
				<a href="logout.jsp">Logout</a>
			</div>
		</div>
	</div>

	<%
		String mes;
		if(AppointmentsDAO.changeAppStatus(request.getParameter("appointmentID"), -1)){
			mes = "rejected patient appointment";
		}
		else{
			mes = "Cannot reject patient appointment";
		}
	%>

	<div class="row" style="padding-left: 140px;">
		<div class="col-sm-10">
			<div class="container">
				<h3><%=mes %></h3>
				<br>
				<p>please wait while we take you back............</p>
			</div>
		</div>
	</div>
	<% response.setHeader("Refresh", "3;url=PatientsRequests.jsp"); %>
</body>
</html>