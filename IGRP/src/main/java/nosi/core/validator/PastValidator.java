package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.validator.constraints.Past;
import nosi.core.webapp.Core;

/**
 * emerson
 * 29/07/2019
 */
public class PastValidator implements ConstraintValidator<Past, String>{

	private String currentDate;
	@Override
	public void initialize(Past constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(String dateValue, ConstraintValidatorContext context) {		
		if(Core.isNotNull(dateValue)) {
			return  Validation.validatePastDate(this.currentDate,dateValue);
		}
		return true;
	}

}