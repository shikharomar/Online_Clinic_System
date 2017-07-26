package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.uhg.ocs.bean.DoctorBean;
import com.uhg.ocs.util.DBUtil;

public class DoctorDAO {

	//implementation for CRUD operations on Doctor table
	public static int insert(DoctorBean db) throws Exception{
		int status = 0;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO OCS_TBL_DOCTOR (DOCTORNAME,DATEOFBIRTH,DATEOFJOINING,GENDER,QUALIFICATION,SPECIALIZATION,YEARSOFEXPERIENCE,STREET,LOCATION,CITY,STATE,PINCODE,CONTACTNUMBER,EMAILID) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, db.getDoctorName());
			ps.setDate(2, db.getDateOfBirth());
			ps.setDate(3, db.getDateOfJoining());
			ps.setString(4, db.getGender());
			ps.setString(5, db.getQualification());
			ps.setString(6, db.getSpecialization());
			ps.setInt(7, db.getYearsOfExperience());
			ps.setString(8, db.getStreet());
			ps.setString(9, db.getLocation());
			ps.setString(10, db.getCity());
			ps.setString(11, db.getState());
			ps.setString(12, db.getPincode());
			ps.setString(13, db.getContactNumber());
			ps.setString(14, db.getEmailID());
		    status = ps.executeUpdate();
		    ps.close();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return status;
	}
	
}
