package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Email;
import nosi.core.webapp.util.Core;

/**
 * Emanuel
 * 29 Aug 2019
 */
public class EmailValidator implements ConstraintValidator<Email,String>{

	String regexp;
	@Override
	public void initialize(Email constraintAnnotation) {
		this.regexp = constraintAnnotation.regexp();
	}
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		if(Core.isNotNull(value)){
			return Validation.validatePattern(regexp,value);
		}
		return true;
	}


}
