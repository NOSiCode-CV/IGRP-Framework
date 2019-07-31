package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairPastOrPresent;
import nosi.core.webapp.Core;

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
		return pair!=null?Validation.validatePastOrPresentDate(this.currentDate,pair.getKey()):false;
	}

}