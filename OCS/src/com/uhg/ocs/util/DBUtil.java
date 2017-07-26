package com.uhg.ocs.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	private static String url = "jdbc:oracle:thin:@127.0.0.1:1521/xe";
	private static String user = "ocs";
	private static String password = "ocs";
	
	public static Connection getDBConnection() throws Exception{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection(url, user, password);
		return con;
	}
	
}
