package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairPattern;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 27 Jul 2019
 */
public class PairPatternValidator implements ConstraintValidator<PairPattern, Pair> {

	String regexp;
	@Override
	public void initialize(PairPattern constraintAnnotation) {
		this.regexp = constraintAnnotation.regexp();
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		
		if(pair!=null){
			if(Core.isNotNull(pair.getKey())) {
				return Validation.validatePattern(regexp, pair.getKey());
			}
		}
		return false;
	}


}
