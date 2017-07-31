<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="PatientMaster.html"%>
<%@page import="com.uhg.ocs.util.User" %>
<%@ page
	import="com.uhg.ocs.bean.DoctorBean,java.util.*,com.uhg.ocs.service.Reporter,com.uhg.ocs.service.Patient"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Date And Specialization</title>
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

	<div style="padding-left: 140px;">
		<div class="col-sm-10">
			<div class="container">
				<form action="ViewListOfDoctors.jsp" method="get">
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2">
							<label class="control-label">Select Date:</label>
						</div>
						<div class="col-sm-4">
							<input type="date" class="form-control" name="mydate" required>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2">
							<label class="control-label">Select Specialization:</label>
						</div>
						<div class="col-sm-4">
							<select name="special">
								<option value="">Select</option>
								<option value="ENT">ENT</option>
								<option value="brain">BRAIN</option>
								<option value="KIDNEY">KIDNEY</option>
								<option value="LIMBS">LIMBS</option>
								<option value="BONES">BONES</option>
								<option value="CHILD">CHILD</option>
								<option value="heart">HEART</option>
								<option value="STOMACH">STOMACH</option>
								<option value="MENTAL">MENTAL</option>
								<option value="TEETH">TEETH</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 col-sm-offset-4">
							<input type="submit" class="btn btn-primary" value="search" />
						</div>
					</div>
				</form>
			</div>


			<%
				ArrayList<DoctorBean> list = Patient.viewListOfDoctors(request.getParameter("special"),
						request.getParameter("mydate"));
			%>

			<div class="container">
				<h3>List of doctors</h3>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th>Doctor Name</th>
							<th>Gender</th>
							<th>Qualification</th>
							<th>Years of Experience</th>
							<th>Email address</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (DoctorBean doc : list) {
						%>
						<tr>
							<td><%=doc.getDoctorName()%></td>
							<td><%=doc.getGender()%></td>
							<td><%=doc.getQualification()%></td>
							<td><%=doc.getYearsOfExperience()%></td>
							<td><%=doc.getEmailID()%></td>
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