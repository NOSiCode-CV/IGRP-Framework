package nosi.core.validator;

import java.math.BigDecimal;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Min;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class MinValidator implements ConstraintValidator<Min, Number>{

	private BigDecimal minValue;
	@Override
	public void initialize(Min constraintAnnotation) {
		this.minValue = Core.toBigDecimal(constraintAnnotation.value());		
	}
	
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(value!=null) {
			return Validation.validateMin(""+value, this.minValue);
		}
		return false;
	}

}
 