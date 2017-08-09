package nosi.core.webapp;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.lang.Integer;
import java.lang.Float;
import java.lang.Double;
import java.lang.Short;
import java.lang.annotation.Annotation;
import java.lang.Long;

import nosi.core.validator.Validator;
import nosi.core.webapp.helpers.Helper;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Model { // IGRP super model
	
	private String scenario; // For validation fields
	private Map<String, ArrayList<String>> errors; // to store errors for each fields
	
	public Model(){
		this.scenario = "default"; // Default scenario for validation
		this.createErrorsPool();
	}
	
	/*
	 * Load/auto-populate (begin)
	 * */
	// this mehtod allow auto-inicialization for all sub-models
	public void load() throws IllegalArgumentException, IllegalAccessException{
		Class<? extends Model> c = this.getClass();
		for(Field m : c.getDeclaredFields()){
			m.setAccessible(true);
			String typeName = m.getType().getName();
			if(m.getType().isArray()){
				String []aux = Igrp.getInstance().getRequest().getParameterValues(m.getName());
				if(aux != null){
					// Awesome !!! We need make casts for all [] primitive type ... pff
					switch(typeName){
						case "[I": // Array of int
							//m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
							m.set(this, (int[])Helper.convertToArray(aux, "int"));
							break;
						case "[J":// Array de long
							//m.set(this, Arrays.stream(aux).mapToLong(Long::parseLong).toArray());
							m.set(this, (long[])Helper.convertToArray(aux, "long"));
							break;
						case "[D":
							//m.set(this, Arrays.stream(aux).mapToDouble(Double::parseDouble).toArray());
							m.set(this, (double[])Helper.convertToArray(aux, "double"));
							break;
						case "[S":// Array de short
							m.set(this, (short[])Helper.convertToArray(aux, "short"));
							break;
						case "[F":
							//m.set(this, Arrays.stream(aux).mapToDouble(Float::parseFloat).toArray());
							m.set(this, (float[])Helper.convertToArray(aux, "float"));
							break;
						default:
							m.set(this, typeName.equals("[Ljava.lang.String;") ? aux : null); // The field could be a Object
					}
				}
				else{
					m.set(this, aux);
				}
			}else{
				// Awesome again !!! We need make casts for all primitive type ... pff
				String aux = Igrp.getInstance().getRequest().getParameter(
							m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().equals("") ? 
									m.getAnnotation(RParam.class).rParamName()
									: m.getName() // default case use the name of field
						);
				String defaultResult = aux;
				aux = aux == null || aux.equals("") || aux.isEmpty() ? "0" : aux;
				switch(typeName){
					case "int":
							m.setInt(this, Integer.parseInt(aux));
						break;
					case "float":
							m.setFloat(this, Float.parseFloat(aux));
						break;
					case "double":
							m.setDouble(this, Double.parseDouble(aux));
						break;
					case "long":
							m.setLong(this, Long.parseLong(aux));
						break;
					case "short":
							m.setShort(this, Short.parseShort(aux));
						break;
					default:
						m.set(this, typeName == "java.lang.String" ? defaultResult : null); // The field could be a Object
				}
			}
		}
	}
	/*
	 * Load/auto-populate (end)
	 * */
	
	/*
	 * Errors/validation purpose (begin)
	 * */
	
	private void createErrorsPool(){
		this.errors = new HashMap<String, ArrayList<String>>();
		Class<? extends Model> c = this.getClass();
		for(Field m : c.getDeclaredFields())
			if(m.getDeclaredAnnotations().length > 0) // For just fields that contains annotations
				this.errors.put(m.getName(), new ArrayList<String>());
	}
	
	public String getScenario() {
		return scenario;
	}

	public void setScenario(String scenario) {
		this.scenario = scenario;
	}

	public Map<String, ArrayList<String>> getErrors() {
		return errors;
	}

	private void setErrors(Map<String, ArrayList<String>> errors) {
		this.errors = errors;
	}
	
	public boolean validate(){
		Class<? extends Model> c = this.getClass(); // use "Curringa" for warning purpose
		for(Field m : c.getDeclaredFields()){
			for(Annotation a : m.getDeclaredAnnotations()){
				Validator validator = Validator.createValidator(a.annotationType().getSimpleName(), a);
				if(validator == null) // if dont exist validator class for the annotation
					continue; 
				validator.validateField(this, m.getName());
			}
		}
		return this.hasErrors();
	}
	
	public boolean hasErrors(){
		boolean flag = false;
		if(this.errors != null){
			Iterator<ArrayList<String>> i = this.errors.values().iterator();
			while(i.hasNext())
				if(!i.next().isEmpty()){
					flag = true;
					break;
				}
		}
		return flag;
	}
	
	public boolean hasErrors(String fieldName){
		return this.errors != null && this.errors.get(fieldName) != null && this.errors.get(fieldName).size() > 0;
	}
	
	public void addError(String fieldName, String message){
		if(this.errors != null)
			if(this.errors.get(fieldName) != null)
				this.errors.get(fieldName).add(message);
			else{
				ArrayList<String> aux = new ArrayList<String>();
				aux.add(message);
				this.errors.put(fieldName, aux);
			}
	}
	
	public ArrayList<String> getErrors(String fieldName){
		return this.errors != null ? this.errors.get(fieldName) : null;
	}
	
	public Object getFieldValueAsObject(String fieldName){
		Object obj = null;
		try {
			Field field = this.getClass().getDeclaredField(fieldName);
			field.setAccessible(true);
			obj = field.get(this);
			field.setAccessible(false);
		} catch (IllegalArgumentException | IllegalAccessException | NoSuchFieldException | SecurityException e) {
			e.printStackTrace();
		}
		return obj;
	}
	/*
	 * Errors/validation purpose (end)
	 * */
	
	//... Others methods ...
}
