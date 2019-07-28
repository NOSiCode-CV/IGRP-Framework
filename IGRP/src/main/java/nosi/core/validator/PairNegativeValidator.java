package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairNegative;

/**
 * emerson
 * 26/07/2019
 */
public class PairNegativeValidator implements ConstraintValidator<PairNegative, Pair>{

	@Override
	public void initialize(PairNegative constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null) {
			return Validation.validateNegative(pair.getKey());
		}
		return false;
	}

}
 