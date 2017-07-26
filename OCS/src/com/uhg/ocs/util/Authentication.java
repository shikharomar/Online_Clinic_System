package com.uhg.ocs.util;

import com.uhg.ocs.bean.CredentialsBean;

public class Authentication {
	public static Boolean authenticate(CredentialsBean user) throws Exception{
		
		String userType = User.login(user);
		return null;
		
	}
}
