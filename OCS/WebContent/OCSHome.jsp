<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="HeadFootMaster.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online clinic system</title>
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


	<div class="lp"></div>
	<div class="rp">
		<div>
			<div class="row">
				<br>
			</div>
			<div class="row">
				<div class="col-sm-2">
					<h3>Login</h3>
				</div>
			</div>

			<form action="login.jsp" method="post">
				<div class="row">
					<div class="col-sm-8">
						<input type="text" class="form-control" name="userID"
							placeholder="User ID required for logging in" autofocus required>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-8">
						<input type="password" class="form-control" name="password"
							placeholder="Password to authenticate!" required>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<input type="submit" class="btn btn-primary" value="login" />
					</div>
				</div>
			</form>
			<div class="row">
				<br>
			</div>
			<div class="row">
				<div class="col-sm-3">
					Not registered?
				</div>
				<div class="col-sm-4">
					<a href="RegisterForm.jsp">Sign up!</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>