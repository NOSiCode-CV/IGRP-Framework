package nosi.core.validator;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;
import nosi.core.webapp.Core;
import nosi.core.webapp.uploadfile.UploadFile;

/**
 * Emanuel
 * 28 Jul 2019
 */
public class Validation {

	public static boolean validatePresentDate(String currentDate, String dateValue) {
		if(Core.isNotNullMultiple(currentDate,dateValue)) {

			String d1[] = currentDate.split("-");
			String d2[] = dateValue.split("-");
			if(Core.isNotNullMultiple(d1,d2) && d1.length==3 && d2.length==3) {
				return Validation.compareDate(d1, d2) == 0;
			}
		}
  		return false;
	}
	
	public static boolean validatePastDate(String currentDate, String dateValue) {
		if(Core.isNotNullMultiple(currentDate,dateValue)) {

			String d1[] = currentDate.split("-");
			String d2[] = dateValue.split("-");
			if(Core.isNotNullMultiple(d1,d2) && d1.length==3 && d2.length==3) {
				return Validation.compareDate(d1, d2) < 0;
			}
		}
  		return false;
	}
	
	public static boolean validatePastOrPresentDate(String currentDate, String dateValue) {
		if(Core.isNotNullMultiple(currentDate,dateValue)) {

			String d1[] = currentDate.split("-");
			String d2[] = dateValue.split("-");
			if(Core.isNotNullMultiple(d1,d2) && d1.length==3 && d2.length==3) {
				return Validation.compareDate(d1, d2) <= 0;
			}
		}
  		return false;
	}
	
	public static boolean validateFutureDate(String currentDate, String dateValue) {
		if(Core.isNotNullMultiple(currentDate,dateValue)) {

			String d1[] = currentDate.split("-");
			String d2[] = dateValue.split("-");
			if(Core.isNotNullMultiple(d1,d2) && d1.length==3 && d2.length==3) {
				return Validation.compareDate(d1, d2) > 0;
			}
		}
  		return false;
	}
	
	public static boolean validateFutureOrPresentDate(String currentDate, String dateValue) {
		if(Core.isNotNullMultiple(currentDate,dateValue)) {

			String d1[] = currentDate.split("-");
			String d2[] = dateValue.split("-");
			if(Core.isNotNullMultiple(d1,d2) && d1.length==3 && d2.length==3) {
				return Validation.compareDate(d1, d2) >= 0;
			}
		}
  		return false;
	}
	
	private static int compareDate(String[]d1,String[]d2) {
		LocalDate ldt1 = Validation.convertLocalDate(d1);
		LocalDate ldt2 = Validation.convertLocalDate(d2);
		return Period.between(ldt1,ldt2).getDays();
	}
	
	private static LocalDate convertLocalDate(String[] d) {
		return LocalDate.of(Core.toInt(d[2]).intValue(), Core.toInt(d[1]).intValue(),Core.toInt(d[0]).intValue());
	}
	
	public static boolean validateSize(String value,int min, int max) {
		int size = (""+value).length();
		return size >= min && size <= max;
	}
	
	public static boolean validatePositive(String value) {
		return Core.toBigDecimal(value).compareTo(BigDecimal.ZERO) > 0;
	}
	
	public static boolean validatePositiveOrZero(String value) {
		return Core.toBigDecimal(value).compareTo(BigDecimal.ZERO) >= 0;
	}
	
	public static boolean validateNegative(String value) {
		return Core.toBigDecimal(value).compareTo(BigDecimal.ZERO) < 0;
	}
	public static boolean validateNegativeOrZero(String value) {
		return Core.toBigDecimal(value).compareTo(BigDecimal.ZERO) <= 0;
	}
	
	public static boolean validateMax(String value,BigDecimal maxValue) {
		return Core.toBigDecimal(value).compareTo(maxValue) < 0;
	}

	public static boolean validateMin(String value, BigDecimal minValue) {
		return Core.toBigDecimal(value).compareTo(minValue) > 0;
	}
	
	public static boolean validateFileNotNull(UploadFile file) {
		boolean r = false;
		if(file!=null) {
			if(Core.isNotNull(file.getId()) && !file.getId().equals("-1"))
				return true;
			r =  Core.isNotNullMultiple(file.getInputStream(),file.getContentType(),file.getSubmittedFileName());
		}
		return r;
	}
	
	public static boolean validatePattern(String regexp,String value) {
		if(Core.isNotNull(value)) {
			return Pattern.matches(regexp, value);
		}
		return false;
	}
	
	public static boolean validateDigits(int integer,int fraction, String value) {
		if(fraction > 0) {
			String number = Validation.normalizeNumber(value);
			if(number.contains(".")) {
				String[] numberSplit = number.split("\\.");
				number = numberSplit[0];
				if(numberSplit.length > 2) {
					for(int i=1;i<numberSplit.length-1;i++) {
						number += numberSplit[i];
					}
				}
				return Core.digits(number) == integer && Core.digits(numberSplit[numberSplit.length-1]) == fraction;
			}
		}else {
			return Core.digits(value) == integer;
		}
		return false;
	}
	
	private static String normalizeNumber(String number) {
		return number.replaceAll(",", ".");
	}

}
