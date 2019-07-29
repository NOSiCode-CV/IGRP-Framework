package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairPresent;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 29 Jul 2019
 */
public class PairPresentValidator implements ConstraintValidator<PairPresent, Pair>{

	private String currentDate;
	@Override
	public void initialize(PairPresent constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {		
		return pair!=null?Validation.validatePresentDate(this.currentDate,pair.getKey()):false;
	}

}
