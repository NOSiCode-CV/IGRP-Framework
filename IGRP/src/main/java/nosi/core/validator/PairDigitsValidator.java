package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.validator.constraints.PairDigits;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 27 Jul 2019
 */
public class PairDigitsValidator implements ConstraintValidator<PairDigits, Pair>{

	int fraction = 0;
	int integer = Integer.MAX_VALUE;
	
	@Override
	public void initialize(PairDigits constraintAnnotation) {
		if(constraintAnnotation.fraction() > 0) {
			this.fraction = constraintAnnotation.fraction();
		}
		if(constraintAnnotation.integer()> 0 && constraintAnnotation.integer() < Integer.MAX_VALUE) {
			this.integer = constraintAnnotation.integer();
		}
	}
	
	@Override
	public boolean isValid(Pair pair, ConstraintValidatorContext context) {
		if(pair!=null &&  Core.isNotNull(pair.getKey())) {
			if(this.fraction > 0) {
				String number = this.normalizeNumber(pair.getKey());
				if(number.contains(".")) {
					String[] numberSplit = number.split("\\.");
					number = numberSplit[0];
					if(numberSplit.length > 2) {
						for(int i=1;i<numberSplit.length-1;i++) {
							number += numberSplit[i];
						}
					}
					return Core.digits(number) == this.integer && Core.digits(numberSplit[numberSplit.length-1]) == this.fraction;
				}
			}else {
				return Core.digits(pair.getKey()) == this.integer;
			}
		}
		return false;
	}
	
	private String normalizeNumber(String number) {
		return number.replaceAll(",", ".");
	}
}
