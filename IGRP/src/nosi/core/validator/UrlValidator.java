package nosi.core.validator;

import java.lang.annotation.Annotation;
import nosi.core.validator.annotation.Url;
import nosi.core.webapp.Model;
/**
 * Marcel Iekiny
 * May 29, 2017
 */
public class UrlValidator extends Validator{
	
	private String urlPattern;
	private String defaultScheme;
	private String []schemes;
	
	@Override
	public void validateField(Model model, String fieldName) {
		Object obj = model.getFieldValueAsObject(fieldName);
		String value = (obj.toString() + "").trim(); 
		if(value.length() < 2000){ // DOS attacks purpose
			if(!this.defaultScheme.equals("") && !value.contains("://"))
				value = this.defaultScheme + "://" + value;
			this.urlPattern.replace("{schemes}", String.join("|", this.schemes));
			if(!value.matches(this.urlPattern))
				this.addError(model, fieldName, !this.getMessage().equals("") ? this.getMessage() : "Url invalido " + fieldName);
		}
	}

	@Override
	public void init(Annotation annotation) {
		// First make cast to specific annotation
		Url aux = (Url)annotation;
		
		this.urlPattern = "{schemes}://(([A-Za-z0-9][A-Za-z0-9_-]*)(\\.[A-Za-z0-9][A-Za-z0-9_-]*)+)(?::\\d{1,5})?(?:$|[?/#])";
		this.defaultScheme = aux.defaultScheme();
		this.schemes = aux.schemes();
		
		this.setAcceptedScenarios(aux.acceptedScenarios());
		this.setIgnoredScenarios(aux.ignoredScenarios());
		this.setSkipOnError(aux.skipOnError());
		this.setAllowEmpty(aux.allowEmpty());
		this.setMessage(aux.message());
	}

}
