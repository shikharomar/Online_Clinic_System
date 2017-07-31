package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uhg.ocs.bean.AppointmentBean;
import com.uhg.ocs.bean.LeaveBean;
import com.uhg.ocs.util.DBUtil;

public class AppointmentsDAO {

	//returns list of appointments whose patients are to be intimated
	public static ArrayList<AppointmentBean> getToBeIntPat(LeaveBean lb){
		ArrayList<AppointmentBean> abl = new ArrayList<>();
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_APPOINTMENTS WHERE DOCTORID = ? AND APPOINTMENT_DATE >= ? AND APPOINTMENT_DATE <= ? AND STATUS >= ?");
			ps.setString(1, lb.getDoctorID());
			ps.setDate(2, lb.getLeaveFrom());
			ps.setDate(3, lb.getLeaveTo());
			ps.setInt(4, 0);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AppointmentBean ab = new AppointmentBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5));
				abl.add(ab);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return abl;
	}
	
	public static ArrayList<AppointmentBean> viewPendingAppointments(){
		ArrayList<AppointmentBean> abl = new ArrayList<>();
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_APPOINTMENTS WHERE STATUS = ? ORDER BY APPOINTMENT_DATE ASC");
			ps.setInt(1, 0);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AppointmentBean ab = new AppointmentBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5));
				abl.add(ab);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return abl;
	}
	
	public static Boolean changeAppStatus(String appointmentID, int st) {
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_APPOINTMENTS SET STATUS = ? WHERE APPOINTMENTID = ?");
			ps.setInt(1, st);
			ps.setString(2, appointmentID);
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
	
	public static AppointmentBean viewAppointment(String patientID, Date date) {
		AppointmentBean ab = null;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_APPOINTMENTS WHERE PATIENTID = ? AND APPOINTMENT_DATE = ?");
			ps.setString(1, patientID);
			ps.setDate(2, date);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ab = new AppointmentBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getInt(6));
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return ab;
	}
	
}
