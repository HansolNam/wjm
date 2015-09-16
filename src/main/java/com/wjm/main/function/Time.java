package com.wjm.main.function;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {
	static public String toString1(Date date){
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy-MM-dd");
		return sd1.format(date);
	}

	static public String toString2(Date date){
		SimpleDateFormat sd2 = new SimpleDateFormat ( "yyyy년 MM월 dd일 E요일");
		return sd2.format(date);
	}
	
	static public Date nextDate(int iDay)
	{
		Date next = new Date();
		next.setTime(next.getTime() + ((long)1000*60*60*24*iDay));
		
		return next;
	}
	
	static public Timestamp dateToTimestamp(String today) throws ParseException
	{
		SimpleDateFormat sd1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Date date = sd1.parse(today);
		Timestamp timestamp = new java.sql.Timestamp(date.getTime());
		
		return timestamp;
	}
	
}
