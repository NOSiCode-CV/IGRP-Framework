package nosi.core.validator;

import javax.servlet.http.Part;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.FileNotNull;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class FileNotNullValidator implements ConstraintValidator<FileNotNull, Part>{

	@Override
	public void initialize(FileNotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(Part file, ConstraintValidatorContext context) {
		if(file!=null) {
			return Validation.validateFileNotNull(file);
		}
		return false;
	}

}
