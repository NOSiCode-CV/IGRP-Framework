package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.NotNull;
import nosi.core.webapp.Core;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class NotNullValidator implements ConstraintValidator<NotNull, String>{

	@Override
	public void initialize(NotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		 return Core.isNotNull(value);
	}

}
