package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Negative;

/**
 * emerson
 * 26/07/2019
 */
public class NegativeValidator implements ConstraintValidator<Negative, Number>{

	@Override
	public void initialize(Negative constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(value!=null) {
			return Validation.validateNegative(""+value);
		}
		return false;
	}

}
 