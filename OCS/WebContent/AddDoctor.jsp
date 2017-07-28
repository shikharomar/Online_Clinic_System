<%@page import="com.uhg.ocs.bean.DoctorBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.uhg.ocs.service.Administrator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding Doctor Details</title>
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
			<div class="col-sm-2">
				<a href="logout.jsp">Logout</a>
			</div>
		</div>
	</div>


	<jsp:useBean id="DocBean" class="com.uhg.ocs.bean.DoctorBean"></jsp:useBean>
	<jsp:setProperty property="*" name="DocBean" />

	<%
		String status = Administrator.addDoctor(DocBean);
		out.println("Adding Doctor :" + status);
	%>

	<br>
	<a href="AdminHome.jsp">Click here</a> to return to home page

</body>
</html>