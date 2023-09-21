package com.example;

import java.util.Calendar;

public class CalenderBean {
	private Calendar cal;
	
	public CalenderBean() {
		cal = Calendar.getInstance();
	}
	
	public int getYear() {
		return cal.get(Calendar.YEAR);
	}
	
	public int getMonth() {
		return cal.get(Calendar.MONTH) + 1;
	}
	public int getDate() {
		return cal.get(Calendar.DATE);
	}
}