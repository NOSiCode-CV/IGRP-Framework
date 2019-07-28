package nosi.core.validator;

import java.math.BigDecimal;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.Max;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class MaxValidator implements ConstraintValidator<Max, Number>{

	private BigDecimal maxValue;
	
	@Override
	public void initialize(Max constraintAnnotation) {
		this.maxValue = Core.toBigDecimal(constraintAnnotation.value());
	}
	 
	@Override
	public boolean isValid(Number value, ConstraintValidatorContext context) {
		if(value!=null) {
			return Validation.validateMax(""+value, this.maxValue);
		}
		return false;
	}

}
