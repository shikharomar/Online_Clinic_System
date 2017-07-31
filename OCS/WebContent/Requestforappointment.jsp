<%@page import="java.sql.Date"%>
<%@page import="oracle.sql.DATE"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.uhg.ocs.bean.DoctorBean,java.util.*,com.uhg.ocs.service.Reporter"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Available Doctors List</h1>
<jsp:useBean id="user" class="com.uhg.ocs.bean.CredentialsBean"
		scope="session"></jsp:useBean>
		
	<%
		System.out.println("MyDate :" + request.getParameter("mydate"));
		String dateStr = request.getParameter("mydate");
		List<DoctorBean> list = Reporter.viewAllAvailableDoctors(request.getParameter("mydate"));
		out.println("<table border=1>");
		for (DoctorBean doc : list) {
			out.println("<tr>");
			out.println("<td>");
			out.print(doc.getDoctorID());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getDoctorName());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getDateOfBirth());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getDateOfJoining());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getGender());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getQualification());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getSpecialization());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getYearsOfExperience());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getStreet());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getCity());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getState());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getPincode());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getContactNumber());
			out.println("</td>");
			out.println("<td>");
			out.print(doc.getEmailID());
			out.println("</td>");
	%>
	<td><a
		href="Requestapproval.jsp?doctorID=<%=doc.getDoctorID()%>&mydate=<%=dateStr%>">Request</a></td>
	<%
		out.println("</tr>");
		}
		out.println("</table>");
	%>
</body>
</html>