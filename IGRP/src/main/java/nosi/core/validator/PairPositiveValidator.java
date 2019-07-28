package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairPositive;

/**
 * emerson
 * 26/07/2019
 */
public class PairPositiveValidator implements ConstraintValidator<PairPositive, Pair>{

	@Override
	public void initialize(PairPositive constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null) {
			return Validation.validatePositive(pair.getKey());
		}
		return false;
	}

} 
