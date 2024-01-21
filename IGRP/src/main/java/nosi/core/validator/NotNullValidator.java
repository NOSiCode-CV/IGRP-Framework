package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.validator.constraints.NotNull;
import nosi.core.webapp.Core;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class NotNullValidator implements ConstraintValidator<NotNull, Object>{
	
	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		 return Core.isNotNull(value);
	}

}
