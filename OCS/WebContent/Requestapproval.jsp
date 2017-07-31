<%@page import="java.sql.Date"%>
<%@page import="oracle.sql.DATE"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.uhg.ocs.bean.*,com.uhg.ocs.dao.PatientDAO,java.util.*,com.uhg.ocs.service.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Status:</h1>
	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
	
	<%
	 System.out.println("useriD:"+user.getUserID());
		String patid = PatientDAO.getpatientID(user.getUserID());
	 System.out.println("PatientiD:"+patid);
		String docid = request.getParameter("doctorID");
		String date = request.getParameter("mydate");
		int status = Patient.requestforAppointment(docid, patid, date);
		if (status == 0) {
			out.print("Request Failed");
		} else if (status == -1)
			out.print("Request Pending");
		else
			out.print("Request Success,SlotNumber:" + status);
	%>
	<br>
	<br>
	<h1>ThankYou :) !</h1>
</body>
</html>