package com.uhg.ocs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.uhg.ocs.bean.AppointmentBean;
import com.uhg.ocs.bean.DoctorBean;
import com.uhg.ocs.bean.PatientBean;

public class Administrator {
	public String addDoctor(DoctorBean doctorBean) {
		return null;
	}

	public Boolean modifyDoctor(DoctorBean doctorBean) {
		return null;

	}

	public ArrayList<DoctorBean> viewAllDoctors() {
		return null;

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
