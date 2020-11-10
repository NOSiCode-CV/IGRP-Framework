package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.gui.components.IGRPSeparatorList.Pair;
import cv.nosi.core.validator.constraints.PairDigits;
import cv.nosi.core.webapp.util.Core;

/**
 * Emanuel
 * 27 Jul 2019
 */
public class PairDigitsValidator implements ConstraintValidator<PairDigits, Pair>{

	int fraction = 0;
	int integer = Integer.MAX_VALUE;
	
	@Override
	public void initialize(PairDigits constraintAnnotation) {
		if(constraintAnnotation.fraction() > 0) {
			this.fraction = constraintAnnotation.fraction();
		}
		if(constraintAnnotation.integer()> 0 && constraintAnnotation.integer() < Integer.MAX_VALUE) {
			this.integer = constraintAnnotation.integer();
		}
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null &&  Core.isNotNull(pair.getKey())) {
			return Validation.validateDigits(integer, fraction, pair.getKey());
		}
		return true;
	}
	
	
}
