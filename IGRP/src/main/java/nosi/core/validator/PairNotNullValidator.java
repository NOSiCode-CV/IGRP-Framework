package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairNotNull;
import nosi.core.webapp.Core;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class PairNotNullValidator implements ConstraintValidator<PairNotNull, Pair>{
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		return pair!=null && Core.isNotNull(pair.getKey());
	}

}
