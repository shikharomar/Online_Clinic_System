<%@page import="com.uhg.ocs.dao.AppointmentsDAO"%>
<%@page import="com.uhg.ocs.dao.UserProfileDAO"%>
<%@page import="com.uhg.ocs.bean.ProfileBean"%>
<%@page import="com.uhg.ocs.dao.PatientDAO"%>
<%@page import="com.uhg.ocs.bean.PatientBean"%>
<%@page import="com.uhg.ocs.bean.AppointmentBean"%>
<%@page import="com.uhg.ocs.dao.DoctorDAO"%>
<%@page import="com.uhg.ocs.bean.LeaveBean"%>
<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@page import="com.uhg.ocs.service.Administrator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<%@page import="com.uhg.ocs.util.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<title>Suggest Doctors</title>
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

	<jsp:useBean id="lb" class="com.uhg.ocs.bean.LeaveBean"></jsp:useBean>
	<jsp:setProperty property="*" name="lb" />

	<%
		List<AppointmentBean> abl = Administrator.getPatients(lb);
	%>

	<div class="row" style="padding-left: 140px;">

		<div class="col-sm-10">
			<div class="container">
				<h3>Appointments of doctor in his leave</h3>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Patient Name</th>
							<th>Ailment Type</th>
							<th>Appointment Date</th>
							<th>Contact number</th>
							<th>Email Address</th>
							<th>Suggest Doctors</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (AppointmentBean ab : abl) {
								PatientBean pb = PatientDAO.viewPatient(ab.getPatientID());
								ProfileBean prb = UserProfileDAO.getUserProfile(pb.getUserID());
						%>
						<tr>
							<td><%=prb.getFirstName()%></td>
							<td><%=pb.getAilmentType()%></td>
							<td title="YYYY-MM-DD"><%=ab.getAppointmentDate()%></td>
							<td><%=prb.getMobileNo()%></td>
							<td><%=prb.getEmailID()%></td>
							<td><a
								href="SuggestDoctors.jsp?patientID=<%=ab.getPatientID()%>&stringAppointmentDate=<%=ab.getAppointmentDate()%>">suggest
									doctors</a></td>
						</tr>
						<%
							AppointmentsDAO.changeAppStatus(ab.getAppointmentID());
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>