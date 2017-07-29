package com.uhg.ocs.bean;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class PatientBean {
	private String patientID;
	private String userID;
	private String stringAppointmentDate;
	private Date appointmentDate;
	private String ailmentType;
	private String ailmentDetails;
	private String diagnosisHistory;

	public String getPatientID() {
		return patientID;
	}

	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getStringAppointmentDate() {
		return stringAppointmentDate;
	}

	public void setStringAppointmentDate(String stringAppointmentDate) {
		this.stringAppointmentDate = stringAppointmentDate;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date d = dateFormat.parse(stringAppointmentDate);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			java.sql.Date sqld = new java.sql.Date(year, month, day);
			setAppointmentDate(sqld);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public String getAilmentType() {
		return ailmentType;
	}

	public void setAilmentType(String ailmentType) {
		this.ailmentType = ailmentType;
	}

	public String getAilmentDetails() {
		return ailmentDetails;
	}

	public void setAilmentDetails(String ailmentDetails) {
		this.ailmentDetails = ailmentDetails;
	}

	public String getDiagnosisHistory() {
		return diagnosisHistory;
	}

	public void setDiagnosisHistory(String diagnosisHistory) {
		this.diagnosisHistory = diagnosisHistory;
	}

	public PatientBean(String patientID, String userID, Date appointmentDate, String ailmentType, String ailmentDetails,
			String diagnosisHistory) {
		super();
		this.patientID = patientID;
		this.userID = userID;
		this.appointmentDate = appointmentDate;
		this.ailmentType = ailmentType;
		this.ailmentDetails = ailmentDetails;
		this.diagnosisHistory = diagnosisHistory;
	}

	public PatientBean() {
		super();
	}

}
