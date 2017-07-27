package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
	
	public static ArrayList<DoctorBean> fetchAllDoctors(){
		ArrayList<DoctorBean> dbal = new ArrayList<>();
		try{
			Connection con = DBUtil.getDBConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM OCS_TBL_DOCTOR");
			while(rs.next()){
				DoctorBean db = new DoctorBean(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15));
				dbal.add(db);
			}
			st.close();
			con.close();
		}
		catch (Exception e){
			e.printStackTrace();
		}
		return dbal;
	}
	
}
