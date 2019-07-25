package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class PairValidator implements ConstraintValidator<PairNotNull, Pair>{

	@Override
	public void initialize(PairNotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null) {
			return Core.isNotNull(pair.getKey());
		}
		return false;
	}

}
