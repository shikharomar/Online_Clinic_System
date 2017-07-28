package com.uhg.ocs.util;

import com.uhg.ocs.bean.CredentialsBean;
import com.uhg.ocs.dao.UserCredentialsDAO;

public class Authentication {
	
	public static String authorise(String userID) throws Exception{
		String token = null;
		CredentialsBean cb = UserCredentialsDAO.getUserCredentials(userID);
		if(cb == null){
			token = "no";
		}
		else{
			token = "yes";
		}
		return token;
	}
	
	public static Boolean authenticate(CredentialsBean user) throws Exception{
		
		CredentialsBean cb = UserCredentialsDAO.getUserCredentials(user.getUserID());
		if(user.getPassword().equals(cb.getPassword())){
			return true;
		}
		else
			return false;
	}
	
	public static Boolean changeLoginStatus(CredentialsBean user, int loginStatus){
		Boolean status = Boolean.FALSE;
		user.setLoginStatus(loginStatus);
		if(UserCredentialsDAO.updateLoginStatus(user))
			status = Boolean.TRUE;
		return status;
	}
}
