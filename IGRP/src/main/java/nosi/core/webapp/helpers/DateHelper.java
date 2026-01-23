package nosi.core.webapp.helpers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

    if (Core.isNotNull(date) && Core.isNotNull(outputFormat) && Core.isNotNull(formatIn)) {
        try {
			// Convert input date using DateTimeFormatter
            DateTimeFormatter formatterIn = DateTimeFormatter.ofPattern(formatIn);
            DateTimeFormatter formatterOut = DateTimeFormatter.ofPattern(outputFormat);

                if(isOnlyDateString(formatIn)) {
                    LocalDate parsedDate = LocalDate.parse(formatDateTimeString(date, formatIn), formatterIn);
                    myDateString = parsedDate.format(formatterOut);
                }else{
                    LocalDateTime parsedDate = LocalDateTime.parse(date, formatterIn);
            myDateString = parsedDate.format(formatterOut);
                }


        } catch (Exception e) {
                String aux="";
                String auxEn="";
                if(formatIn.contains("/mm/") || formatIn.contains("-mm-")){
                    aux="Verifica se MM (mês) está minuscula 'mm' (minutos).";
                    auxEn=" Check if you wanted to be month 'MM' and not minutes like 'mm'";
                }
                System.err.printf("%s- IGRP WARNING convertDate: %n PT- FormatoIN (%s) para esta data (%s) com FormatOut (%s)."+aux+"  %n EN- FormatoIN () for this date (%s) witn FormatoOut (%s)."+auxEn+" %n %s %n",Core.getCurrentDad(), formatIn, formatDateTimeString(date, formatIn),outputFormat, formatIn, formatDateTimeString(date, formatIn),outputFormat, e.getMessage());

            try {
				SimpleDateFormat newDateFormat = new SimpleDateFormat(formatIn);
				Date myDate = newDateFormat.parse(date);
				newDateFormat.applyPattern(outputFormat);
				myDateString = newDateFormat.format(myDate);
            } catch (ParseException ex) {
				e.printStackTrace();
            }

        }
    }

    return myDateString;
}

	private static String formatDateTimeString(String date, String formatIn) {
		// Check if the formatIn does not include time components
		if (isOnlyDateString(formatIn)) {
            if(date.contains(" ")) {
				date = date.split(" ")[0]; // Extract only the "2021-02-26" part
            }else if(date.contains("T")) {
                date = date.split("T")[0]; // Extract only the "2021-02-26" part
            }
			}
		return date;
	}

    public static boolean isOnlyDateString(String formatIn) {
        return !formatIn.toLowerCase().contains("h") || !formatIn.toLowerCase().contains("s");
    }

    /**
     * java.sql.Date does not support time components. Be aware that this method will ignore the time components of the input date.
     * @param data
     * @param inputFormat
     * @return
     */
	public static java.sql.Date formatDate(String data,String inputFormat){
		if(Core.isNotNull(data) && Core.isNotNull(inputFormat)) {
			try {
				String dataF = formatDateTimeString(data, inputFormat);
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern(inputFormat);
				LocalDate localDate = LocalDate.parse(dataF, formatter);
				return java.sql.Date.valueOf(localDate);
			} catch (Exception e) {
                String aux="";
                String auxEn="";
                if(inputFormat.contains("/mm/") || inputFormat.contains("-mm-")){
                    aux="Verifica se MM (mês) está minuscula 'mm' (minutos).";
                    auxEn=" Check if you wanted to be month 'MM' and not minutes like 'mm'";
                }
                System.err.printf("%s- IGRP WARNING formatDate: %n PT- FormatoIN (%s) para esta data (%s)."+aux+"  %n EN- FormatoIN (%s) for this date (%s)."+auxEn+" %n %s %n",Core.getCurrentDad(), inputFormat, formatDateTimeString(data, inputFormat), inputFormat, formatDateTimeString(data, inputFormat), e.getMessage());
				try {
					SimpleDateFormat formatter = new SimpleDateFormat(inputFormat);
					return new java.sql.Date(formatter.parse(data).getTime());
				} catch (ParseException ex) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@Deprecated
    /**
     * @deprecated Use {@link #formatDate(data, inputFormat)} instead.
     */
	public static java.sql.Date formatDate(String data,String inputFormat,String outputFormat){ 
		if(Core.isNotNull(data) && Core.isNotNull(outputFormat) && Core.isNotNull(inputFormat)) {
			return formatDate(data, inputFormat);
		}
		return null;
	}
	
	public static java.sql.Date getCurrentDate(){
		return new java.sql.Date(System.currentTimeMillis());
	}

	public static java.util.Date getCurrentDateUtil(){
		return new java.util.Date(System.currentTimeMillis());
	}
	
	public static java.util.Calendar getCurrentDateCalendar(){
		return java.util.Calendar.getInstance();
	}

	
	public static String getCurrentDate(String outputFormat){
		return convertDateToString(getCurrentDate(), outputFormat);
	}
	public static String getCurrentDataTime() {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		return LocalDateTime.now().format(dateTimeFormatter);
	}
	

	public static String convertDateToString(java.sql.Date date,String outputFormat) {
        outputFormat = outputFormat.replaceAll("[hH]{2}:.*", "00:00");
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(outputFormat);
		return date.toLocalDate().format(dateTimeFormatter);
	}
	
	public static java.sql.Date convertStringToDate(String date, String inputFormat) {
		return formatDate(date, inputFormat);
	}
	
	public static String convertTimeStampToDateString(String timeStampDate,String outputFormat) {
		if(Core.isNotNull(timeStampDate)) {
			return convertDate(timeStampDate, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX", outputFormat);
		}
		return null;
	}
    /**
     * @deprecated Use {@link #convertTimeStampToDate(String)} instead.
     */
    @Deprecated
	public static java.sql.Date convertTimeStampToDate(String timeStampDate,String outputFormat) {
		return convertTimeStampToDate(timeStampDate);
	}

    public static java.sql.Date convertTimeStampToDate(String timeStampDate) {
		if(Core.isNotNull(timeStampDate)) {
            return formatDate(timeStampDate, "yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
		}
		return null;
	}
	
	public static Timestamp convertStringToTimestamp(String str_date,String formatIn) {
		try {
			String str_dateF = formatDateTimeString(str_date, formatIn);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern(formatIn);
			LocalDateTime localDateTime = LocalDateTime.parse(str_dateF, formatter);
			return Timestamp.valueOf(localDateTime);
		} catch (Exception e) {
			e.printStackTrace();
            try {
                DateFormat formatter = new SimpleDateFormat(formatIn);
                Date date = formatter.parse(str_date);
                return new Timestamp(date.getTime());
            } catch (ParseException ex) {
				System.err.printf("%s- IGRP WARNING convertStringToTimestamp: PT- Não estás a usar bem o formatoIN (%s) para esta data (%s). EN - You are not using well formatoIN (%s) for this date (%s)",Core.getCurrentDad(),formatIn,str_date,formatIn,str_date);
				e.printStackTrace();
				return null;
            }
        }
	}
	
	public static java.sql.Date utilDateToSqlDate(java.util.Date date) {
		return new java.sql.Date(date.getTime());
	}
	
	//calculate age or months or days
	private static long calculate(String data,String formatIn,int type) {
		long result = 0;
		try {
			data = convertDate(data, formatIn, "yyyy-MM-dd");
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