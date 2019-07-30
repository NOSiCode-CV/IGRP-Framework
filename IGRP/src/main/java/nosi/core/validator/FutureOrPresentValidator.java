package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.validator.constraints.FutureOrPresent;
import nosi.core.webapp.Core;

/**
 * emerson
 * 29/07/2019
 */
public class FutureOrPresentValidator implements ConstraintValidator<FutureOrPresent, String>{

	private String currentDate;
	@Override
	public void initialize(FutureOrPresent constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(String dateValue, ConstraintValidatorContext context) {		
		return Validation.validateFutureOrPresentDate(this.currentDate,dateValue);
	}

}
