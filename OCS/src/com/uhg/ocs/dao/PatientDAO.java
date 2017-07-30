package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uhg.ocs.bean.PatientBean;
import com.uhg.ocs.util.DBUtil;

public class PatientDAO {

	public static PatientBean viewPatient(String patientID) {
		PatientBean pb = null;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_PATIENT WHERE PATIENTID = ?");
			ps.setString(1, patientID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				pb = new PatientBean(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pb;
	}
	
	
	public static Boolean updateHistory(String patientID, String message) {
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_PATIENT SET DIAGNOSIS_HISTORY = ? WHERE PATIENTID = ?");
			ps.setString(1, message);
			ps.setString(2, patientID);
			if(ps.executeUpdate() > 0)
				status = Boolean.TRUE;
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	
	public static ArrayList<PatientBean> getPatients(Date date){
		ArrayList<PatientBean> pbl = new ArrayList<>();
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_PATIENT WHERE APPOINTMENT_DATE = ?");
			ps.setDate(1, date);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PatientBean pb = new PatientBean(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6));
				pbl.add(pb);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pbl;
	}
}
