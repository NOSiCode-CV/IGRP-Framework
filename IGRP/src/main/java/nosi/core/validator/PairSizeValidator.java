package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairSize;

/**
 * emerson
 * 26/07/2019
 */
public class PairSizeValidator implements ConstraintValidator<PairSize, Pair>{

	private int max = Integer.MAX_VALUE;
	private int min = 0;
	
	@Override
	public void initialize(PairSize constraintAnnotation) {
		if(constraintAnnotation.min() > 0) {
			this.min = constraintAnnotation.min();
		}
		if(constraintAnnotation.max() > 0 && constraintAnnotation.max() < Integer.MAX_VALUE) {
			this.max = constraintAnnotation.max();
		}
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair != null) {
			int size = (""+pair.getKey()).length();
			return size >= this.min && size <= this.max;
		}
		return false;
	}

} 
  