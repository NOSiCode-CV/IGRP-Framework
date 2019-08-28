package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.NegativeOrZero;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class NegativeOrZeroValidator implements ConstraintValidator<NegativeOrZero, Number>{

	@Override
	public void initialize(NegativeOrZero constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(Core.isNotNull(value)) {
			return Validation.validateNegativeOrZero(""+value);
		}
		return true;
	}

}
 