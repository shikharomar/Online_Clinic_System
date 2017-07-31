<%@page import="java.sql.Date"%>
<%@page import="oracle.sql.DATE"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.uhg.ocs.bean.*,com.uhg.ocs.dao.PatientDAO,java.util.*,com.uhg.ocs.service.*"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="PatientMaster.html"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request approval</title>
<link rel="stylesheet" href="style.css">
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
			<div class="col-sm-5">
				<a href="PChangePasswordForm.jsp"><jsp:getProperty
						property="userID" name="user" /></a>
			</div>
			<div class="col-sm-2">
				<a href="PatientHome.jsp">Home</a>
			</div>
			<div class="col-sm-2">
				<a href="logout.jsp">Logout</a>
			</div>
		</div>
	</div>
	
	<%
		String patid = PatientDAO.getpatientID(user.getUserID());
		String docid = request.getParameter("doctorID");
		String date = request.getParameter("mydate");
		String mes = null;
		int status = Patient.requestforAppointment(docid, patid, date);
		if (status == -1) {
			mes = "Request Failed";
		} else if (status == 0)
			mes = "Request Pending";
		else
			mes = "Request Success,SlotNumber:" + status;
	%>
	<div style="padding-left: 150px;">
		<div class="container">
			<h3><%=mes %></h3>
		</div>
	</div>

</body>
</html>