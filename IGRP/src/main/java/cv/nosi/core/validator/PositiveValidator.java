package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.validator.constraints.Positive;
import cv.nosi.core.webapp.util.Core;

/**
 * emerson
 * 26/07/2019
 */
public class PositiveValidator implements ConstraintValidator<Positive, Number>{

	@Override
	public void initialize(Positive constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(Core.isNotNull(value)) {
			return Validation.validatePositive(""+value);
		}
		return true;
	}

} 
