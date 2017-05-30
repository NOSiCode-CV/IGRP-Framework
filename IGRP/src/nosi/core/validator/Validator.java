package nosi.core.validator;

import nosi.core.webapp.Model;
/**
 * Marcel Iekiny
 * May 29, 2017
 */
public class Validator {
	
	private String message;
	private String []scenarios;
	
	private boolean allowEmpty = true; // for null or empty value
	
	public void validateField(Model model, String fieldName){
		
	}
	
	public void addError(Model model, String fieldName, String message){
		model.addError(fieldName, message);
	}

}
