package nosi.core.webapp.activit.rest.helpers;

import java.time.LocalDate;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.BiFunction;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 15 May 2019
 */
public class DateHelper {
	
	public static boolean compareDate(String date1, String date2, BiFunction<LocalDate, LocalDate, Boolean> compareDate) {
		if (Core.isNotNullMultiple(date1, date2)) {
			String date1_ = Core.convertDate(date1, "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd");
			String date2_ = Core.convertDate(date2, "dd-MM-yyyy", "yyyy-MM-dd");
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate d1 = LocalDate.parse(date1_, formatter);
			LocalDate d2 = LocalDate.parse(date2_, formatter);
			return compareDate.apply(d1, d2);
		}
		return false;
	}

	public static boolean compareDate(Date date1, String date2, BiFunction<LocalDate, LocalDate, Boolean> compareDate) {	
		if (Core.isNotNullMultiple(date1, date2)) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String dt1 = date1.toInstant().atZone(ZoneOffset.ofHours(0)).toLocalDate().format(formatter);
			String dt2 = Core.convertDate(date2, "dd-MM-yyyy", "yyyy-MM-dd");
			LocalDate d1 = LocalDate.parse(dt1, formatter);
			LocalDate d2 = LocalDate.parse(dt2, formatter);
			return compareDate.apply(d1, d2);
		}
		return false;
	}
	
	public static String dateTimeToDate(String dateTime) {
		return Core.ToChar(dateTime, "yyyy-MM-dd'T'HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
	}
	
	public static Map<String, String> getDateFilter() {
		Map<String, String> status = new LinkedHashMap<>();
		status.put("DI", "Inicio etapa");
		status.put("DF", "Fim etapa");
		return status;
	}
	
	public static String toDateTime(String modelDate) {
		return toDateTime(modelDate, 0);
	}
	
	public static String toDateTime(String modelDate, long plusDays) {
		return Core.convertStringToLocalDateTime(modelDate, Core.DD_MM_YYYY)
				.atOffset(ZoneOffset.ofHours(-1))
				.plusDays(plusDays) + "";
	}
	
}