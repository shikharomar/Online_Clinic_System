<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up for OCS</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="container-fluid" style="background-color: #ffc14d;">
		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-2">About us</div>
			<div class="col-sm-2">Contact us</div>
		</div>
	</div>
	<div>
		<h3 style="text-align: center;">Customer/Patient Registration</h3>
		<form action="Register.jsp" method="post">
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">First Name</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="firstName"
						placeholder="First Name">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Last Name</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="lastName"
						placeholder="Last Name">
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
					<label class="control-label">Gender</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="gender"
						placeholder="Gender">
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
					<input type="text" class="form-control" name="mobileNo"
						placeholder="Contact Number">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Email Address</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="emailID"
						placeholder="Email Address">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Password</label>
				</div>
				<div class="col-sm-6">
					<input type="password" class="form-control" name="password"
						placeholder="Password">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<input type="submit" value="Signup" class="btn btn-warning">
				</div>
				<div class="col-sm-1">
					<button type="button" id="adminCancelButton"
						class="btn btn-default">cancel</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#adminCancelButton").click(function() {
			document.location.href = 'http://localhost:8082/OCS/OCSHome.jsp';
		});
	</script>
</body>
</html>