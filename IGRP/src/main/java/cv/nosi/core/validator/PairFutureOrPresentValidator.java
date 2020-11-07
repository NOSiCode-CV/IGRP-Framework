package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.gui.components.IGRPSeparatorList.Pair;
import cv.nosi.core.validator.constraints.PairFutureOrPresent;
import cv.nosi.core.webapp.util.Core;

/**
 * emerson
 * 31/07/2019
 */
public class PairFutureOrPresentValidator implements ConstraintValidator<PairFutureOrPresent, Pair>{

	private String currentDate;
	@Override
	public void initialize(PairFutureOrPresent constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {	
		if(pair!=null && Core.isNotNull(pair.getKey())) {
			return  Validation.validateFutureOrPresentDate(this.currentDate,pair.getKey());
		}
		return true;
	}

}

