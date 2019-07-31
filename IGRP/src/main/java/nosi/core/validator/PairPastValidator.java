package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairPast;
import nosi.core.webapp.Core;

/**
 * emerson
 * 31/07/2019
 */
public class PairPastValidator implements ConstraintValidator<PairPast, Pair>{

	private String currentDate;
	@Override
	public void initialize(PairPast constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {		
		return pair!=null?Validation.validatePastDate(this.currentDate,pair.getKey()):false;
	}

}

