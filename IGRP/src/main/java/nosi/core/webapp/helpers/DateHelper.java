package nosi.core.webapp.helpers;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
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
				DateTimeFormatter formatterIn = DateTimeFormatter.ofPattern(formatIn);
				DateTimeFormatter formatterOut = DateTimeFormatter.ofPattern(outputFormat);

				LocalDate localDate = LocalDate.parse(date, formatterIn);
				myDateString = localDate.format(formatterOut); // Thread-safe!
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return myDateString;
	}

	public static java.sql.Date formatDate(String data, String inputFormat){ 
		if(Core.isNotNull(data) && Core.isNotNull(inputFormat)) {
			try {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern(inputFormat);
				LocalDate localDate = LocalDate.parse(data, formatter);
				return java.sql.Date.valueOf(localDate);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static java.sql.Date formatDate(String data, String inputFormat, String outputFormat){ 
		if(Core.isNotNull(data) && Core.isNotNull(outputFormat) && Core.isNotNull(inputFormat)) {
			try {
				DateTimeFormatter formatterIn = DateTimeFormatter.ofPattern(inputFormat);
				DateTimeFormatter formatterOut = DateTimeFormatter.ofPattern(outputFormat);
				
				LocalDate localDate = LocalDate.parse(data, formatterIn);
				String finalDate = localDate.format(formatterOut);
				return java.sql.Date.valueOf(finalDate);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static java.sql.Date getCurrentDate() {
		return new java.sql.Date(System.currentTimeMillis());
	}

	public static java.util.Date getCurrentDateUtil() {
		return new java.util.Date(System.currentTimeMillis());
	}
	
	public static java.util.Calendar getCurrentDateCalendar() {
		return java.util.Calendar.getInstance();
	}

	public static String getCurrentDate(String outputFormat) {
		return convertDate(getCurrentDate().toString(), "yyyy-MM-dd", outputFormat);
	}
	
	public static String getCurrentDataTime() {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		return LocalDateTime.now().format(dateTimeFormatter);
	}
	
	public static String convertDateToString(java.sql.Date date, String outputFormat) {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(outputFormat); 
		return date.toLocalDate().format(dateTimeFormatter);
	}
	
	public static java.sql.Date convertStringToDate(String date, String outputFormat) {
		return formatDate(date, outputFormat);
	}
	
	public static String convertTimeStampToDateString(String timeStampDate, String outputFormat) {
		if(Core.isNotNull(timeStampDate)) {
			return convertDate(timeStampDate, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", outputFormat);
		}
		return null;
	}
	
	public static java.sql.Date convertTimeStampToDate(String timeStampDate, String outputFormat) {
		if(Core.isNotNull(timeStampDate)) {
			return formatDate(timeStampDate, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", outputFormat);
		}
		return null;
	}
	
	public static Timestamp convertStringToTimestamp(String str_date, String format) {
		try {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
			LocalDateTime localDateTime = LocalDateTime.parse(str_date, formatter);
			return Timestamp.valueOf(localDateTime);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static java.sql.Date utilDateToSqlDate(java.util.Date date) {
		return new java.sql.Date(date.getTime());
	}
	
	
	private static long calculate(String data, String formatIn, int type) {
		long result = 0;
		try {
			data = Core.convertDate(data, formatIn, "yyyy-MM-dd");
			LocalDate fromDate = LocalDate.parse(data);
			LocalDate toDate = LocalDate.now();
			switch (type) {
			case CALCULATE_AGE:
				result = ChronoUnit.YEARS.between(fromDate, toDate);
				break;
			case CALCULATE_DAYS:
				result = ChronoUnit.DAYS.between(fromDate, toDate);
				break;
			case CALCULATE_MONTHS:
				result = ChronoUnit.MONTHS.between(fromDate.withDayOfMonth(1), toDate.withDayOfMonth(1));
				break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static long calculateYears(String data) {
		return calculate(data, "dd-MM-yyyy", CALCULATE_AGE);
	}
	
	public static long calculateYears(String data, String formatIn) {
		return calculate(data, formatIn, CALCULATE_AGE);
	}
	
	public static long calculateMonths(String data) {
		return calculate(data, "dd-MM-yyyy", CALCULATE_MONTHS);
	}
	
	public static long calculateMonths(String data, String formatIn) {
		return calculate(data, formatIn, CALCULATE_MONTHS);
	}
	
	public static long calculateDays(String data) {
		return calculate(data, "dd-MM-yyyy", CALCULATE_DAYS);
	}
	
	public static long calculateDays(String data, String formatIn) {
		return calculate(data, formatIn, CALCULATE_DAYS);
	}

}