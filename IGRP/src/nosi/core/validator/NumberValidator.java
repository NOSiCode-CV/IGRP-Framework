package nosi.core.validator;

import java.lang.annotation.Annotation;
import nosi.core.validator.annotation.Number;
import nosi.core.webapp.Model;

/**
 * Marcel Iekiny
 * Jun 2, 2017
 */
public class NumberValidator extends Validator{
	
	private boolean justInteger; // allow just integer number
	private float minValue; // min bound
	private float maxValue; // max bound
	private String tooBig; // error message when it is too big
	private String tooSmall;// errro message when it is too small
	private String intPattern;
	private String numPattern;
	
	@Override
	public void validateField(Model model, String fieldName) {
		
	}
	
	@Override
	public void init(Annotation annotation) {
		Number aux = (Number) annotation;
		
		this.justInteger = aux.justInteger();
		this.minValue = aux.minValue();
		this.maxValue = aux.maxValue();
		this.tooBig = aux.tooBig();
		this.tooSmall = aux.tooSmall();
		
		this.intPattern = "\\s*[+-]?\\d+\\s*"; // Pattern for just integer
		this.numPattern = "\\s*[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?\\s*"; // any number: int, float, number, cientific notation and so one ...
		
		this.setAcceptedScenarios(aux.acceptedScenarios());
		this.setIgnoredScenarios(aux.ignoredScenarios());
		this.setSkipOnError(aux.skipOnError());
		this.setAllowEmpty(aux.allowEmpty());
		this.setMessage(aux.message());
	}

}
