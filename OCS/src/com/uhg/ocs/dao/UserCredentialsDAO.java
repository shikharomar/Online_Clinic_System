package com.uhg.ocs.dao;

import java.sql.*;

import com.uhg.ocs.bean.CredentialsBean;
import com.uhg.ocs.util.DBUtil;

public class UserCredentialsDAO {

	public static CredentialsBean getUserCredentials(String userID) throws Exception{
		
		CredentialsBean cb = null;
		Connection con = DBUtil.getDBConnection();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM OCS_TBL_USER_CREDENTIALS where userid = "+userID);
		while(rs.next()){
			cb = new CredentialsBean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5));
		}
		return cb;
	}
	
}
