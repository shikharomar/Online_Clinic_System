<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page
	import="com.uhg.ocs.dao.PatientDAO,com.uhg.ocs.bean.*,java.util.*,com.uhg.ocs.service.Patient,com.uhg.ocs.service.Reporter"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Appointment Details</h1>
	<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
<%
	String patientid = PatientDAO.getpatientID(user.getUserID());
	AppointmentBean app = Patient.viewappointmentdetails(patientid);

		out.println("<table border=1>");
		out.println("<tr>");
		out.println("<td>");
		out.println("APPOINTMENTID : ");
		out.println("</td>");
		out.println("<td>");
		out.print(app.getAppointmentID());
		out.println("</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>");
		out.println("DOCTORID : ");
		out.println("</td>");
		out.println("<td>");
		out.print(app.getDoctorID());
		out.println("</td>");
		out.println("</tr>");

	//	out.println("<tr>");
	//	out.println("<td>");
	//	out.println("AppointmentDate :");
	//	out.println("</td>");
	//	out.println("<td>");
	//	out.print(pat.getAppointmentDate());
	//	out.println("</td>");
	//	out.println("</tr>");

		out.println("<tr>");
		out.println("<td>");
		out.println("PATIENTID :");
		out.println("</td>");
		out.println("<td>");
		out.print(app.getPatientID());
		out.println("</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>");
		out.println("APPOINTMENT_DATE");
		out.println("</td>");
		out.println("<td>");
		out.print(app.getAppointmentDate());
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>");
		out.println("SLOTNUMBER :");
		out.println("</td>");
		out.println("<td>");
		out.print(app.getSlotnumber());
		out.println("</td>");
		out.println("</tr>");

		out.println("<tr>");
		out.println("<td>");
		out.println("STATUS : ");
		out.println("</td>");
		out.println("<td>");
		out.print(app.getStatus());
		out.println("</td>");
		out.println("</tr>");
		
		out.println("</table>");
%>
</body>
</html>