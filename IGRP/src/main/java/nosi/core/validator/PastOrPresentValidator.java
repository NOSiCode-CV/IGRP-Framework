package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

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
		if(Core.isNotNull(dateValue)) {
			return  Validation.validatePastOrPresentDate(this.currentDate,dateValue);
		}
		return true;
	}

}