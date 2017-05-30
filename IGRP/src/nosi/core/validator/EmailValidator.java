package nosi.core.validator;

import java.lang.annotation.Annotation;
import nosi.core.webapp.Model;
/**
 * Marcel Iekiny
 * May 29, 2017
 */
public class EmailValidator extends Validator{

	@Override
	public void validateField(Model model, String fieldName) {
		
	}

	@Override
	public void init(Annotation annotation) {
		// First make cast to specific annotation
	}

}
