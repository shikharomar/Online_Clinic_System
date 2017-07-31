<%@page import="com.uhg.ocs.dao.SlotsDAO"%>
<%@page import="com.uhg.ocs.dao.LeaveDAO"%>
<%@page import="com.uhg.ocs.dao.DoctorDAO"%>
<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@page import="com.uhg.ocs.service.Administrator"%>
<%@page import="com.uhg.ocs.bean.AppointmentBean"%>
<%@page import="com.uhg.ocs.bean.PatientBean" %>
<%@page import="com.uhg.ocs.bean.ProfileBean" %>
<%@page import="com.uhg.ocs.dao.UserProfileDAO"%>
<%@page import="com.uhg.ocs.dao.PatientDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uhg.ocs.util.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<title>Patients Requests</title>
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

	<%
		ArrayList<AppointmentBean> abl = Administrator.getPendingAppointments();
	%>

	<div class="row" style="padding-left: 140px;">

		<div class="col-sm-10">
			<div class="container">
				<h3>Appointment requests from patients</h3>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Appointment Date</th>
							<th>Patient Name</th>
							<th>Doctor Name</th>
							<th>Doctor status</th>
							<th>Approve</th>
							<th>Reject</th>
						</tr>
					</thead>
					<tbody>
						<%
							String status;
							for (AppointmentBean ab : abl) {
								PatientBean pb = PatientDAO.viewPatient(ab.getPatientID());
								ProfileBean prb = UserProfileDAO.getUserProfile(pb.getUserID());
								DoctorBean db = DoctorDAO.getDoctor(ab.getDoctorID());
								if(LeaveDAO.checkLeave(ab.getDoctorID(), ab.getAppointmentDate()) || SlotsDAO.getslotnumber() == 0){
									status = "Not-available";
								}
								else{
									status = "Available";
								}
						%>
						<tr>
							<td title="YYYY-MM-DD"><%=ab.getAppointmentDate()%></td>
							<td><%=prb.getFirstName()%></td>
							<td><%=db.getDoctorName()%></td>
							<td><%=status%></td>
							<td><a href="ApproveAppointment.jsp?appointmentID=<%=ab.getAppointmentID()%>">approve</a></td>
							<td><a href="RejectAppointment.jsp?appointmentID=<%=ab.getAppointmentID()%>">reject</a></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>