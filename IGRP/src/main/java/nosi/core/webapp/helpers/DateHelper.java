package nosi.core.webapp.helpers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import nosi.core.webapp.Core;
import java.sql.Timestamp;

/**
 * @author: Emanuel Pereira
 * 14 Aug 2017
 */
public class DateHelper {

	public static String convertDate(String date, String formatIn, String outputFormat) {
		String myDateString = null;
		if(Core.isNotNull(date) && Core.isNotNull(outputFormat) && Core.isNotNull(formatIn)) {
			try {
				SimpleDateFormat newDateFormat = new SimpleDateFormat(formatIn);
				Date myDate = newDateFormat.parse(date);
				newDateFormat.applyPattern(outputFormat);
				myDateString = newDateFormat.format(myDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return myDateString;
	}

	public static java.sql.Date formatDate(String data,String inputFormat){ 
		if(Core.isNotNull(data) && Core.isNotNull(inputFormat)) {
			try {
				 SimpleDateFormat formatter = new SimpleDateFormat(inputFormat);
	             return new java.sql.Date(formatter.parse(data).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static java.sql.Date formatDate(String data,String inputFormat,String outputFormat){ 
		if(Core.isNotNull(data) && Core.isNotNull(outputFormat) && Core.isNotNull(inputFormat)) {
			DateFormat formatter = new SimpleDateFormat(inputFormat); 
			Date date;
			try {
				date = (Date)formatter.parse(data);
				SimpleDateFormat newFormat = new SimpleDateFormat(outputFormat);
				String finalDate = newFormat.format(date);
				return java.sql.Date.valueOf(finalDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static java.sql.Date getCurrentDate(){
		return new java.sql.Date(System.currentTimeMillis());
	}

	
	public static String getCurrentDate(String outputFormat){
		return convertDate(getCurrentDate().toString(), "yyyy-MM-dd", outputFormat);
	}
	public static String getCurrentDataTime() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		return dateFormat.format(new Date());
	}
	

	public static String convertDateToString(java.sql.Date date,String format) {
		DateFormat dateFormat = new SimpleDateFormat(format); 
		return dateFormat.format(date);
	}
	
	public static java.sql.Date convertStringToDate(String date,String format) {
		return formatDate(date,"dd-mm-yyyy",format);
	}
	
	public static String convertTimeStampToDate(String date,String format) {
		if(Core.isNotNull(date)) {
			return convertDate(date, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", format);
		}
		return date;
	}
	
	public static Timestamp convertStringToTimestamp(String str_date,String format) {
		try {
			DateFormat formatter;
			formatter = new SimpleDateFormat(format);
			Date date = (Date) formatter.parse(str_date);
			java.sql.Timestamp timeStampDate = new Timestamp(date.getTime());

			return timeStampDate;
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static java.sql.Date utilDateToSqlDate(java.util.Date date) {
		return new java.sql.Date(date.getTime());
	}
}
