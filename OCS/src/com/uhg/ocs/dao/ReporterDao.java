package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.uhg.ocs.bean.DoctorBean;
import com.uhg.ocs.util.DBUtil;

public class ReporterDao {
	public static ArrayList<DoctorBean> viewAllAvailableDoctors(Date date) throws Exception
	{
		ArrayList<DoctorBean> arr = new ArrayList<DoctorBean>();
		Connection con= DBUtil.getDBConnection() ;
		System.out.println("Date to String:"+date.toString());
		PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_DOCTOR where DOCTORID NOT IN ( select DOCTORID from OCS_TBL_LEAVE " + 
				"where LEAVE_FROM <= TO_DATE(?,'YYYY/MM/DD') and LEAVE_TO >= TO_DATE(?,'YYYY/MM/DD'))"); 
		
		ps.setString(1,date.toString());
		ps.setString(2,date.toString());	
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			DoctorBean doc = new DoctorBean();
			doc.setDoctorID(rs.getString("DOCTORID"));
			doc.setCity(rs.getString("CITY"));
			doc.setContactNumber(rs.getString("CONTACTNUMBER"));
			doc.setDateOfBirth(rs.getDate("DATEOFBIRTH"));
			doc.setDateOfJoining(rs.getDate("DATEOFJOINING"));
			doc.setDoctorName(rs.getString("DOCTORNAME"));
			doc.setEmailID(rs.getString("EMAILID"));
			doc.setGender(rs.getString("GENDER"));
			doc.setLocation(rs.getString("LOCATION"));
			doc.setPincode(rs.getString("DOCTORID"));
			doc.setQualification(rs.getString("QUALIFICATION"));
			doc.setSpecialization(rs.getString("SPECIALIZATION"));
			doc.setState(rs.getString("STATE"));
			doc.setStreet(rs.getString("STREET"));
			doc.setYearsOfExperience(rs.getInt("YEARSOFEXPERIENCE"));
			arr.add(doc);
		}
		return arr;
	}

	public static ArrayList<DoctorBean> intimateAdmin(Date date) throws Exception
	{
		ArrayList<DoctorBean> arr = new ArrayList<DoctorBean>();
		Connection con= DBUtil.getDBConnection() ;
		PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_DOCTOR " + 
				"where DOCTORID NOT IN " + 
				"(" + 
				"select DOCTORID " + 
				"from OCS_TBL_LEAVE " + 
				"where LEAVE_FROM <= TO_DATE(?,'YYYY/MM/DD') and LEAVE_TO>= TO_DATE(?,'YYYY/MM/DD') and STATUS=1 " + 
				")");
		ps.setString(1,date.toString());
		ps.setString(2,date.toString());	
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			DoctorBean doc = new DoctorBean();
			doc.setDoctorID(rs.getString("DOCTORID"));
			doc.setCity(rs.getString("CITY"));
			doc.setContactNumber(rs.getString("CONTACTNUMBER"));
			doc.setDateOfBirth(rs.getDate("DATEOFBIRTH"));
			doc.setDateOfJoining(rs.getDate("DATEOFJOINING"));
			doc.setDoctorName(rs.getString("DOCTORNAME"));
			doc.setEmailID(rs.getString("EMAILID"));
			doc.setGender(rs.getString("GENDER"));
			doc.setLocation(rs.getString("LOCATION"));
			doc.setPincode(rs.getString("DOCTORID"));
			doc.setQualification(rs.getString("QUALIFICATION"));
			doc.setSpecialization(rs.getString("SPECIALIZATION"));
			doc.setState(rs.getString("STATE"));
			doc.setStreet(rs.getString("STREET"));
			doc.setYearsOfExperience(rs.getInt("YEARSOFEXPERIENCE"));
			arr.add(doc);
		}
		return arr;
	}
}
