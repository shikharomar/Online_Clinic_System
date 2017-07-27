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
		if(DoctorDAO.insert(doctorBean)>0){
			status = "SUCCESS";
		}
		else{
			status = "FAILED";
		}
		return status;
	}

	public Boolean modifyDoctor(DoctorBean doctorBean) {
		return null;

	}

	public static ArrayList<DoctorBean> viewAllDoctors() {
		return DoctorDAO.fetchAllDoctors();

	}

	public int removeDoctor(String doctorID) {
		return 0;

	}

	public ArrayList<DoctorBean> suggestDoctors(String patientID, Date date) {
		return null;

	}

	public Map<PatientBean, AppointmentBean> viewPatientsByDate(Date appointmentDate) {
		return null;

	}
}
