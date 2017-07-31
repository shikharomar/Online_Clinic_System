<%@page import="com.uhg.ocs.dao.UserCredentialsDAO"%>
<%@page import="com.uhg.ocs.bean.CredentialsBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<%@ include file="PatientMaster.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Patient Home</title>
<link rel="stylesheet" href="style.css">
</head>
<body>


	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>

	<%
		if(user.getUserID() == null){
			response.sendRedirect("ErrorPage.jsp");
		}
	%>

	<div class="container-fluid" style="background-color: #D3D3D3;">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-5"><jsp:getProperty property="userID"
					name="user" /></div>
			<div class="col-sm-2">
				<a href="PatientHome.jsp">Home</a>
			</div>
			<div class="col-sm-2">
				<a href="logout.jsp">Logout</a>
			</div>
		</div>
	</div>
	
	<%
		CredentialsBean cb = UserCredentialsDAO.getUserCredentials(user.getUserID());
	%>
	
	<div>
		<h3 style="text-align: center;">User Credentials</h3>
		<form action="PChangePassword.jsp" method="post">
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Login ID</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" value="<%=cb.getUserID()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Username</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" value="<%=cb.getUserName()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">Password</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" value="<%=cb.getPassword()%>" readonly="readonly">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 alr">
					<label class="control-label">New Password</label>
				</div>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="password" placeholder="New password" required>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-1">
					<input type="submit" value="Update" class="btn btn-info">
				</div>
				<div class="col-sm-1">
					<button type="button" id="adminCancelButton"
						class="btn btn-warning">cancel</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		$("#adminCancelButton").click(function() {
			document.location.href = 'http://localhost:8082/OCS/PatientHome.jsp';
		});
	</script>
</body>
</html>