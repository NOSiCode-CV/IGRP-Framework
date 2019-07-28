package nosi.core.validator;

import java.math.BigDecimal;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairMin;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class PairMinValidator implements ConstraintValidator<PairMin, Pair>{

	private BigDecimal minValue;
	@Override
	public void initialize(PairMin constraintAnnotation) {
		this.minValue = Core.toBigDecimal(constraintAnnotation.value());		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null) {
			return Validation.validateMin(pair.getKey(), this.minValue);
		}
		return false;
	}

}
 