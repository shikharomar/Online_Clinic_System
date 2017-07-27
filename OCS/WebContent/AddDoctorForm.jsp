<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="AdminMaster.html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Doctor Page</title>
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
			<div class="col-sm-2"><a href="AdminHome.jsp">Home</a></div>
			<div class="col-sm-2">Logout</div>
		</div>
	</div>

	<div>
		<h3 style="text-align: center;">Register a Doctor</h3>
		<form action="AddDoctor.jsp" method="post">
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Doctor Name</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="doctorName"
						placeholder="Name of the Doctor">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Date of Birth</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="stringDateOfBirth"
						placeholder="Date of Birth">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Date of Joining</label>
				</div>
				<div class="col-sm-6">
					<input type="date" class="form-control" name="stringDateOfJoining"
						placeholder="Date of Joining">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Gender</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="gender"
						placeholder="Male/Female">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Qualification</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="qualification"
						placeholder="Qualification">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Specification</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="specialization"
						placeholder="Specification">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Years of Experience</label>
				</div>
				<div class="col-sm-6">
					<input type="number" class="form-control" name="yearsOfExperience"
						placeholder="Years of Experience">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Street</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="street"
						placeholder="Street">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Location</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="location"
						placeholder="Location">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">City</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="city"
						placeholder="City">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">State</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="state"
						placeholder="State">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Pincode</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="pincode"
						placeholder="Pincode">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Contact Number</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="contactNumber"
						placeholder="Contact Number">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Email ID</label>
				</div>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="emailID"
						placeholder="Email ID">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<input type="submit" value="Add!" class="btn btn-info">
				</div>
			</div>
		</form>
	</div>

</body>
</html>