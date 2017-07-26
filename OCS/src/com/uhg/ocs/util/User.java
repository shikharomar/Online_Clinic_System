package com.uhg.ocs.util;

import com.uhg.ocs.bean.CredentialsBean;
import com.uhg.ocs.dao.UserCredentialsDAO;

public class User {
	public static String login(CredentialsBean credentialsBean) throws Exception {
		
		String userType;
		CredentialsBean cb = UserCredentialsDAO.getUserCredentials(credentialsBean.getUserID());
		if(credentialsBean.getPassword().equals(cb.getPassword())){
			userType = cb.getUserType();
			return userType;
		}
		else{
			userType = "INVALID";
			return userType;
		}
	}
}
