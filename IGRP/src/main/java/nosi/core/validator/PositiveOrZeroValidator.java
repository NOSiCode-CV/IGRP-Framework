package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.PositiveOrZero;

/**
 * emerson
 * 26/07/2019
 */
public class PositiveOrZeroValidator implements ConstraintValidator<PositiveOrZero, Number>{

	@Override
	public void initialize(PositiveOrZero constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(value!=null) {
			return Validation.validatePositiveOrZero(""+value);
		}
		return false;
	}
 
}
