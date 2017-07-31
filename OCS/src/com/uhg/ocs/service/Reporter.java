package com.uhg.ocs.service;

import com.uhg.ocs.dao.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.uhg.ocs.bean.*;
import com.uhg.ocs.dao.ReporterDao;
import com.uhg.ocs.util.DBUtil;

public class Reporter {
	public static ArrayList<DoctorBean> viewAllAvailableDoctors(String date) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date sqld = null;
		try {
			java.util.Date d = dateFormat.parse(date);
			int month = d.getMonth();
			int year = d.getYear();
			int day = d.getDate();
			sqld = new java.sql.Date(year,month,day);
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		//new java.sql.Date
		ArrayList<DoctorBean> arr = ReporterDao.viewAllAvailableDoctors(sqld);
		if (arr == null) {
			System.out.println("Failed in fetching the data !");
		}

		return arr;
	}

	public static ArrayList<DoctorBean> intimateAdmin(String date )throws Exception {
		ArrayList<DoctorBean> arr = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date d = dateFormat.parse(date);
		int month = d.getMonth();
		int year = d.getYear();
		int day = d.getDate();
		java.sql.Date sqld = new java.sql.Date(year, month, day);

		arr = (ReporterDao.intimateAdmin(sqld));
		if (arr == null) {
			System.out.println("Failed in fetching the data !");
		}

		return arr;
	}
}
