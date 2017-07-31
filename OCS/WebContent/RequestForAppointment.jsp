<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="PatientMaster.html"%>
<%@ page
	import="com.uhg.ocs.bean.DoctorBean,java.util.*,com.uhg.ocs.service.Reporter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.uhg.ocs.util.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request for appointment</title>
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
		<div class="container">
			<h3 style="text-align: center;">Request for appointment</h3>
			<form action="RequestForAppointment.jsp" method="get">
				<div class="row">
					<div class="col-sm-4 alr">
						<label class="control-label">Enter appointment date:</label>
					</div>
					<div class="col-sm-6">
						<input type="date" class="form-control" name="mydate" required>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4"></div>
					<div class="col-sm-1">
						<input type="submit" value="request" class="btn btn-info">
					</div>
					<div class="col-sm-1">
						<button type="button" id="adminCancelButton"
							class="btn btn-warning">cancel</button>
					</div>
				</div>
			</form>
		</div>
		<%
			List<DoctorBean> list = Reporter.viewAllAvailableDoctors(request.getParameter("mydate"));
			String dateStr = request.getParameter("mydate");
		%>
		
		<div class="container">
			<h3>Available Doctors List</h3>
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>Doctor Name</th>
						<th>Gender</th>
						<th>Qualification</th>
						<th>Specialization</th>
						<th>Years of Experience</th>
						<th>Email address</th>
						<th>request</th>
					</tr>
				</thead>
				<tbody>
					<% for (DoctorBean doc : list) { %>
					<tr>
						<td><%=doc.getDoctorName()%></td>
						<td><%=doc.getGender()%></td>
						<td><%=doc.getQualification()%></td>
						<td><%=doc.getSpecialization()%></td>
						<td><%=doc.getYearsOfExperience()%></td>
						<td><%=doc.getEmailID()%></td>
						<td><a href="Requestapproval.jsp?doctorID=<%=doc.getDoctorID()%>&mydate=<%=dateStr%>">Request</a></td>
					</tr>
					<% } %>
				</tbody>
			</table>			
		</div>
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