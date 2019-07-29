package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Present;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 29 Jul 2019
 */
public class PresentValidator implements ConstraintValidator<Present, String>{

	private String currentDate;
	@Override
	public void initialize(Present constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(String dateValue, ConstraintValidatorContext context) {		
		return Validation.validatePresentDate(this.currentDate,dateValue);
	}

}
