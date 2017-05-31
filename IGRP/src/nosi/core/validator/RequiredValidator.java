package nosi.core.validator;

import java.lang.annotation.Annotation;

import nosi.core.validator.annotation.Required;
import nosi.core.webapp.Model;

/**
 * Marcel Iekiny
 * May 30, 2017
 */

public class RequiredValidator extends Validator{
	
	private String requiredValue;

	@Override
	public void validateField(Model model, String fieldName) {
		Object obj = model.getFieldValueAsObject(fieldName);
		String value = obj + "";
		String msg = this.getMessage();
		if(
				((value.equals("") || value.equals("null")) && this.isSkipOnError() && !model.hasErrors()) || 
				((value.equals("") || value.equals("null")) && !this.isSkipOnError())
			)
			this.addError(model, fieldName, msg != null && !msg.equals("") ? msg : "The field " + fieldName + " could not be blank.");
	}

	@Override
	public void init(Annotation annotation) { // Map class params from validator annotation
		Required aux = (Required) annotation;
		this.requiredValue = aux.requiredValue();
		this.setMessage(aux.message());
		this.setAcceptedScenarios(aux.acceptedScenarios());
		this.setIgnoredScenarios(aux.ignoredScenarios());
		this.setSkipOnError(aux.skipOnError());
		this.setAllowEmpty(aux.allowEmpty());
	}

	public String getRequiredValue() {
		return requiredValue;
	}

	public void setRequiredValue(String requiredValue) {
		this.requiredValue = requiredValue;
	}
	
}
