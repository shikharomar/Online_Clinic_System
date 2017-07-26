<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Ailment Details</title>
</head>
<body>
	<form action = "addAilmentDetailsProcess.jsp">
	<table border="1">
			<tr>
				<td>Enter Patient ID</td>
				<td><input type="text" name="patientID"></td>
			</tr>
			<tr>
				<td>Enter User ID</td>
				<td><input type="text" name="userID"></td>
			</tr>
			<tr>
				<td>Enter Ailment Details</td>
				<td><input type= "text" name="ailmentDetails"></td>
			</tr>
			<tr>
				<td>Enter Ailment Type</td>
				<td><input type="text" name="ailmentType"></td>
			</tr>
			<tr>
				<td>Enter Diagnosis History</td>
				<td><input type="text" name="diagnosisHistory"></td>
			</tr>
			<tr>
				<td><input type = "reset" value = "Reset!"></td>
				<td><input type="submit" value="Insert!"></td>
			</tr>
		</table>
		</form>
</body>
</html>