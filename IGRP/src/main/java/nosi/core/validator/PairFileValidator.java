package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairFileNotNull;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class PairFileValidator implements ConstraintValidator<PairFileNotNull, Pair>{

	@Override
	public void initialize(PairFileNotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null && pair.getFile()!=null) {
			return Validation.validateFileNotNull(pair.getFile());
		}
		return false;
	}

}
