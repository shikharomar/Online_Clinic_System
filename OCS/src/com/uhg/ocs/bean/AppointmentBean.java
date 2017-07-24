package com.uhg.ocs.bean;

import java.sql.Date;

public class AppointmentBean {
	private String appointmentID;
	private String doctorID;
	private String patientID;
	private Date appointmentDate;
	private String appointmentTime;
	
	public String getAppointmentID() {
		System.out.println("This is the first change");
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

	public AppointmentBean() {
		super();
	}

}
