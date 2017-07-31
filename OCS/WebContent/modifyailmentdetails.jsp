<%@page import="com.uhg.ocs.dao.PatientDAO"%>
<%@page import="com.uhg.ocs.bean.PatientBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="PatientMaster.html"%>
<%@page import="com.uhg.ocs.util.User" %>

<%@ page
	import="com.uhg.ocs.dao.PatientDAO,com.uhg.ocs.bean.*,java.util.*,com.uhg.ocs.service.Patient,com.uhg.ocs.service.Reporter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	<%
		if(user.getUserID() == null || !User.login(user).equals("P")){
			response.sendRedirect("ErrorPage.jsp");
		}
	%>
	<jsp:useBean id="upPatBean" class="com.uhg.ocs.bean.PatientBean"></jsp:useBean>
	<jsp:setProperty property="*" name="upPatBean" />


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

	<div style="padding-left: 150px;">
		<%
			if (Patient.modifyAilmentDetails(upPatBean)) {
				out.println("<h4>Updated doctor details</h4>");
			} else {
				out.println("<h4>cannot Update doctor details</h4>");
			}
		%>
	</div>
</body>
</html>