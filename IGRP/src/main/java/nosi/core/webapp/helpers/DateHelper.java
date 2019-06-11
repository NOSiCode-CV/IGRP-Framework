package nosi.core.webapp.helpers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import nosi.core.webapp.Core;
import java.sql.Timestamp;

/**
 * @author: Emanuel Pereira
 * 14 Aug 2017
 */
public class DateHelper {

	private static final int CALCULATE_AGE = 1;
	private static final int CALCULATE_MONTHS = 2;
	private static final int CALCULATE_DAYS = 3;
	
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
	
	public static java.util.Date getCurrentDateUtil(){
		return new java.util.Date(System.currentTimeMillis());
	}

	
	public static String getCurrentDate(String outputFormat){
		return convertDate(getCurrentDate().toString(), "yyyy-MM-dd", outputFormat);
	}
	public static String getCurrentDataTime() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		return dateFormat.format(new Date());
	}
	

	public static String convertDateToString(java.sql.Date date,String outputFormat) {
		DateFormat dateFormat = new SimpleDateFormat(outputFormat); 
		return dateFormat.format(date);
	}
	
	public static java.sql.Date convertStringToDate(String date,String outputFormat) {
		return formatDate(date,outputFormat);
	}
	
	public static String convertTimeStampToDateString(String timeStampDate,String outputFormat) {
		if(Core.isNotNull(timeStampDate)) {
			return convertDate(timeStampDate, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", outputFormat);
		}
		return null;
	}
	
	public static java.sql.Date convertTimeStampToDate(String timeStampDate,String outputFormat) {
		if(Core.isNotNull(timeStampDate)) {
			return formatDate(timeStampDate, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", outputFormat);
		}
		return null;
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
	
	
	private static long calculate(String data,String formatIn,int type) {
		long age = 0;
		try {
			data = Core.convertDate(data, formatIn,"yyyy-MM-dd");
			LocalDate birthDate = LocalDate.parse(data);
			LocalDate currentDate = LocalDate.now();
			switch (type) {
			case CALCULATE_AGE:
				age =  ChronoUnit.YEARS.between(birthDate, currentDate);
				break;
			case CALCULATE_DAYS:
				age =  ChronoUnit.DAYS.between(birthDate.withDayOfMonth(1), currentDate.withDayOfMonth(1));
				break;
			case CALCULATE_MONTHS:
				age =  ChronoUnit.MONTHS.between(birthDate.withDayOfMonth(1), currentDate.withDayOfMonth(1));
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return age;
	}

	public static long calculateYears(String data) {
		return calculate(data, "dd-MM-yyyy",CALCULATE_AGE);
	}
	
	public static long calculateYears(String data,String formatIn) {
		return calculate(data, formatIn,CALCULATE_AGE);
	}
	
	public static long calculateMonths(String data) {
		return calculate(data, "dd-MM-yyyy",CALCULATE_MONTHS);
	}
	
	public static long calculateMonths(String data,String formatIn) {
		return calculate(data, formatIn,CALCULATE_MONTHS);
	}
	
	public static long calculateDays(String data) {
		return calculate(data, "dd-MM-yyyy",CALCULATE_DAYS);
	}
	
	public static long calculateDays(String data,String formatIn) {
		return calculate(data, formatIn,CALCULATE_DAYS);
	}

	
}
