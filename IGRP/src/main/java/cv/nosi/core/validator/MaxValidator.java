package cv.nosi.core.validator;

import java.math.BigDecimal;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.validator.constraints.Max;
import cv.nosi.core.webapp.util.Core;

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
		if(Core.isNotNull(value)) {
			return Validation.validateMax(""+value, this.maxValue);
		}
		return true;
	}

}
