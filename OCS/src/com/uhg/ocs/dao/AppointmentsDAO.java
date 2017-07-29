package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uhg.ocs.bean.AppointmentBean;
import com.uhg.ocs.bean.LeaveBean;
import com.uhg.ocs.util.DBUtil;

public class AppointmentsDAO {

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
				AppointmentBean ab = new AppointmentBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5));
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
	
	public static Boolean changeAppStatus(String appointmentID) {
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_APPOINTMENTS SET STATUS = -1 WHERE APPOINTMENTID = ?");
			ps.setString(1, appointmentID);
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
	
}
