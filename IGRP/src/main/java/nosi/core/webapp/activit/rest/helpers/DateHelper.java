package nosi.core.webapp.activit.rest.helpers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.function.BiFunction;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 15 May 2019
 */
public class DateHelper {
	
	public static boolean compareDate(String date1,String date2,BiFunction<LocalDate, LocalDate, Boolean> compareDate) {
		if(Core.isNotNullMultiple(date1,date2)) {
			String date1_ = Core.convertDate(date1, "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd");
			String date2_ = Core.convertDate(date2, "dd-MM-yyyy", "yyyy-MM-dd");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate d1 = LocalDate.parse(date1_, formatter );
			LocalDate d2 = LocalDate.parse(date2_, formatter );
			return compareDate.apply(d1, d2);
		}
		return false;
	}

	public static boolean compareDate(Date date1,String date2,BiFunction<LocalDate, LocalDate, Boolean> compareDate) {	
		if(Core.isNotNullMultiple(date1,date2)) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String dt1 = df.format(date1);
			String date2_ = Core.convertDate(date2, "dd-MM-yyyy", "yyyy-MM-dd");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate d1 = LocalDate.parse(dt1, formatter );
			LocalDate d2 = LocalDate.parse(date2_.toString(), formatter );
			return compareDate.apply(d1, d2);
		}
		return false;
	}
	
	public static String dateTimeToDate(String dateTime) {
		return Core.ToChar(dateTime, "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss");
	}
}
