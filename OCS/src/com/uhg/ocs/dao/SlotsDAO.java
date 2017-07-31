package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.org.apache.xpath.internal.operations.Bool;
import com.uhg.ocs.util.DBUtil;

public class SlotsDAO {

	public static int getslotnumber() throws Exception {
		Connection con = DBUtil.getDBConnection();
		int slotnumber=0;
		String query1="select slotnumber from OCS_TBL_SLOTS where status = 0";
		Statement st1 = con.createStatement();
	    ResultSet rs1 = st1.executeQuery(query1);
	    if(!rs1.next())
	    {
	    	return slotnumber;
	    }
	    int slotintnumber= rs1.getInt("slotnumber");
	 	return slotintnumber;
	}

	public static Boolean updateStatus(int slotnum, int st) {
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_SLOTS SET STATUS = ? WHERE SLOTNUMBER = ?");
			ps.setInt(1, st);
			ps.setInt(2, slotnum);
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
