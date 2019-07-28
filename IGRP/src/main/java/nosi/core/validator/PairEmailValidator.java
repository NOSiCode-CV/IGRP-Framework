package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairEmail;
/**
 * Emanuel
 * 25 Jul 2019
 */
public class PairEmailValidator implements ConstraintValidator<PairEmail, Pair>{

	String regexp;
	@Override
	public void initialize(PairEmail constraintAnnotation) {
		this.regexp = constraintAnnotation.regexp();
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null){
			return Validation.validatePattern(regexp, pair.getKey());
		}
		return false;
	}

}
