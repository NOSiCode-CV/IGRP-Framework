package nosi.core.validator;

import java.util.regex.Pattern;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 25 Jul 2019
 */
public class PairEmailValidator implements ConstraintValidator<PairEmail, Pair>{

	String regex;
	@Override
	public void initialize(PairEmail constraintAnnotation) {
		this.regex = constraintAnnotation.regex();
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		
		if(pair!=null){
			if(Core.isNotNull(pair.getKey())) {
				return Pattern.matches(regex, pair.getKey());
			}
		}
		return false;
	}

}
