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
		List<LeaveBean> lbl = Administrator.onLeaveDoctors();
	%>

	<div class="row" style="padding-left: 140px;">

		<div class="col-sm-10">
			<div class="container">
				<h3>List of all doctors who are on leave with appointments</h3>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Specification</th>
							<th>Contact number</th>
							<th>Email Address</th>
							<th>Leave from</th>
							<th>Leave till</th>
							<th>Cancel Appointment</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (LeaveBean lb : lbl) {
								DoctorBean db = DoctorDAO.getDoctor(lb.getDoctorID());
						%>
						<tr>
							<td><%=db.getDoctorName()%></td>
							<td><%=db.getSpecialization()%></td>
							<td><%=db.getContactNumber()%></td>
							<td><%=db.getEmailID()%></td>
							<td title="YYYY-MM-DD"><%=lb.getLeaveFrom()%></td>
							<td title="YYYY-MM-DD"><%=lb.getLeaveTo()%></td>
							<td><a
								href="IntimatePatients.jsp?doctorID=<%=db.getDoctorID()%>&stringLeaveFrom=<%=lb.getLeaveFrom()%>&stringLeaveTo=<%=lb.getLeaveTo()%>">cancel</a></td>
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