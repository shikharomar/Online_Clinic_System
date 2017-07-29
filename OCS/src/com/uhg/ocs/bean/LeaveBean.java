package com.uhg.ocs.bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class LeaveBean {
	private String reporterID;
	private String reporterName;
	private String doctorID;
	private String stringLeaveFrom;
	private Date leaveFrom;
	private String stringLeaveTo;
	private Date leaveTo;
	private String reason;
	private int status;

	public String getReporterID() {
		return reporterID;
	}

	public void setReporterID(String reporterID) {
		this.reporterID = reporterID;
	}

	public String getReporterName() {
		return reporterName;
	}

	public void setReporterName(String reporterName) {
		this.reporterName = reporterName;
	}

	public String getDoctorID() {
		return doctorID;
	}

	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}

	public String getStringLeaveFrom() {
		return stringLeaveFrom;
	}

	public void setStringLeaveFrom(String stringLeaveFrom) {
		this.stringLeaveFrom = stringLeaveFrom;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date d = dateFormat.parse(stringLeaveFrom);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			java.sql.Date sqld = new java.sql.Date(year, month, day);
			setLeaveFrom(sqld);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getLeaveFrom() {
		return leaveFrom;
	}

	public void setLeaveFrom(Date leaveFrom) {
		this.leaveFrom = leaveFrom;
	}

	public String getStringLeaveTo() {
		return stringLeaveTo;
	}

	public void setStringLeaveTo(String stringLeaveTo) {
		this.stringLeaveTo = stringLeaveTo;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date d = dateFormat.parse(stringLeaveTo);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			java.sql.Date sqld = new java.sql.Date(year, month, day);
			setLeaveTo(sqld);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getLeaveTo() {
		return leaveTo;
	}

	public void setLeaveTo(Date leaveTo) {
		this.leaveTo = leaveTo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public LeaveBean(String reporterID, String reporterName, String doctorID, Date leaveFrom, Date leaveTo,
			String reason, int status) {
		super();
		this.reporterID = reporterID;
		this.reporterName = reporterName;
		this.doctorID = doctorID;
		this.leaveFrom = leaveFrom;
		this.leaveTo = leaveTo;
		this.reason = reason;
		this.status = status;
	}

	public LeaveBean() {
		super();
	}

}
