package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.uhg.ocs.bean.ProfileBean;
import com.uhg.ocs.util.DBUtil;

public class UserProfileDAO {

	public static Boolean insertUserProfile(ProfileBean pb){
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO OCS_TBL_USER_PROFILE VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, pb.getUserID());
			ps.setString(2, pb.getFirstName());
			ps.setString(3, pb.getLastName());
			ps.setDate(4, pb.getDateOfBirth());
			ps.setString(5, pb.getGender());
			ps.setString(6, pb.getStreet());
			ps.setString(7, pb.getLocation());
			ps.setString(8, pb.getCity());
			ps.setString(9, pb.getState());
			ps.setString(10, pb.getPincode());
			ps.setString(11, pb.getMobileNo());
			ps.setString(12, pb.getEmailID());
			if(ps.executeUpdate()>0)
				status = Boolean.TRUE;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	
}
