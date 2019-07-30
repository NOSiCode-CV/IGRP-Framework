package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.validator.constraints.PastOrPresent;
import nosi.core.webapp.Core;

/**
 * emerson
 * 29/07/2019
 */
public class PastOrPresentValidator implements ConstraintValidator<PastOrPresent, String>{

	private String currentDate;
	@Override
	public void initialize(PastOrPresent constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(String dateValue, ConstraintValidatorContext context) {		
		return Validation.validatePastOrPresentDate(this.currentDate,dateValue);
	}

}