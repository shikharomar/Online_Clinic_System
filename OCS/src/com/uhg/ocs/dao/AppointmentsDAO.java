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
	
	public static AppointmentBean viewappointmentdetails(String patientid) throws Exception {
		Connection con = DBUtil.getDBConnection();
		
		PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_APPOINTMENTS where PATIENTID = ? ");
		ps.setString(1,patientid);
		ResultSet rs = ps.executeQuery();
		AppointmentBean app = new AppointmentBean();
		
		if(rs.next())
		{
			app.setAppointmentID(rs.getString("APPOINTMENTID"));
			app.setDoctorID(rs.getString("DOCTORID"));
			app.setPatientID(rs.getString("PATIENTID"));
			app.setAppointmentDate(rs.getDate("APPOINTMENT_DATE"));
			app.setStatus(rs.getInt("STATUS"));
			app.setSlotnumber(rs.getInt("SLOTNUMBER"));
			
		System.out.println("This is after viewAppointments");
		return app;
		}
		return app;	
	}
	
	public static int requestforAppointment(String doctorID, String patientID, Date appointmentDate) throws Exception {
		Connection con = DBUtil.getDBConnection();
		int status = 0;
		int slotintnumber=SlotsDAO.getslotnumber();
		PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_APPOINTMENTS where PATIENTID = ? ");
		ps.setString(1,patientID);
		ResultSet rs=ps.executeQuery();
		if(!rs.next())
		{
	    PreparedStatement stmt2=con.prepareStatement("insert into OCS_TBL_APPOINTMENTS (DOCTORID,PATIENTID,APPOINTMENT_DATE,SLOTNUMBER,status) VALUES(?,?,?,?,?)");  
	    stmt2.setString(1,doctorID);  
	    stmt2.setString(2,patientID);  
	    stmt2.setDate(3,appointmentDate);  
	    stmt2.setInt(4,slotintnumber);  
	    stmt2.setInt(5,0);  
	    if(stmt2.executeUpdate() > 0)
	    	status = 0;
		}
		else
		{
			PreparedStatement stmt=con.prepareStatement("UPDATE OCS_TBL_APPOINTMENTS SET DOCTORID = ?,APPOINTMENT_DATE= ?,SLOTNUMBER = ?,status = ? WHERE PATIENTID = ?");  
			 stmt.setString(1,doctorID);  
			   stmt.setDate(2,appointmentDate);  
			   stmt.setInt(3,slotintnumber);  
			   stmt.setInt(4,0);  
			   stmt.setString(5,patientID);
			   if(stmt.executeUpdate() > 0)
				   status = 0;
		}
	    return status;		
	}
	
	public static int getSlotNumber(String appointmentID) {
		int slotnum = 0;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT SLOTNUMBER FROM OCS_TBL_APPOINTMENTS WHERE APPOINTMENTID = ?");
			ps.setString(1, appointmentID);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				slotnum = rs.getInt(1);
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return slotnum;
	}
}
