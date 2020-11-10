package cv.nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import cv.nosi.core.gui.components.IGRPSeparatorList.Pair;
import cv.nosi.core.validator.constraints.PairPastOrPresent;
import cv.nosi.core.webapp.util.Core;

/**
 * emerson
 * 31/07/2019
 */
public class PairPastOrPresentValidator implements ConstraintValidator<PairPastOrPresent, Pair>{

	private String currentDate;
	@Override
	public void initialize(PairPastOrPresent constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {		
		if(pair!=null && Core.isNotNull(pair.getKey())) {
			return  Validation.validatePastOrPresentDate(this.currentDate,pair.getKey());
		}
		return true;
	}

}