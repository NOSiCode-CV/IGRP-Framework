package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.validator.constraints.Digits;
import cv.nosi.core.webapp.util.Core;

/**
 * Emanuel
 * 27 Jul 2019
 */
public class DigitsValidator implements ConstraintValidator<Digits, Number>{

	int fraction = 0;
	int integer = Integer.MAX_VALUE;
	
	@Override
	public void initialize(Digits constraintAnnotation) {
		if(constraintAnnotation.fraction() > 0) {
			this.fraction = constraintAnnotation.fraction();
		}
		if(constraintAnnotation.integer()> 0 && constraintAnnotation.integer() < Integer.MAX_VALUE) {
			this.integer = constraintAnnotation.integer();
		}
	}
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(Core.isNotNull(value)) {
			return Validation.validateDigits(integer, fraction,""+value);
		}
		return true;
	}
	
	
}
