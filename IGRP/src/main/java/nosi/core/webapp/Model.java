package nosi.core.webapp;

import nosi.core.gui.components.IGRPSeparatorList.Pair;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.Tuple;
import javax.servlet.ServletException;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;
import org.w3c.dom.NodeList;

import com.google.gson.Gson;
import nosi.core.gui.components.IGRPChart2D;
import nosi.core.gui.components.IGRPChart3D;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.webapp.activit.rest.entities.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.entities.HistoricTaskService;
import nosi.core.webapp.activit.rest.entities.TaskVariables;
import nosi.core.webapp.bpmn.BPMNConstants;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.xml.DomXML;
/**
 * We have function like loadFromlist for separatorlist and formlist, loadTable for table/list.
 * 
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Model { // IGRP super model
	
	public static final String ATTRIBUTE_NAME_REQUEST = "model";
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
			List<TaskVariables> var = hts.getVariables().stream().filter(v->v.getName().equalsIgnoreCase(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI+"_"+hts.getId())).collect(Collectors.toList());
			String json = (var!=null && var.size() >0)?var.get(0).getValue().toString():"";
			if(Core.isNotNull(json)) {
				CustomVariableIGRP custom = new Gson().fromJson(json, CustomVariableIGRP.class);
				if(custom.getRows()!=null){
					String overrided = Core.getParam("overrided");
					custom.getRows().stream().forEach(v->{
						if(!v.getName().equalsIgnoreCase(BPMNConstants.PRM_RUNTIME_TASK) 
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PROCESS_DEFINITION) 
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_TASK_DEFINITION)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_APP_ID)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_APP)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_TASK)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_PROCESSDEFINITION)
						  ) {
							if(overrided.equalsIgnoreCase("false")) {
								if(Core.isNull(Core.getParam(v.getName(),false))) {
									Core.setAttribute(v.getName(), v.getValue());
								}
							}else {
								Core.setAttribute(v.getName(), v.getValue());
							}
						}
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
						Field[] fields = null;
						if(t instanceof IGRPChart3D || t instanceof IGRPChart2D) {
							fields = className.getSuperclass().getDeclaredFields();
						}else {
							fields = className.getDeclaredFields();
						}
						if(fields!=null) {
							for(Field field:fields ) {
								try {
									Object value = tuple.get(field.getName());
									if(value!=null) {
										BeanUtils.setProperty(t, field.getName(),value.toString());
									}
								}catch(java.lang.IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
									
								}
							}
							list.add(t);
						}
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
		this.loadModelFromFile();
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
				switch(typeName){
					case "int":
						m.setInt(this, Core.toInt(aux));
						break;
					case "java.lang.Integer":
						m.set(this, Core.toInt(aux));
						break;
					case "float":
						m.setFloat(this, Core.toFloat(aux));
						break;
					case "java.lang.Float":
						m.set(this, Core.toFloat(aux));
						break;
					case "double":
						m.setDouble(this,Core.toDouble(aux));
						break;
					case "java.lang.Double":
						m.set(this,Core.toDouble(aux));
						break;
					case "long":
						m.setLong(this, Core.toLong(aux));
						break;
					case "java.lang.Long":
						m.set(this, Core.toLong(aux));
						break;
					case "short":
						m.setShort(this, Core.toShort(aux));
						break;
					case "java.lang.Short":
						m.set(this, Core.toShort(aux));
						break;
					case "java.math.BigInteger":
						m.set(this,Core.toBigInteger(aux));
						break;
					case "java.math.BigDecimal":
						m.set(this,Core.toBigDecimal(aux));
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
					
					if(m.getName().equals(s + "_id")) {
						
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
//						If the field is checkbox, we don't have _check_desc with value2=null so causing indexOutOfBounds here
						List<String> list1 = values1 != null? Arrays.asList(new String[values1.length]):new ArrayList<String>();
						mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : list1);
						
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
		this.loadModelFromAttribute();
	}

	private void loadModelFromFile() {
		try {
			Part file = Igrp.getInstance().getRequest().getPart("p_igrpfile");
			if(file!=null) {
				String xml = FileHelper.convertToString(file);
				DomXML domXml = new DomXML(xml);
				NodeList n =domXml.getDocument().getElementsByTagName("row").item(0).getChildNodes();
				QueryString<String,Object> queryString = new QueryString<>();
				for(int i=0;i<n.getLength();i++) {
					queryString.addQueryString(n.item(i).getNodeName(), n.item(i).getTextContent());
				}
				if(queryString!=null) {
					queryString.getQueryString().entrySet().forEach(qs->{
						Core.setAttribute(qs.getKey(),qs.getValue().toArray());
					});
				}
			}
		} catch (ServletException | IOException e) {
			
		}
	}

	/**
	 * When using this.forward("app","page","index",model, this.queryString());
	 */
	private void loadModelFromAttribute() {
		if(Core.getAttributeObject(ATTRIBUTE_NAME_REQUEST, false)!=null) {
			Model model = (Model) Core.getAttributeObject(ATTRIBUTE_NAME_REQUEST, true);
			for(Method m :model.getClass().getDeclaredMethods()){
				m.setAccessible(true);
				for(Field f:this.getClass().getDeclaredFields()) {
					if(m.getName().startsWith("get") && m.getName().toLowerCase().endsWith(f.getName())) {
						f.setAccessible(true);
						try {
							f.set(this, m.invoke(model));
						} catch (IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
							e.printStackTrace();
						}
						f.setAccessible(false);
					}
				}
				m.setAccessible(false);
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
