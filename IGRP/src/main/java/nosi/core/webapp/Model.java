package nosi.core.webapp;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.Tuple;
import org.apache.commons.beanutils.BeanUtils;
import com.google.gson.Gson;
import java.lang.Double;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.webapp.activit.rest.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.HistoricTaskService;
import nosi.core.webapp.activit.rest.TaskVariables;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.IgrpHelper;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Model { // IGRP super model
	
//	private String scenario; // For validation fields
//	private Map<String, ArrayList<String>> errors; // to store errors for each fields

	public Model(){}
	
	public void load(BaseQueryInterface query) throws IllegalArgumentException, IllegalAccessException {
		if(query != null){
			List<Tuple> list = query.getResultList();
			if(Core.isNotNull(list))
			for(Tuple tuple:list) {
				for(Field field:this.getClass().getDeclaredFields()) {
					field.setAccessible(true);
					try {
						if(field.getAnnotation(RParam.class)!=null)
							IgrpHelper.setField(this,field,  tuple.get(field.getName()));
					}catch(java.lang.IllegalArgumentException e) {}
				}
			}	
			else
				Core.setMessageError("QUERY result list null error. Please check connection");
		}
	}
	

	public void loadFromTask(String taskId) throws IllegalArgumentException, IllegalAccessException {
		HistoricTaskService hts = Core.getTaskHistory(taskId);
		if(hts!=null && hts.getVariables() !=null) {
			List<TaskVariables> var = hts.getVariables().stream().filter(v->v.getName().equalsIgnoreCase("customVariableIGRP_"+hts.getId())).collect(Collectors.toList());
			String json = (var!=null && var.size() >0)?var.get(0).getValue().toString():"";
			if(Core.isNotNull(json)) {
				CustomVariableIGRP custom = new Gson().fromJson(json, CustomVariableIGRP.class);
				if(custom.getRows()!=null){
					custom.getRows().stream().forEach(v->{
						if(!v.getName().equalsIgnoreCase("taskId"))
							Core.setAttribute(v.getName(), v.getValue());
					});
				}
			}
			this.load();
		}
	}
	
	public <T> List<T> loadTable(BaseQueryInterface query, Class<T> className) {
		if(query!=null) {
			List<Tuple> tuples = query.getResultList();
			if(tuples!=null && !tuples.isEmpty()) {
				List<T> list = new ArrayList<>();
				for(Tuple tuple:tuples) {
					T t;
					try {
						t = className.newInstance();
						for(Field field:className.getDeclaredFields()) {
							try {
								Object value = tuple.get(field.getName());
								if(value!=null) {
									BeanUtils.setProperty(t, field.getName(),value.toString());
								}
							}catch(java.lang.IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
								
							}
						}
						list.add(t);
					} catch (InstantiationException | IllegalAccessException e1) {
						e1.printStackTrace();
					}
				}
				return list;
			}
		}
		return null;
	}
	
	public <T> List<T> loadFormList(BaseQueryInterface query, Class<T> className) {
		if(query!=null) {
			List<Tuple> queryResult = query.getResultList();
			if(queryResult != null) {
				List<T> list = new ArrayList<>();
				for(Tuple tuple:queryResult) {
					T t;
					try {
						t = className.newInstance();
						for(Field field:className.getDeclaredFields()) {
							try {
								Object value = tuple.get(field.getName());
								if(value!= null)
									BeanUtils.setProperty(t, field.getName(),new Pair(value.toString(),value.toString()));
							}catch(java.lang.IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
								
							}
						}
						list.add(t);
					} catch (InstantiationException | IllegalAccessException e1) {
						e1.printStackTrace();
					}
				}
				return list;
			}			
		}
		return null;
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
				String []aux = null;
					aux =  (String[]) Core.getParamArray(
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
				String name =   m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().equals("") ? 
								m.getAnnotation(RParam.class).rParamName()
							  : m.getName();
				
				Object o = Core.getParam(name); // default case use the name of field 
				
				String aux = "";
				if(o != null)
					if(o.getClass().isArray()) {
					String []s = (String[]) o;
					aux = s[s.length - 1];
					}else
						aux = o.toString();
				
				String defaultResult = (aux != null && !aux.isEmpty() ? aux : null);
				
				try {
					aux = (!Core.isNotNull(aux) ? (!m.getAnnotation(RParam.class).defaultValue().equals("") ? m.getAnnotation(RParam.class).defaultValue() : "0") : aux);
				}catch(Exception e) {
					aux = "0"; 
				}
				class GetValue{
					public String getValue(String typeName,String value) {
						switch(typeName){
							case "int":
							case "float":
							case "double":
							case "long":
							case "short":
								if(Core.isNotNull(value)) {
									try {
										Double.parseDouble(value.toString());
									}catch(NumberFormatException e) {
										return "0";
									}
								}
								return value.toString();
						}
						return value.toString();
					}
				}
				aux = new GetValue().getValue(typeName,aux);
				
				switch(typeName){
					case "int":
							m.setInt(this, Core.toInt(aux));
						break;
					case "float":
							m.setFloat(this, Core.toFloat(aux));
						break;
					case "double":
							m.setDouble(this,Core.toDouble(aux));
						break;
					case "long":
							m.setLong(this, Core.toLong(aux));
						break;
					case "short":
							m.setShort(this, Core.toShort(aux));
						break;
					case "java.sql.Date":
						if(Core.isNotNull(aux) && !aux.equals("0")) {
							m.set(this, DateHelper.formatDate(aux, "dd-mm-yyyy"));
						}
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
			Map<String, List<String>> mapFk = new LinkedHashMap<String, List<String>>();
			Map<String, List<String>> mapFkDesc = new LinkedHashMap<String, List<String>>();
			
			Class<?> c_ = obj.getDeclaredAnnotation(SeparatorList.class).name();
				
			List<String> aux = new ArrayList<String>();
			
			for(Field m : c_.getDeclaredFields()){
				 
					m.setAccessible(true);
					aux.add(m.getName());
					
					String s = c_.getName().substring(c_.getName().lastIndexOf("$") + 1).toLowerCase();
					
					if(m.getName().contains(s)) {
						
						String []values1 = (String[]) Core.getParamArray("p_" + m.getName());
						if(values1 != null && values1.length > 1 && values1[0] != null && values1[0].isEmpty()) {
							String aux_[] = new String[values1.length - 1];
							System.arraycopy(values1, 1, aux_, 0, aux_.length);
							values1 = aux_;
						}
						String []values2 = values1;
						
						mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<String>());
						mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : new ArrayList<String>());
						
					}else {
						
						String []values1 = (String[]) Core.getParamArray("p_" + m.getName() + "_fk");
						String []values2 = (String[]) Core.getParamArray("p_" + m.getName() + "_fk_desc");
						
						mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<String>());
						mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : new ArrayList<String>());
						
					}
					
					m.setAccessible(false); 
			 }
			 
			 ArrayList<Object> auxResults = new ArrayList<>();
			 
			 obj.setAccessible(true);
			 obj.set(this, auxResults);
			 obj.setAccessible(false);
			 
			 try {
					int row = 0;
					
					int MAX_ITERATION =  0;
					
					for(List<String> list : mapFk.values()) {
						if(MAX_ITERATION < list.size())
							MAX_ITERATION = list.size(); 
					}
					
					while(row < MAX_ITERATION) {
						
						Object obj2 = Class.forName(c_.getName()).newInstance();
						
						for(Field m : obj2.getClass().getDeclaredFields()){
							
							m.setAccessible(true);
							
								try {
									BeanUtils.setProperty(obj2, m.getName(),new IGRPSeparatorList.Pair(mapFk.get(m.getName()).get(row), mapFkDesc.get(m.getName()).get(row)));
								}catch (Exception e) {
									m.setAccessible(false);
									continue;
								}
							
							m.setAccessible(false);
							
						}
						
						auxResults.add(obj2);
						
						row++;
						
					}
				
			} catch (ClassNotFoundException | InstantiationException e) {
				e.printStackTrace();
			}
			 catch (IndexOutOfBoundsException e) {
				 continue; // go to next -- Separator list
			}
		}
		
	}	
	
	
	/*
	 * Load/auto-populate (end)
	 * */
	
	
//	private void createErrorsPool(){
//		this.errors = new HashMap<String, ArrayList<String>>();
//		Class<? extends Model> c = this.getClass();
//		for(Field m : c.getDeclaredFields())
//			if(m.getDeclaredAnnotations().length > 0) // For just fields that contains annotations
//				this.errors.put(m.getName(), new ArrayList<String>());
//	}
	/*
	public String getScenario() {
		return scenario;
	}

	public void setScenario(String scenario) {
		this.scenario = scenario;
	}

	public Map<String, ArrayList<String>> getErrors() {
		return errors;
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
