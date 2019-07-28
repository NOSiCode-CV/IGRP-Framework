package nosi.core.validator;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.regex.Pattern;

import javax.servlet.http.Part;

import nosi.core.webapp.Core;

/**
 * Emanuel
 * 28 Jul 2019
 */
public class Validation {
	
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
	
	public static boolean validateFileNotNull(Part file) {
		boolean r = false;
		if(file!=null) {
			try {
				r =  Core.isNotNullMultiple(file.getInputStream(),file.getContentType(),file.getSubmittedFileName());
			} catch (IOException e) {
				try {
					file.delete();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
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
