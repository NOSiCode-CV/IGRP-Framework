package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Pattern;

/**
 * Emanuel
 * 27 Jul 2019
 */
public class PatternValidator implements ConstraintValidator<Pattern, String> {

	String regexp;
	@Override
	public void initialize(Pattern constraintAnnotation) {
		this.regexp = constraintAnnotation.regexp();
	}
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		return Validation.validatePattern(regexp,value);
	}


}
