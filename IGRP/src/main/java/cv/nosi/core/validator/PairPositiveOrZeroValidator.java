package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.gui.components.IGRPSeparatorList.Pair;
import cv.nosi.core.validator.constraints.PairPositiveOrZero;
import cv.nosi.core.webapp.util.Core;

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
		if(pair!=null && Core.isNotNull(pair.getKey())) {
			return Validation.validatePositiveOrZero(pair.getKey());
		}
		return true;
	}
 
}
