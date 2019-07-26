package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class PairPositiveOrZeroValidator implements ConstraintValidator<PairPositiveOrZero, Pair>{

	@Override
	public void initialize(PairPositiveOrZero constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null && Core.toInt(pair.getKey()) >= 0) {
			return Core.isNotNull(pair.getKey());
		}
		return false;
	}
 
}
