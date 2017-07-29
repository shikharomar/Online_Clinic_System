package com.uhg.ocs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.uhg.ocs.bean.AppointmentBean;
import com.uhg.ocs.bean.DoctorBean;
import com.uhg.ocs.bean.LeaveBean;
import com.uhg.ocs.bean.PatientBean;
import com.uhg.ocs.dao.AppointmentsDAO;
import com.uhg.ocs.dao.DoctorDAO;
import com.uhg.ocs.dao.LeaveDAO;
import com.uhg.ocs.dao.PatientDAO;

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
	
	public static ArrayList<LeaveBean> onLeaveDoctors(){
		return LeaveDAO.viewLeaves();
	}
	
	public static ArrayList<AppointmentBean> getPatients(LeaveBean lb){
		return AppointmentsDAO.getToBeIntPat(lb);
	}
	
	public static ArrayList<DoctorBean> suggestDoctors(String patientID, java.sql.Date date) {
		String ailmentType = PatientDAO.viewPatient(patientID).getAilmentType();
		ArrayList<DoctorBean> dbl = new ArrayList<>();
		ArrayList<String> docIDS = DoctorDAO.fetchAllDoctors(ailmentType);
		for(String docID : docIDS) {
			if(!LeaveDAO.checkLeave(docID, date)) {
				DoctorBean db = DoctorDAO.getDoctor(docID);
				dbl.add(db);
				PatientDAO.updateHistory(patientID, db.getDoctorName());
			}
		}
		return dbl;
	}

	public Map<PatientBean, AppointmentBean> viewPatientsByDate(Date appointmentDate) {
		return null;

	}
}
