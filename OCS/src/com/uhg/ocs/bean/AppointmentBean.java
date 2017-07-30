package com.uhg.ocs.bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AppointmentBean {
	private String appointmentID;
	private String doctorID;
	private String patientID;
	private String stringAppointmentDate;
	private Date appointmentDate;
	private String appointmentTime;
	private int status;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAppointmentID() {
		return appointmentID;
	}

	public void setAppointmentID(String appointmentID) {
		this.appointmentID = appointmentID;
	}

	public String getDoctorID() {
		return doctorID;
	}

	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}

	public String getPatientID() {
		return patientID;
	}

	public void setPatientID(String patientID) {
		this.patientID = patientID;
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

	public String getAppointmentTime() {
		return appointmentTime;
	}

	public void setAppointmentTime(String appointmentTime) {
		this.appointmentTime = appointmentTime;
	}

	public AppointmentBean(String appointmentID, String doctorID, String patientID, Date appointmentDate,
			String appointmentTime) {
		super();
		this.appointmentID = appointmentID;
		this.doctorID = doctorID;
		this.patientID = patientID;
		this.appointmentDate = appointmentDate;
		this.appointmentTime = appointmentTime;
	}

	public AppointmentBean(String appointmentID, String doctorID, String patientID, Date appointmentDate,
			String appointmentTime, int status) {
		super();
		this.appointmentID = appointmentID;
		this.doctorID = doctorID;
		this.patientID = patientID;
		this.appointmentDate = appointmentDate;
		this.appointmentTime = appointmentTime;
		this.status = status;
	}

	public AppointmentBean() {
		super();
	}

}
