<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.uhg.ocs.util.Authentication"%>
<%@page import="com.uhg.ocs.util.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>checking credentials</title>
</head>
<body>

	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	<jsp:setProperty property="*" name="user" />

	<%
		if(Authentication.authorise(user.getUserID()) == "yes"){
			if(Authentication.authenticate(user)){
				String userType = User.login(user);
				if(userType.equals("A")){
					out.println("redirecting to Admin homepage");
					response.sendRedirect("AdminHome.jsp");
				}
				else if(userType.equals("R")){
					out.println("redirecting to Reporter homepage");
					response.sendRedirect("ReporterHome.jsp");
				}
				else if(userType.equals("p")){
					out.println("redirecting to Patient homepage");
					response.sendRedirect("PatientHome.jsp");
				}
				else{
					out.println("redirecting to Errorpage");
					response.sendRedirect("Error.jsp");
				}
			}
		}
		else{
			out.println("Unauthorised access. Please register");
		}
	
	
	%>

</body>
</html>