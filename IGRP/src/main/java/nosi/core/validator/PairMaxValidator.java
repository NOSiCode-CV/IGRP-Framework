package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public abstract class PairMaxValidator implements ConstraintValidator<PairMax, Pair>{

	@Override
	public void initialize(PairMax constraintAnnotation) {
		
	}
	 
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null && Core.toInt(pair.getKey()) < Core.toInt(pair.getValue())) {
			return Core.isNotNull(pair.getKey());
		}
		return false;
	}

}
