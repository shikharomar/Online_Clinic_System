package com.uhg.ocs.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.uhg.ocs.bean.*;
import com.uhg.ocs.util.*;

public class Patient {
	public static String addAilmentDetails(PatientBean patientBean) throws Exception{
		
		Connection con = DBUtil.getDBConnection();
		PatientBean pb = patientBean;
		String sql = "insert into OCS_TBL_Patient (PATIENTID,USERID,AILMENT_TYPE,AILMENT_DETAILS,DIAGNOSIS_HISTORY, APPOINTMENT_DATE) values ('"+pb.getPatientID()+"', '"+pb.getUserID()+"', '"+pb.getAilmentType()+"', '"+pb.getAilmentDetails()+"', '"+pb.getDiagnosisHistory()+"', '"+pb.getAppointmentDate()+"')";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next()){
			return "Ailment Details Added Successfuly!";
		}else{
			return "Ailment Details Adding Unsuccessful!";
		}		
	}
}
