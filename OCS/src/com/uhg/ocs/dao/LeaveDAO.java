package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.uhg.ocs.bean.LeaveBean;
import com.uhg.ocs.util.DBUtil;

public class LeaveDAO {

	public static ArrayList<LeaveBean> viewLeaves() {
		ArrayList<LeaveBean> lbl = new ArrayList<>();
		try {
			Connection con = DBUtil.getDBConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM OCS_TBL_LEAVE WHERE STATUS = 1");
			while (rs.next()) {
				LeaveBean lb = new LeaveBean("", "", rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getString(5), 1);
				lbl.add(lb);
			}
			st.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return lbl;
	}

	// returns true if the doctor is on leave on selected date
	public static Boolean checkLeave(String doctorID, Date date) {
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement(
					"SELECT LEAVEID FROM OCS_TBL_LEAVE WHERE DOCTORID = ? AND LEAVE_FROM <= ? AND LEAVE_TO >= ?");
			ps.setString(1, doctorID);
			ps.setDate(2, date);
			ps.setDate(3, date);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
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
