package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.validator.constraints.Present;
import cv.nosi.core.webapp.util.Core;

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
		if(Core.isNotNull(dateValue))
			return Validation.validatePresentDate(this.currentDate,dateValue);
		return true;
	}

}
