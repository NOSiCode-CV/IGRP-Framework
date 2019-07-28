package nosi.core.validator;

import java.io.IOException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairFileNotNull;
import nosi.core.webapp.Core;

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
			try {
				return Core.isNotNullMultiple(pair.getFile().getInputStream(),pair.getFile().getContentType(),pair.getFile().getSubmittedFileName());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

}
