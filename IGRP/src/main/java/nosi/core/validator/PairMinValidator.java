package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import javax.validation.constraints.DecimalMin;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public abstract class PairMinValidator implements ConstraintValidator<DecimalMin, Pair>{

	@Override
	public void initialize(DecimalMin constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null && Core.toInt(pair.getKey()) > Core.toInt(pair.getValue())) {
			return Core.isNotNull(pair.getKey());
		}
		return false;
	}

}
 