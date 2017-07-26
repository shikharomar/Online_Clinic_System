<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
body {
	padding-top: 70px;
	padding-bottom: 70px;
}

.lp {
	padding-top: 70px;
	position: absolute;
	top: 0;
	left: 0;
	right: 40%;
	bottom: 0;
	border: solid #000;
	border-width: 0 0 0 0;
}

.rp {
	padding-top: 70px;
	position: absolute;
	top: 0;
	left: 60%;
	right: 0;
	bottom: 0;
	border: solid #000;
	border-width: 0 0 0 0;
}
.alr{
	text-align: right;
}
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<title>Add Doctor Page</title>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- 				<a class="navbar-brand" href="#">LOGO</a> -->
			<img alt="logo"
				src="https://az495088.vo.msecnd.net/app-logo/optumhealthfinancialemployer_215.png"
				width="70px" height="70px">
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#"><h4>Online Clinic System</h4></a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

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
				<div class="col-sm-1"><input type="submit" value="Add!" class="btn btn-info"></div>
			</div>
		</form>
	</div>

	<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<h4 style="text-align: center;">Copyright @OCS Technologies. All
			rights reserved</h4>
	</div>
	</nav>
</body>
</html>