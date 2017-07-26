package com.uhg.ocs.bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DoctorBean {
	private String doctorID;
	private String doctorName;
	private String stringDateOfBirth;
	private Date dateOfBirth;
	private String stringDateOfJoining;
	private Date dateOfJoining;
	private String gender;
	private String qualification;
	private String specialization;
	private int yearsOfExperience;
	private String street;
	private String location;
	private String city;
	private String state;
	private String pincode;
	private String contactNumber;
	private String emailID;

	public String getDoctorID() {
		return doctorID;
	}

	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getStringDateOfBirth() {
		return stringDateOfBirth;
	}

	public void setStringDateOfBirth(String stringDateOfBirth) {
		this.stringDateOfBirth = stringDateOfBirth;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date d = dateFormat.parse(stringDateOfBirth);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			java.sql.Date sqld = new java.sql.Date(year, month, day);
			setDateOfBirth(sqld);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getStringDateOfJoining() {
		return stringDateOfJoining;
	}

	public void setStringDateOfJoining(String stringDateOfJoining) {
		this.stringDateOfJoining = stringDateOfJoining;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date d = dateFormat.parse(stringDateOfJoining);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			java.sql.Date sqld = new java.sql.Date(year, month, day);
			setDateOfJoining(sqld);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Date getDateOfJoining() {
		return dateOfJoining;
	}

	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public int getYearsOfExperience() {
		return yearsOfExperience;
	}

	public void setYearsOfExperience(int yearsOfExperience) {
		this.yearsOfExperience = yearsOfExperience;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public DoctorBean(String doctorID, String doctorName, Date dateOfBirth, Date dateOfJoining, String gender,
			String qualification, String specialization, int yearsOfExperience, String street, String location,
			String city, String state, String pincode, String contactNumber, String emailID) {
		super();
		this.doctorID = doctorID;
		this.doctorName = doctorName;
		this.dateOfBirth = dateOfBirth;
		this.dateOfJoining = dateOfJoining;
		this.gender = gender;
		this.qualification = qualification;
		this.specialization = specialization;
		this.yearsOfExperience = yearsOfExperience;
		this.street = street;
		this.location = location;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.contactNumber = contactNumber;
		this.emailID = emailID;
	}

	public DoctorBean() {
		super();
	}

}
