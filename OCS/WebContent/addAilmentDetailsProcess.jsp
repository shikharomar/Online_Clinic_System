<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.uhg.ocs.service.Patient"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Ailment Details Process</title>
</head>
<body>
	<jsp:useBean id="patientBean" class="com.uhg.ocs.bean.PatientBean" />
	<jsp:setProperty name="patientBean" property="*"/>
	<%
		System.out.println(Patient.addAilmentDetails(patientBean));
	%>

</body>
</html>