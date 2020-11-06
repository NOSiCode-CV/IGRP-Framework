package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.NotNull;
import nosi.core.webapp.util.Core;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class NotNullValidator implements ConstraintValidator<NotNull, Object>{

	@Override
	public void initialize(NotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		 return Core.isNotNull(value);
	}

}
