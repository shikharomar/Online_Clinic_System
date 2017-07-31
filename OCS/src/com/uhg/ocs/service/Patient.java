package com.uhg.ocs.service;

import com.uhg.ocs.dao.*;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.uhg.ocs.bean.*;
import com.uhg.ocs.dao.*;

public class Patient {
	public static String addAilmentDetails(PatientBean patientBean) throws Exception {
		if (PatientDAO.addAilmentDetails(patientBean) >0 ) {
			return "Ailment Details Added Successfully! SUCCESS";
		} else {
			return "Adding Ailment Details Unsuccessful! FAIL";
		}
	}

	public static boolean modifyAilmentDetails(PatientBean patientBean) throws Exception {
		if (PatientDAO.modifyAilmentDetails(patientBean)) {
			// return "Ailment Details Modified Successfully! SUCCESS";
			return true;
		} else {
			// return "Modifying Ailment Details Unsuccessful! FAIL";
			return false;
		}
	}

	public static PatientBean viewailmentdetails(String patientID) throws Exception {
		System.out.println("Inside patient.java");
		return PatientDAO.getPatientBean(patientID);
	}
	public static AppointmentBean viewappointmentdetails(String Patientid) throws Exception
	{
		return PatientDAO.viewappointmentdetails(Patientid);
	}
	public static ArrayList<DoctorBean> viewListOfDoctors(String specialization, String date) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
		java.sql.Date sqld = null;
		try {
			java.util.Date d = dateFormat.parse(date);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			sqld = new java.sql.Date(year, month, day);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return PatientDAO.viewListOfDoctors(specialization, sqld);
	}
	public static int requestforAppointment(String doctorID,String patientID, String appointmentDate) throws Exception
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sqld = null;
		try {
			java.util.Date d = dateFormat.parse(appointmentDate);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			sqld = new java.sql.Date(year, month, day);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return PatientDAO.requestforAppointment(doctorID,patientID,sqld);
	}
}
