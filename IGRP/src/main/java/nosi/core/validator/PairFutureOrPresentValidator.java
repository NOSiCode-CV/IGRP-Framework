package nosi.core.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairFutureOrPresent;
import nosi.core.webapp.Core;

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

