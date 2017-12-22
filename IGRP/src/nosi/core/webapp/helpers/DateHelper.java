package nosi.core.webapp.helpers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: Emanuel Pereira
 * 14 Aug 2017
 */
public class DateHelper {

	public static String convertDate(String date, String formatIn, String outputFormat) {
		String myDateString = null;
		try {
			SimpleDateFormat newDateFormat = new SimpleDateFormat(formatIn);
			Date myDate = newDateFormat.parse(date);
			newDateFormat.applyPattern(outputFormat);
			myDateString = newDateFormat.format(myDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myDateString;
	}
	
	public static java.sql.Date formatDate(String data,String inputFormat,String outputFormat){ 
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
		return null;
	}
	
	public static String getCurrentDate(){
		return new java.sql.Date(System.currentTimeMillis()).toString();
	}
	
	public static String getCurrentDate(String outputFormat){
		return convertDate(getCurrentDate(), "yyyy-MM-dd", outputFormat);
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
}
