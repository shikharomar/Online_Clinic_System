<%@page import="com.uhg.ocs.service.Administrator"%>
<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<%@page import="com.uhg.ocs.util.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Suggestion completed</title>
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

	<jsp:useBean id="apb" class="com.uhg.ocs.bean.AppointmentBean"></jsp:useBean>
	<jsp:setProperty property="*" name="apb" />

	<%
		ArrayList<DoctorBean> dbl = Administrator.suggestDoctors(apb.getPatientID(), apb.getAppointmentDate());
	%>

	<div class="row" style="padding-left: 140px;">
		<div class="col-sm-10">
			<div class="container">
				<h3>Suggested patient with following alternative doctors</h3>
				<%
					for (DoctorBean db : dbl) {
				%>
				<h4><%=db.getDoctorName()%></h4>
				<br>
				<%
					}
				%>
			</div>
		</div>
	</div>

</body>
</html>