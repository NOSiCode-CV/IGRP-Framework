package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.validator.constraints.PositiveOrZero;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class PositiveOrZeroValidator implements ConstraintValidator<PositiveOrZero, Number>{
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(Core.isNotNull(value)) {
			return Validation.validatePositiveOrZero(""+value);
		}
		return true;
	}
 
}
