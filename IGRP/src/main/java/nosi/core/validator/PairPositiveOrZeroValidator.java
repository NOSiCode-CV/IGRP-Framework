package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairPositiveOrZero;

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
		if(pair!=null) {
			return Validation.validatePositiveOrZero(pair.getKey());
		}
		return false;
	}
 
}
