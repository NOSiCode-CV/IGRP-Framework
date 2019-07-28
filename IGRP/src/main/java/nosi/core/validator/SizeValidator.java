package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Size;

/**
 * emerson
 * 26/07/2019
 */
public class SizeValidator implements ConstraintValidator<Size, String>{

	private int max = Integer.MAX_VALUE;
	private int min = 0;
	
	@Override
	public void initialize(Size constraintAnnotation) {
		if(constraintAnnotation.min() > 0) {
			this.min = constraintAnnotation.min();
		}
		if(constraintAnnotation.max() > 0 && constraintAnnotation.max() < Integer.MAX_VALUE) {
			this.max = constraintAnnotation.max();
		}
	}
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(value != null) {
			return Validation.validateSize(value, min, max);
		}
		return false;
	}

} 
  