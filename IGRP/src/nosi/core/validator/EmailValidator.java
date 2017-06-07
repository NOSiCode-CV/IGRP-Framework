package nosi.core.validator;

import java.lang.annotation.Annotation;
import nosi.core.webapp.Model;
import nosi.core.validator.annotation.Email;
/**
 * Marcel Iekiny
 * May 29, 2017
 */
public class EmailValidator extends Validator{
	
	private String emailPattern;
	private String fullEmailPattern;
	private boolean allowName;
	

	@Override
	public void validateField(Model model, String fieldName) {
		Object obj = model.getFieldValueAsObject(fieldName);
		String value = (obj.toString() + "").trim();
		if(!value.matches(!this.allowName ? this.emailPattern : this.fullEmailPattern))
			this.addError(model, fieldName, this.getMessage().equals("") ? "Email invalid." : this.getMessage());
	}

	@Override
	public void init(Annotation annotation) {
		Email aux = (Email) annotation;
		// (RFC) Please go to "http://www.regular-expressions.info/email.html" for more information and eventually bugs
		// RFC Standard ???
		this.emailPattern = "[a-zA-Z0-9!#$%&\\'*+\\/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?";
		// allow the user name concatenate with the email address
		this.fullEmailPattern = "[^@]*<[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&\'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?>";
		this.setAcceptedScenarios(aux.acceptedScenarios());
		this.setIgnoredScenarios(aux.ignoredScenarios());
		this.setSkipOnError(aux.skipOnError());
		this.setAllowEmpty(aux.allowEmpty());
		this.setMessage(aux.message());
		this.allowName = aux.allowName();
	}

}
