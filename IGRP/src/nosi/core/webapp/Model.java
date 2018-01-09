package nosi.core.webapp;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.lang.Integer;
import java.lang.Float;
import java.lang.Double;
import java.lang.Short;
import java.lang.annotation.Annotation;
import java.lang.Long;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.validator.Validator;
import nosi.core.webapp.databse.helpers.CRUDOperation;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.CRUD;
import nosi.webapps.igrp.dao.Config_env;
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
		List<Field> fields = new ArrayList<Field>(); // For particular case purpose ...
		for(Field m : c.getDeclaredFields()){
			m.setAccessible(true);
			String typeName = m.getType().getName();
			if(m.getType().isArray()){
				String []aux = Igrp.getInstance().getRequest().getParameterValues(
						m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().equals("") ? 
								m.getAnnotation(RParam.class).rParamName()
								: m.getName() // default case use the name of field
						);
				if(aux != null){
					// Awesome !!! We need make casts for all [] primitive type ... pff
					switch(typeName){
						case "[I": // Array of int
							//m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
							m.set(this, (int[])IgrpHelper.convertToArray(aux, "int"));
							break;
						case "[J":// Array de long
							//m.set(this, Arrays.stream(aux).mapToLong(Long::parseLong).toArray());
							m.set(this, (long[])IgrpHelper.convertToArray(aux, "long"));
							break;
						case "[D":
							//m.set(this, Arrays.stream(aux).mapToDouble(Double::parseDouble).toArray());
							m.set(this, (double[])IgrpHelper.convertToArray(aux, "double"));
							break;
						case "[S":// Array de short
							m.set(this, (short[])IgrpHelper.convertToArray(aux, "short"));
							break;
						case "[F":
							//m.set(this, Arrays.stream(aux).mapToDouble(Float::parseFloat).toArray());
							m.set(this, (float[])IgrpHelper.convertToArray(aux, "float"));
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
				String defaultResult = (aux != null && !aux.isEmpty() ? aux : null);
				try {
					aux = (aux == null || aux.equals("") || aux.isEmpty() ? (!m.getAnnotation(RParam.class).defaultValue().equals("") ? m.getAnnotation(RParam.class).defaultValue() : "0") : aux);
				}catch(Exception e) {
					aux = "0"; 
				}
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
						m.set(this, typeName == "java.lang.String" ? (defaultResult == null ? m.getAnnotation(RParam.class).defaultValue() : defaultResult) : null); // The field could be a Object 
				}
			}
			/* Begin */
			if(m.isAnnotationPresent(SeparatorList.class)) {
				fields.add(m);				
			}
			/* End*/
		}
		
		for(Field obj : fields) {
			Map<String, List<String>> mapFk = new HashMap<String, List<String>>();
			Map<String, List<String>> mapFkDesc = new HashMap<String, List<String>>();
			
			Class c_ = obj.getDeclaredAnnotation(SeparatorList.class).name();
			
			List<String> aux = new ArrayList<String>();
			 for(Field m : c_.getDeclaredFields()){
					m.setAccessible(true);
					aux.add(m.getName());
					
					String []values1 = Igrp.getInstance().getRequest().getParameterValues("p_" + m.getName() + "_fk");
					String []values2 = Igrp.getInstance().getRequest().getParameterValues("p_" + m.getName() + "_fk_desc");
					
					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<String>());
					mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : new ArrayList<String>());
					
					m.setAccessible(false);
			 }
			 
			 ArrayList<Object> auxResults = new ArrayList<>();
			 
			 obj.setAccessible(true);
			 obj.set(this, auxResults);
			 obj.setAccessible(false);
			 
			 try {
				
				for(int i = 0; i < 1000 /* This will never happen ...*/; i++) {
					Object obj2 = Class.forName(c_.getName()).newInstance();
					for(Field m : obj2.getClass().getDeclaredFields()){
						m.setAccessible(true);
						try {
							m.set(obj2, new IGRPSeparatorList.Pair(mapFk.get(m.getName()).get(i), mapFkDesc.get(m.getName()).get(i)));
						}catch (IndexOutOfBoundsException e) {
							 throw e; // Throw it again ... and catch it later ...
						}
						finally {
							m.setAccessible(false);
						}
					}
					auxResults.add(obj2);
				}
				
			} catch (ClassNotFoundException | InstantiationException e) {
				e.printStackTrace();
			}
			 catch (IndexOutOfBoundsException e) {
				 continue; // go to next Separator list
			}
			 //...
		}
		
	}
	
	
	private boolean save(Model model,boolean isUpdate) throws IllegalArgumentException, IllegalAccessException{	
		model.load();
		Class<? extends Model> c = this.getClass();
		Action ac = new Action().find()
								.andWhere("page", "=",c.getSimpleName())
								.andWhere("application.dad", "=",Igrp.getInstance().getCurrentAppName())
								.one();
		if(ac.getCrud()!=null){
			CRUD crud = ac.getCrud();
			Config_env config = crud.getConfig_env();
			if(isUpdate)
				return new CRUDOperation().insert(crud.getSchemaName(), config, crud.getTableName(),model);
			else
				return new CRUDOperation().update( config, crud.getSchemaName(),crud.getTableName(),model,id);
		}
		return false;
	}
	
	public boolean save(Model model) throws IllegalArgumentException, IllegalAccessException {
		return this.save(model,!false);
	}
	
	Object id = null;
	public boolean update(Model model,Object id) throws IllegalArgumentException, IllegalAccessException{
		this.id = id;
		return this.save(model,false);
	}
	
	public boolean delete(Object id){
		Class<? extends Model> c = this.getClass();
		Action ac = new Action().find()
								.andWhere("page", "=",c.getSimpleName())
								.andWhere("application.dad", "=",Igrp.getInstance().getCurrentAppName())
								.one();
		if(ac.getCrud()!=null){
			CRUD crud = ac.getCrud();
			Config_env config = crud.getConfig_env();
			return new CRUDOperation().delete(crud.getSchemaName(), config, crud.getTableName(),id);
		}
		return false;
	}
	

	public void select(Object id) {
		Class<? extends Model> c = this.getClass();
		Action ac = new Action().find()
				.andWhere("page", "=",c.getSimpleName())
				.andWhere("application.dad", "=",Igrp.getInstance().getCurrentAppName())
				.one();
			if(ac.getCrud()!=null){
				CRUD crud = ac.getCrud();
				Config_env config = crud.getConfig_env();
				Map<String,Object> list = new CRUDOperation().selectOne(crud.getSchemaName(), config, crud.getTableName(),id);
				if(list!=null && list.size() > 0) {
					class GetField{		
						private int count=0;
						public Field getField(String name) {
							Field f = null;
							try {
								f = c.getDeclaredField(name.toLowerCase());
								return f;
							} catch (NoSuchFieldException e) {
								if(count==0) {
									++count;
									return getField("p_"+name);
								}
							} catch (SecurityException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							return null;
						}
					}
					for(Entry<String, Object> data:list.entrySet()) {					
						Field f = new GetField().getField(data.getKey());
						if(f !=null) {
							f.setAccessible(true);
							try {
								this.setFieldValue(f, data.getValue().toString());
							} catch (IllegalArgumentException | IllegalAccessException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}
			}
	}
	
	private void setFieldValue(Field f,String value) throws NumberFormatException, IllegalArgumentException, IllegalAccessException {
		String defaultResult = value;
		value = value == null || value.equals("") || value.isEmpty() ? "0" : value;
		String typeName = f.getType().getName();
		switch(typeName){
			case "int":
					f.setInt(this, Integer.parseInt(value));
				break;
			case "float":
					f.setFloat(this, Float.parseFloat(value));
				break;
			case "double":
					f.setDouble(this, Double.parseDouble(value));
				break;
			case "long":
					f.setLong(this, Long.parseLong(value));
				break;
			case "short":
					f.setShort(this, Short.parseShort(value));
				break;
			default:
				f.set(this, typeName == "java.lang.String" ? defaultResult : null); // The field could be a Object
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
	

	public Object getFieldValueAsObject(Model model,String fieldName){
		Object obj = null;
		try {
			Field field = model.getClass().getDeclaredField(fieldName);
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
