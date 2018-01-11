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
		String auxPattern = this.justInteger ? this.intPattern : this.numPattern;
		Object obj = model.getFieldValueAsObject(fieldName);
		String value = obj.toString();
		
		if(!value.matches(auxPattern)){
			this.addError(model, fieldName, this.getMessage().equals("") ? "Este campo aceita apenas valor numerico." : this.getMessage());
		}
		
		if(this.minValue != this.maxValue){
			Float aux = new Float(value);
			if(aux < this.minValue){
				this.addError(model, fieldName, this.tooSmall.equals("") ? "Este campo deve ser superior a " + this.minValue + "." : this.tooSmall);
			}
			
			if(aux > this.maxValue){
				this.addError(model, fieldName, this.tooBig.equals("") ? "Este campo deve ser inferior a " + this.maxValue : this.tooBig);
			}
		}
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
