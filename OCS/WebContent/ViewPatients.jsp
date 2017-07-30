<%@page import="com.uhg.ocs.dao.DoctorDAO"%>
<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@page import="com.uhg.ocs.dao.UserProfileDAO"%>
<%@page import="com.uhg.ocs.bean.ProfileBean"%>
<%@page import="com.uhg.ocs.service.Administrator"%>
<%@page import="java.util.Map"%>
<%@page import="com.uhg.ocs.bean.PatientBean"%>
<%@page import="com.uhg.ocs.bean.AppointmentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<title>All appointments</title>
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

	<div style="padding-left: 140px;">
		<div class="col-sm-10">
			<div class="container">
				<form action="ViewPatients.jsp" method="get">
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2">
							<label class="control-label">Appointment Date:</label>
						</div>
						<div class="col-sm-4">
							<input type="date" class="form-control" name="date" required>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 col-sm-offset-4">
							<input type="submit" class="btn btn-primary" value="search" />
						</div>
					</div>
				</form>
			</div>
			<div class="container">
				<%
					java.sql.Date sqld = null;
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					try {
						java.util.Date d = dateFormat.parse(request.getParameter("date"));
						int month = d.getMonth();
						int year = d.getYear();
						int day = d.getDate();
						sqld = new java.sql.Date(year, month, day);
					} catch (Exception e) {
						e.printStackTrace();
					}
					Map<PatientBean, AppointmentBean> map = Administrator.viewPatientsByDate(sqld);
				%>
				<h3>Appointments on selected date</h3>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Patient Name</th>
							<th>Ailment type</th>
							<th>Doctor Name</th>
							<th>Appointment status</th>
						</tr>
					</thead>
					<tbody>
						<%
							String status;
							for (Map.Entry m : map.entrySet()) {
								PatientBean pb = (PatientBean) m.getKey();
								AppointmentBean ab = (AppointmentBean) m.getValue();
								DoctorBean db = (DoctorBean) DoctorDAO.getDoctor(ab.getDoctorID());
								ProfileBean prb = UserProfileDAO.getUserProfile(pb.getUserID());
								if(ab.getStatus() > 0){
									status = "Confirmed";
								}
								else if(ab.getStatus() == 0){
									status = "Pending";
								}
								else{
									status = "Fail";
								}
						%>
						<tr>
							<td><%=prb.getFirstName()%></td>
							<td><%=pb.getAilmentType()%></td>
							<td><%=db.getDoctorName()%></td>
							<td><%=status%></td>
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