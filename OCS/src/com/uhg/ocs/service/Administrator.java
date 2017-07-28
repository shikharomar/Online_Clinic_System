package com.uhg.ocs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.uhg.ocs.bean.AppointmentBean;
import com.uhg.ocs.bean.DoctorBean;
import com.uhg.ocs.bean.PatientBean;
import com.uhg.ocs.dao.DoctorDAO;

public class Administrator {
	public static String addDoctor(DoctorBean doctorBean) throws Exception {
		String status;
		if (DoctorDAO.insert(doctorBean) > 0) {
			status = "SUCCESS";
		} else {
			status = "FAILED";
		}
		return status;
	}

	public static Boolean modifyDoctor(DoctorBean doctorBean) {

		return DoctorDAO.updateDocDetails(doctorBean);

	}

	public static ArrayList<DoctorBean> viewAllDoctors() {
		
		return DoctorDAO.fetchAllDoctors();

	}

	public static int removeDoctor(String doctorID) {
		int result = 0;
		if(DoctorDAO.removeDoctor(doctorID))
			result = 1;
		return result;

	}

	public ArrayList<DoctorBean> suggestDoctors(String patientID, Date date) {
		return null;

	}

	public Map<PatientBean, AppointmentBean> viewPatientsByDate(Date appointmentDate) {
		return null;

	}
}
