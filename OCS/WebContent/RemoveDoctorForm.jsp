<%@page import="com.uhg.ocs.dao.DoctorDAO"%>
<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Remove Doctor?</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>

	<div class="container-fluid" style="background-color: #D3D3D3;">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-5"><jsp:getProperty property="userID"
					name="user" /></div>
			<div class="col-sm-2">
				<a href="AdminHome.jsp">Home</a>
			</div>
			<div class="col-sm-2"><a href="logout.jsp">Logout</a></div>
		</div>
	</div>

	<%
		String doctorID = request.getParameter("doctorID");
		DoctorBean db = DoctorDAO.getDoctor(doctorID);
	%>
	
	<div>
		<h3 style="text-align: center;">Remove Doctor from system</h3>
		<form action="RemoveDoctor.jsp" method="post">
			<input type="hidden" name="doctorID" value="<%=db.getDoctorID()%>">
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Doctor Name</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="doctorName"
						placeholder="Name of the Doctor" value="<%=db.getDoctorName()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Date of Birth</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="stringDateOfBirth"
						placeholder="Date of Birth" value="<%=db.getDateOfBirth()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Date of Joining</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="stringDateOfJoining"
						placeholder="Date of Joining" value="<%=db.getDateOfJoining()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Gender</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="gender"
						placeholder="Male/Female" value="<%=db.getGender()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Qualification</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="qualification"
						placeholder="Qualification" value="<%=db.getQualification()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Specification</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="specialization"
						placeholder="Specification" value="<%=db.getSpecialization()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Years of Experience</label>
				</div>
				<div class="col-sm-6">
					<input type="number" class="form-control" name="yearsOfExperience"
						placeholder="Years of Experience" value="<%=db.getYearsOfExperience()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Street</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="street"
						placeholder="Street" value="<%=db.getStreet()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Location</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="location"
						placeholder="Location" value="<%=db.getLocation()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">City</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="city"
						placeholder="City" value="<%=db.getCity()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">State</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="state"
						placeholder="State" value="<%=db.getState()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Pincode</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="pincode"
						placeholder="Pincode" value="<%=db.getPincode()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Contact Number</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="contactNumber"
						placeholder="Contact Number" value="<%=db.getContactNumber()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Email ID</label>
				</div>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="emailID"
						placeholder="Email ID" value="<%=db.getEmailID()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<input type="submit" value="Delete!" class="btn btn-danger">
				</div>
				<div class="col-sm-1">
					<button type="button" id="adminCancelButton" class="btn btn-warning">cancel</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#adminCancelButton").click(function() {
			document.location.href = 'http://localhost:8082/OCS/AdminHome.jsp';
		});
	</script>
</body>
</html>