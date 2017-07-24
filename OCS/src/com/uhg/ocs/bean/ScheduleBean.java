package com.uhg.ocs.bean;

public class ScheduleBean {
	private String scheduleID;
	private String doctorID;
	private String availableDays;
	private String slots;

	public String getScheduleID() {
		return scheduleID;
	}

	public void setScheduleID(String scheduleID) {
		this.scheduleID = scheduleID;
	}

	public String getDoctorID() {
		return doctorID;
	}

	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}

	public String getAvailableDays() {
		return availableDays;
	}

	public void setAvailableDays(String availableDays) {
		this.availableDays = availableDays;
	}

	public String getSlots() {
		return slots;
	}

	public void setSlots(String slots) {
		this.slots = slots;
	}

	public ScheduleBean(String scheduleID, String doctorID, String availableDays, String slots) {
		super();
		this.scheduleID = scheduleID;
		this.doctorID = doctorID;
		this.availableDays = availableDays;
		this.slots = slots;
	}

	public ScheduleBean() {
		super();
	}

}
