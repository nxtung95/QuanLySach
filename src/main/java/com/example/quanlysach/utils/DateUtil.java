package com.example.quanlysach.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String formatDate(String date, String oldPattern, String newPattern) {
		SimpleDateFormat oldFormat = new SimpleDateFormat(oldPattern);
		SimpleDateFormat newFormat = new SimpleDateFormat(newPattern);
		try {
			Date oldDate = oldFormat.parse(date);
			return newFormat.format(oldDate);
		} catch (ParseException e) {
			System.out.println("Error parse date: " + e);
		}
		return null;
	}
}
