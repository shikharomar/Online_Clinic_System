package com.uhg.ocs.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.javafx.collections.MappingChange.Map;
import com.uhg.ocs.bean.AppointmentBean;
import com.uhg.ocs.bean.DoctorBean;
import com.uhg.ocs.bean.PatientBean;
import com.uhg.ocs.util.DBUtil;

public class PatientDAO {

	public static PatientBean viewPatient(String patientID) {
		PatientBean pb = null;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_PATIENT WHERE PATIENTID = ?");
			ps.setString(1, patientID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				pb = new PatientBean(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pb;
	}
	
	
	public static Boolean updateHistory(String patientID, String message) {
		Boolean status = Boolean.FALSE;
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_PATIENT SET DIAGNOSIS_HISTORY = ? WHERE PATIENTID = ?");
			ps.setString(1, message);
			ps.setString(2, patientID);
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
	
	public static ArrayList<PatientBean> getPatients(Date date){
		ArrayList<PatientBean> pbl = new ArrayList<>();
		try {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM OCS_TBL_PATIENT WHERE APPOINTMENT_DATE = ?");
			ps.setDate(1, date);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				PatientBean pb = new PatientBean(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getString(5), rs.getString(6));
				pbl.add(pb);
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return pbl;
	}
	
	//from santhosh
	// For adding ailment details of a patient
		public static int addAilmentDetails(PatientBean patientBean) throws Exception {
			int status=0;
			try {
			Connection con = DBUtil.getDBConnection();
			PatientBean pb = patientBean;
			System.out.println("inside addailment dao:"+patientBean.getAppointmentDate());
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO OCS_TBL_PATIENT (PATIENTID,USERID,APPOINTMENT_DATE,AILMENT_TYPE,AILMENT_DETAILS,DIAGNOSIS_HISTORY) VALUES (?,?,?,?,?,?)");
			ps.setString(1, null);
			ps.setString(2, pb.getUserID());
			ps.setDate(3, pb.getAppointmentDate());
			ps.setString(4, pb.getAilmentType());
			ps.setString(5, pb.getAilmentDetails());
			ps.setString(6, "");
			status = ps.executeUpdate();
			ps.close();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return status;
			
			//return true;
		}
		public static AppointmentBean viewappointmentdetails(String patientid) throws Exception
		{
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_APPOINTMENTS where PATIENTID = ? ");
			ps.setString(1,patientid);
			ResultSet rs = ps.executeQuery();
			AppointmentBean app = new AppointmentBean();
			
			if(rs.next())
			{
				app.setAppointmentID(rs.getString("APPOINTMENTID"));
				app.setDoctorID(rs.getString("DOCTORID"));
				app.setPatientID(rs.getString("PATIENTID"));
				app.setAppointmentDate(rs.getDate("APPOINTMENT_DATE"));
				app.setStatus(rs.getInt("STATUS"));
				app.setSlotnumber(rs.getInt("SLOTNUMBER"));
				
			System.out.println("This is after viewAppointments");
			return app;
			}
			return app;
		}
		// For modifying the ailment details of a patient
		public static boolean modifyAilmentDetails(PatientBean pb) throws Exception {
		
			Connection con = DBUtil.getDBConnection();
			
			System.out.println("ailment type:"+pb.getAilmentType());
			System.out.println("ailment details:"+pb.getAilmentDetails());
			System.out.println("patient id:"+pb.getPatientID());
			PreparedStatement ps = con.prepareStatement("UPDATE OCS_TBL_PATIENT SET AILMENT_TYPE = ? , APPOINTMENT_DATE = TO_DATE(?) ,  AILMENT_DETAILS = ?  WHERE PATIENTID = ? ");
			ps.setString(1,pb.getAilmentType());
			ps.setDate(2,pb.getAppointmentDate());
			ps.setString(3, pb.getAilmentDetails());
			ps.setString(4,pb.getPatientID());
			System.out.println("before update query executed");
			ResultSet rs = ps.executeQuery();
			System.out.println("after update query executed");
							
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		}

		public static PatientBean viewailmentdetails(String PatientID) throws Exception {
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_Patient where PATIENTID = ? ");
			ps.setString(1,PatientID);
			ResultSet rs = ps.executeQuery();
			PatientBean doc = new PatientBean();
			
			if(rs.next())
			{
				doc.setPatientID(rs.getString("PATIENTID"));
				doc.setUserID(rs.getString("USERID"));
				doc.setAppointmentDate(rs.getDate("APPOINTMENT_DATE"));
				doc.setAilmentType(rs.getString("AILMENT_TYPE"));
				doc.setAilmentDetails(rs.getString("AILMENT_DETAILS"));
				doc.setDiagnosisHistory(rs.getString("DIAGNOSIS_HISTORY"));
				
			System.out.println("This is after viewailments");
			return doc;
			}
			
			return doc;
				
		}
		// For viewing the list of available doctor for a particular specialization
		// and date
		public static ArrayList<DoctorBean> viewListOfDoctors(String specialization, Date date) throws Exception {
			ArrayList<DoctorBean> arr = new ArrayList<DoctorBean>();
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_DOCTOR "
					+ "where SPECIALIZATION = (?) and DOCTORID NOT IN " + "(" + "select DOCTORID " + "from OCS_TBL_LEAVE "
					+ "where LEAVE_FROM >= TO_DATE(?,'YYYY/MM/DD') or LEAVE_TO <= TO_DATE(?,'YYYY/MM/DD') and STATUS=1 " + ")");
			ps.setString(1, specialization);
			ps.setString(3, date.toString());
			ps.setString(2, date.toString());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DoctorBean doc = new DoctorBean();
				doc.setDoctorID(rs.getString("DOCTORID"));
				doc.setCity(rs.getString("CITY"));
				doc.setContactNumber(rs.getString("CONTACTNUMBER"));
				doc.setDateOfBirth(rs.getDate("DATEOFBIRTH"));
				doc.setDateOfJoining(rs.getDate("DATEOFJOINING"));
				doc.setDoctorName(rs.getString("DOCTORNAME"));
				doc.setEmailID(rs.getString("EMAILID"));
				doc.setGender(rs.getString("GENDER"));
				doc.setLocation(rs.getString("LOCATION"));
				doc.setPincode(rs.getString("PINCODE"));
				doc.setQualification(rs.getString("QUALIFICATION"));
				doc.setSpecialization(rs.getString("SPECIALIZATION"));
				doc.setState(rs.getString("STATE"));
				doc.setStreet(rs.getString("STREET"));
				doc.setYearsOfExperience(rs.getInt("YEARSOFEXPERIENCE"));
				arr.add(doc);
			}
			return arr;
		}
		public static String getpatientID(String userid) throws Exception
		{
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("select PATIENTID from OCS_TBL_Patient where USERID = ? ");
			ps.setString(1,userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				return rs.getString("PATIENTID");
			}
			return null;
			
		}
		public static PatientBean getPatientBean(String PatientID) throws Exception
		{
			Connection con = DBUtil.getDBConnection();
			PreparedStatement ps = con.prepareStatement("select * from OCS_TBL_Patient where PATIENTID = ? ");
			ps.setString(1,PatientID);
			ResultSet rs = ps.executeQuery();
			PatientBean patbean=new PatientBean();
			while(rs.next())
			{
				patbean.setPatientID(rs.getString("PATIENTID"));
				patbean.setUserID(rs.getString("USERID"));
				patbean.setAppointmentDate(rs.getDate("APPOINTMENT_DATE"));
				patbean.setAilmentType(rs.getString("AILMENT_TYPE"));
				patbean.setAilmentDetails(rs.getString("AILMENT_DETAILS"));
				patbean.setDiagnosisHistory(rs.getString("DIAGNOSIS_HISTORY"));
			}
			return patbean;
			
		}
		// For requesting an appointment
		public static int requestforAppointment(String doctorID,String patientID, Date appointmentDate) throws Exception {
			int slotnumber=0;
			System.out.println("Date in dao:"+appointmentDate);
			Connection con = DBUtil.getDBConnection();
			String query1="select slotnumber from OCS_TBL_SLOTS where status = 0";
			Statement st1 = con.createStatement();
		    ResultSet rs1 = st1.executeQuery(query1);
		    if(!rs1.next())
		    {
		    	return slotnumber;
		    }
		    System.out.println("PatientiD:"+patientID);
		    slotnumber=-1;
		    System.out.println("DoctoriD:"+doctorID);
		    int slotintnumber= rs1.getInt("slotnumber");
		    System.out.println("slotnumber"+slotintnumber);
		    PreparedStatement stmt2=con.prepareStatement("insert into OCS_TBL_APPOINTMENTS(DOCTORID,PATIENTID,APPOINTMENT_DATE,SLOTNUMBER,STATUS) VALUES(?,?,TO_DATE(?,'YYYY/MM/DD'),?,?)");  
		    stmt2.setString(1,doctorID);  
		    stmt2.setString(2,patientID);  
		    stmt2.setString(3,appointmentDate.toString());  
		    stmt2.setInt(4,slotintnumber);  
		    stmt2.setInt(5,0);  
		      
		    int i=stmt2.executeUpdate();  
		    System.out.println("Below query");
		    return slotnumber;
		}
		public static Map<AppointmentBean, PatientBean>viewAppointmentDetails(String patientID, Date date)
		{
			Map<AppointmentBean, PatientBean>m=null;
			
			return m;
		}
}
