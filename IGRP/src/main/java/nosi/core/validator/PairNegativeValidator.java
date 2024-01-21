package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairNegative;
import nosi.core.webapp.Core;

/**
 * emerson
 * 26/07/2019
 */
public class PairNegativeValidator implements ConstraintValidator<PairNegative, Pair>{
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null && Core.isNotNull(pair.getKey())) {
			return Validation.validateNegative(pair.getKey());
		}
		return true;
	}

}
 