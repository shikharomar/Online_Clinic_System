<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="PatientMaster.html"%>

<%@ page
	import="com.uhg.ocs.dao.PatientDAO,com.uhg.ocs.bean.*,java.util.*,com.uhg.ocs.service.Patient,com.uhg.ocs.service.Reporter"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>

	<%
		String patientid = PatientDAO.getpatientID(user.getUserID());
		PatientBean pat = Patient.viewailmentdetails(patientid);
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

	<div style="padding-left: 150px;">
		<h3 style="text-align: center;">View Ailment details</h3>
		<div class="row">
			<div class="col-sm-4 alr">
				<label class="control-label">Enter ailment type</label>
			</div>
			<div class="col-sm-6">
				<input type="text" class="form-control"
					value="<%=pat.getAilmentType()%>" readonly="readonly">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 alr">
				<label class="control-label">Enter ailment details</label>
			</div>
			<div class="col-sm-6">
				<input type="text" class="form-control"
					value="<%=pat.getAilmentDetails()%>" readonly="readonly">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 alr">
				<label class="control-label">Enter appointment date</label>
			</div>
			<div class="col-sm-6">
				<input type="date" class="form-control"
					value="<%=pat.getAppointmentDate()%>" readonly="readonly">
			</div>
		</div>
	</div>

</body>
</html>