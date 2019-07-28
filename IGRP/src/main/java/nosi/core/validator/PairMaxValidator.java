package nosi.core.validator;

import java.math.BigDecimal;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairMax;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class PairMaxValidator implements ConstraintValidator<PairMax, Pair>{

	private BigDecimal maxValue;
	
	@Override
	public void initialize(PairMax constraintAnnotation) {
		this.maxValue = Core.toBigDecimal(constraintAnnotation.value());
	}
	 
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null) {
			return Validation.validateMax(pair.getKey(), this.maxValue);
		}
		return false;
	}

}
