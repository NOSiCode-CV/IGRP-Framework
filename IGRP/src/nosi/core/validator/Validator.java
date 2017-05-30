package nosi.core.validator;

import nosi.core.webapp.Model;
/**
 * Marcel Iekiny
 * May 29, 2017
 */
public abstract class Validator {
	
	private String message;
	
	private String []acceptedScenarios; // List of scenarios that the validator must  be apply
	private String []ignoredScenarios; // List of scenarios to ignored
	
	private boolean allowEmpty = true; // for null or empty value
	private boolean skipOnError = false;
	
	public abstract void validateField(Model model, String fieldName); // Validate a single attribute/filed
	
	protected void addError(Model model, String fieldName, String message){ // Add error to a single attribute/field
		model.addError(fieldName, message);
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String[] getAcceptedScenarios() {
		return acceptedScenarios;
	}

	public void setAcceptedScenarios(String[] acceptedScenarios) {
		this.acceptedScenarios = acceptedScenarios;
	}

	public String[] getIgnoredScenarios() {
		return ignoredScenarios;
	}

	public void setIgnoredScenarios(String[] ignoredScenarios) {
		this.ignoredScenarios = ignoredScenarios;
	}

	public boolean isAllowEmpty() {
		return allowEmpty;
	}

	public void setAllowEmpty(boolean allowEmpty) {
		this.allowEmpty = allowEmpty;
	}

	public boolean isSkipOnError() {
		return skipOnError;
	}

	public void setSkipOnError(boolean skipOnError) {
		this.skipOnError = skipOnError;
	}
	
	public static Validator createValidator(String validatorName){
		try {
			Class c = Class.forName("nosi.core.validator." + validatorName + "Validator");
			return (Validator) c.newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
