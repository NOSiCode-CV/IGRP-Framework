package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairFuture;
import nosi.core.webapp.Core;

/**
 * emerson
 * 31/07/2019
 */
public class PairFutureValidator implements ConstraintValidator<PairFuture, Pair>{

	private String currentDate;
	@Override
	public void initialize(PairFuture constraintAnnotation) {
		this.currentDate = Core.getCurrentDate();
	}
	
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {		
		return pair!=null?Validation.validateFutureDate(this.currentDate,pair.getKey()):false;
	}

}

