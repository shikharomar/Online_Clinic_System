package com.uhg.ocs.dao;

import java.sql.*;

import com.uhg.ocs.bean.CredentialsBean;
import com.uhg.ocs.util.DBUtil;

public class UserCredentialsDAO {

	public static CredentialsBean getUserCredentials(String userID) throws Exception{
		
		CredentialsBean cb = null;
		Connection con = DBUtil.getDBConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM OCS_TBL_USER_CREDENTIALS where userid = '"+userID+"'");
		while(rs.next()){
			cb = new CredentialsBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
		}
		return cb;
	}
	
	public static Boolean updateUserCredentials(CredentialsBean cb){
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_USER_CREDENTIALS SET PASSWORD = ?, USERTYPE = ?, LOGINSTATUS = ?, USERNAME = ? WHERE USERID = ?");
			ps.setString(1, cb.getPassword());
			ps.setString(2, cb.getUserType());
			ps.setInt(3, cb.getLoginStatus());
			ps.setString(4, cb.getUserName());
			ps.setString(5, cb.getUserID());
			if(ps.executeUpdate()>0)
				status = Boolean.TRUE;
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return status;
	}
	
	public static Boolean updateLoginStatus(CredentialsBean cb){
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_USER_CREDENTIALS SET LOGINSTATUS = ? WHERE USERID = ?");
			ps.setInt(1, cb.getLoginStatus());
			ps.setString(2, cb.getUserID());
			if(ps.executeUpdate()>0)
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
