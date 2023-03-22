package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.validator.constraints.Positive;
import nosi.core.webapp.Core;

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
