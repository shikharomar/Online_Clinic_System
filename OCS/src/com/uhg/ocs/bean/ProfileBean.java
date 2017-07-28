package com.uhg.ocs.bean;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ProfileBean {
	private String userID;
	private String firstName;
	private String lastName;
	private String stringDateOfBirth;
	private Date dateOfBirth;
	private String gender;
	private String street;
	private String location;
	private String city;
	private String state;
	private String pincode;
	private String mobileNo;
	private String emailID;
	private String password;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ProfileBean(String userID, String firstName, String lastName, Date dateOfBirth, String gender, String street,
			String location, String city, String state, String pincode, String mobileNo, String emailID,
			String password) {
		super();
		this.userID = userID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.street = street;
		this.location = location;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.mobileNo = mobileNo;
		this.emailID = emailID;
		this.password = password;
	}

	public ProfileBean() {
		super();
	}

}
