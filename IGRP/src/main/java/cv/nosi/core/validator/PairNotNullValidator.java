package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.gui.components.IGRPSeparatorList.Pair;
import cv.nosi.core.validator.constraints.PairNotNull;
import cv.nosi.core.webapp.util.Core;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class PairNotNullValidator implements ConstraintValidator<PairNotNull, Pair>{

	@Override
	public void initialize(PairNotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		return pair!=null && Core.isNotNull(pair.getKey());
	}

}
