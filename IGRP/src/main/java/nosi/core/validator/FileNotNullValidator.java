package nosi.core.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import nosi.core.validator.constraints.FileNotNull;
import nosi.core.webapp.uploadfile.UploadFile;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
public class FileNotNullValidator implements ConstraintValidator<FileNotNull, UploadFile>{

	@Override
	public void initialize(FileNotNull constraintAnnotation) {
		
	}
	
	@Override
	public boolean isValid(UploadFile file, ConstraintValidatorContext context) {
		if(file!=null) {
			return Validation.validateFileNotNull(file);
		}
		return false;
	}

}
