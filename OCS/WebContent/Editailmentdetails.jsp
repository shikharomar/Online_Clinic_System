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
<title>Edit ailments</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>

	<%
		if (user.getUserID() == null || !User.login(user).equals("P")) {
			response.sendRedirect("ErrorPage.jsp");
		}
	%>


	<%
		String patientid = PatientDAO.getpatientID(user.getUserID());
		PatientBean pat = PatientDAO.getPatientBean(patientid);
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
		<h3 style="text-align: center;">Edit Ailment details</h3>
		<form action="modifyailmentdetails.jsp" method="POST">

			<input type="hidden" name="patientID" value="<%=pat.getPatientID()%>">
			<input type="hidden" name="userID" value="<%=user.getUserID()%>">

			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Enter ailment type</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ailmentType"
						placeholder="Enter ailment Type" value="<%=pat.getAilmentType()%>"
						required>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Enter ailment details</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="ailmentDetails"
						placeholder="Enter ailment Details"
						value="<%=pat.getAilmentDetails()%>" required>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Enter appointment date</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control"
						name="stringAppointmentDate" value="<%=pat.getAppointmentDate()%>"
						required>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<input type="submit" value="Update!" class="btn btn-info">
				</div>
				<div class="col-sm-1">
					<button type="button" id="adminCancelButton"
						class="btn btn-warning">cancel</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#adminCancelButton")
				.click(
						function() {
							document.location.href = 'http://localhost:8082/OCS/PatientHome.jsp';
						});
	</script>

</body>
</html>