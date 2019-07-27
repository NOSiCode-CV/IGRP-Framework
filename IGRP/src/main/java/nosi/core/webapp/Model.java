package nosi.core.webapp;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import javax.persistence.Tuple;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import org.apache.commons.beanutils.BeanUtils;
import org.w3c.dom.NodeList;
import com.google.gson.Gson;
import nosi.core.gui.components.IGRPChart2D;
import nosi.core.gui.components.IGRPChart3D;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
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
 * We have function like loadFromlist for separatorlist and formlist, loadTable
 * for table/list.
 * 
 * @author Marcel Iekiny Apr 15, 2017
 */
public abstract class Model { // IGRP super model

	public static final String ATTRIBUTE_NAME_REQUEST = "model";

	public Model() {
		
	}

	public void load(BaseQueryInterface query) throws IllegalArgumentException, IllegalAccessException {
		if (query != null) {
			List<Tuple> list = query.getResultList();
			if (Core.isNotNull(list))
				for (Tuple tuple : list) {
					for (Field field : this.getClass().getDeclaredFields()) {
						field.setAccessible(true);
						try {
							if (field.getAnnotation(RParam.class) != null)
								IgrpHelper.setField(this, field, tuple.get(field.getName()));
						} catch (java.lang.IllegalArgumentException e) {
						}
					}
				}
			else
				Core.setMessageError("QUERY result list null error. Please check connection");
		}
	}

	public void loadFromTask(String taskId) throws IllegalArgumentException, IllegalAccessException {
		HistoricTaskService hts = Core.getTaskHistory(taskId);
		if (hts != null && hts.getVariables() != null) {
			List<TaskVariables> var = hts.getVariables().stream().filter(
					v -> v.getName().equalsIgnoreCase(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI + "_" + hts.getId()))
					.collect(Collectors.toList());
			String json = (var != null && var.size() > 0) ? var.get(0).getValue().toString() : "";
			if (Core.isNotNull(json)) {
				CustomVariableIGRP custom = new Gson().fromJson(json, CustomVariableIGRP.class);
				if (custom.getRows() != null) {
					String overrided = Core.getParam("overrided");
					custom.getRows().stream().forEach(v -> {
						if (!v.getName().equalsIgnoreCase(BPMNConstants.PRM_RUNTIME_TASK)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PROCESS_DEFINITION)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_TASK_DEFINITION)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_APP_ID)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_APP)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_TASK)
								&& !v.getName().equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_PROCESSDEFINITION)) {
							if (overrided.equalsIgnoreCase("false")) {
								if (Core.isNull(Core.getParam(v.getName(), false))) {
									Core.setAttribute(v.getName(), v.getValue());
								}
							} else {
								Core.setAttribute(v.getName(), v.getValue());
							}
						}
					});
				}
			}
			this.load();
		}
	}

	@SuppressWarnings("static-method")
	public <T> List<T> loadTable(BaseQueryInterface query, Class<T> className) {
		if (query != null) {
			List<Tuple> tuples = query.getResultList();
			if (tuples != null && !tuples.isEmpty()) {
				List<T> list = new ArrayList<>();
				for (Tuple tuple : tuples) {
					T t;
					try {
						t = className.newInstance();
						Field[] fields = null;
						if (t instanceof IGRPChart3D || t instanceof IGRPChart2D) {
							fields = className.getSuperclass().getDeclaredFields();
						} else {
							fields = className.getDeclaredFields();
						}
						if (fields != null) {
							for (Field field : fields) {
								try {
									Object value = tuple.get(field.getName());
									if (value != null) {
										BeanUtils.setProperty(t, field.getName(), value.toString());
									}
								} catch (java.lang.IllegalArgumentException | IllegalAccessException
										| InvocationTargetException e) {

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

	@SuppressWarnings("static-method")
	public <T> List<T> loadFormList(BaseQueryInterface query, Class<T> className) {
		if (query != null) {
			List<Tuple> queryResult = query.getResultList();
			if (queryResult != null) {
				List<T> list = new ArrayList<>();
				for (Tuple tuple : queryResult) {
					T t;
					try {
						t = className.newInstance();
						for (Field field : className.getDeclaredFields()) {
							try {
								Object value = tuple.get(field.getName());
								if (value != null)
									BeanUtils.setProperty(t, field.getName(),
											new Pair(value.toString(), value.toString()));
							} catch (java.lang.IllegalArgumentException | IllegalAccessException
									| InvocationTargetException e) {

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
	 */
	// this mehtod allow auto-inicialization for all sub-models
	public void load() throws IllegalArgumentException, IllegalAccessException {
		this.loadModelFromFile();
		Class<? extends Model> c = this.getClass();
		List<Field> fields = new ArrayList<Field>(); // For particular case purpose ...
		for (Field m : c.getDeclaredFields()) {
			m.setAccessible(true);
			String typeName = m.getType().getName();
			if (m.getType().isArray()) {
				String[] aux = null;
				aux = (String[]) Core.getParamArray(
						m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().equals("")
								? m.getAnnotation(RParam.class).rParamName()
								: m.getName() // default case use the name of field
				);
				this.loadArrayData(m,typeName,aux);
			} else {
				String name = m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().equals("")
						? m.getAnnotation(RParam.class).rParamName()
						: m.getName();

				Object o = Core.getParam(name); // default case use the name of field
				String aux = null;
				if (o != null)
					if (o.getClass().isArray()) {
						String[] s = (String[]) o;
						aux = s[s.length - 1];
					} else
						aux = o.toString();
				try {
					aux = (!Core.isNotNull(aux) ? (!m.getAnnotation(RParam.class).defaultValue().equals("")
							? m.getAnnotation(RParam.class).defaultValue()
							: null) : aux);
				} catch (Exception e) {

				}
				this.loadData(m,typeName,aux);
			}
			/* Begin */
			if (m.isAnnotationPresent(SeparatorList.class)) {
				fields.add(m);
			}
			/* End */
		}
		Map<String, List<Part>> allFiles = this.getFiles();
		for (Field obj : fields) {
			Map<String, List<String>> mapFk = new LinkedHashMap<String, List<String>>();
			Map<String, List<String>> mapFkDesc = new LinkedHashMap<String, List<String>>();

			Class<?> c_ = obj.getDeclaredAnnotation(SeparatorList.class).name();

			List<String> aux = new ArrayList<String>();

			for (Field m : c_.getDeclaredFields()) {

				m.setAccessible(true);
				aux.add(m.getName());

				String s = c_.getName().substring(c_.getName().lastIndexOf("$") + 1).toLowerCase();

				if (m.getName().equals(s + "_id")) {
					String[] values1 = Core.getParamArray("p_" + m.getName());
					if (values1 != null && values1.length > 1 && values1[0] != null && values1[0].isEmpty()) {
						String aux_[] = new String[values1.length - 1];
						System.arraycopy(values1, 1, aux_, 0, aux_.length);
						values1 = aux_;
					}
					String[] values2 = values1;

					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<String>());
					mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : new ArrayList<String>());

				} else {
					String param = "p_" + m.getName() + "_fk";
					String[] values1 = Core.getParamArray(param);
					if((values1!=null && values1.length==0) || values1==null) {
						if(allFiles!=null && allFiles.containsKey(param)) {
							values1 = allFiles.get(param).stream().map(f->f.getName()).toArray(String[]::new);
						}
					}
					String[] values2 = Core.getParamArray(param+ "_desc");
					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<String>());
					// If the field is checkbox, we don't have _check_desc with value2=null so
					// causing indexOutOfBounds here
					List<String> list1 = values1 != null ? Arrays.asList(new String[values1.length])
							: new ArrayList<String>();
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

				int MAX_ITERATION = 0;

				for (List<String> list : mapFk.values()) {
					if (MAX_ITERATION < list.size())
						MAX_ITERATION = list.size();
				}
				while (row < MAX_ITERATION) {
					Object obj2 = Class.forName(c_.getName()).newInstance();
					for (Field m : obj2.getClass().getDeclaredFields()) {
						m.setAccessible(true);
						String param = "p_"+m.getName().toLowerCase()+"_fk";
						String key ="";
						 String value="";

						if (allFiles!=null && allFiles.containsKey(param)) {
							List<Part> filesByLine = allFiles.get(param);
							if(!filesByLine.isEmpty()) {
								 try {		
									 BeanUtils.setProperty(obj2, m.getName(), new IGRPSeparatorList.Pair(key,value,filesByLine.get(row)));
								 }catch (Exception e) {
									 e.printStackTrace();
									 m.setAccessible(false);
									 continue;
								 }
							}
						} else {
							try {
								 key = mapFk.get(m.getName()).size()>=row?mapFk.get(m.getName()).get(row):"";
								 value = mapFkDesc.get(m.getName()).size() >= row?mapFkDesc.get(m.getName()).get(row):"";
								BeanUtils.setProperty(obj2, m.getName(), new IGRPSeparatorList.Pair(key,value));
							} catch (Exception e) {
								m.setAccessible(false);
								continue;
							}
						}
						m.setAccessible(false);
					}
					auxResults.add(obj2);
					row++;
				}
			} catch (ClassNotFoundException | InstantiationException e) {
				e.printStackTrace();
			} catch (IndexOutOfBoundsException e) {
				continue; // go to next -- Separator list
			}
		}
		this.loadModelFromAttribute();
	}

	private void loadData(Field m, String typeName,String value) throws IllegalArgumentException, IllegalAccessException {
		String aux = value;
		String defaultResult = (aux != null && !aux.isEmpty() ? aux : null);
		switch (typeName) {
			case "int":
				m.setInt(this, Core.toInt(aux).intValue());
				break;
			case "java.lang.Integer":
				m.set(this, Core.toInt(aux));
				break;
			case "float":
				m.setFloat(this, Core.toFloat(aux).floatValue());
				break;
			case "java.lang.Float":
				m.set(this, Core.toFloat(aux));
				break;
			case "double":
				m.setDouble(this, Core.toDouble(aux).doubleValue());
				break;
			case "java.lang.Double":
				m.set(this, Core.toDouble(aux));
				break;
			case "long":
				m.setLong(this, Core.toLong(aux).longValue());
				break;
			case "java.lang.Long":
				m.set(this, Core.toLong(aux));
				break;
			case "short":
				m.setShort(this, Core.toShort(aux).shortValue());
				break;
			case "java.lang.Short":
				m.set(this, Core.toShort(aux));
				break;
			case "java.math.BigInteger":
				m.set(this, Core.toBigInteger(aux));
				break;
			case "java.math.BigDecimal":
				m.set(this, Core.toBigDecimal(aux));
				break;
			case "java.sql.Date":
				if (aux != null && !aux.equals("0")) {
					aux = DateHelper.convertDate(aux, "dd-mm-yyyy", "yyyy-mm-dd");
					m.set(this, java.sql.Date.valueOf(aux));
				}
				break;
			case "java.time.LocalDate":
				if (aux != null && !aux.equals("0")) {
					String[] datePart = aux.split("-");
					if(datePart!=null && datePart.length > 2) {
						int day = Core.toInt(datePart[0]).intValue();
						int month = Core.toInt(datePart[1]).intValue();
						int year = Core.toInt(datePart[2]).intValue();
						LocalDate date = LocalDate.of(year, month, day);
						m.set(this, date);
					}
				}
				break;
			case "java.time.LocalTime":
				if (aux != null && !aux.equals("0")) {
					String[] timePart = aux.split(":");
					if(timePart!=null && timePart.length > 1) {
						int hour = Core.toInt(timePart[0]).intValue();
						int minute = Core.toInt(timePart[1]).intValue();
						int second = 0;
						if (timePart.length > 2) {
							second = Core.toInt(timePart[2]).intValue();
						}
						LocalTime time = LocalTime.of(hour, minute, second);
						m.set(this, time);
					}
				}
				break;
			case "javax.servlet.http.Part":
				try {
					m.set(this, Core.getFile(m.getAnnotation(RParam.class).rParamName()));
				} catch (IOException | ServletException e) {
	
				}
				break;
			default:
				if ((m.isAnnotationPresent(NotEmpty.class) || m.isAnnotationPresent(NotNull.class)) && m.isAnnotationPresent(RParam.class)) {
					if (defaultResult == null) {
						defaultResult = m.getAnnotation(RParam.class).defaultValue();
					}
					m.set(this, typeName.equals("java.lang.String") ? (Core.isNotNull(defaultResult) ? defaultResult : null)
							: null);
				} else {
					m.set(this,
							typeName.equals("java.lang.String")
									? (defaultResult == null ? m.getAnnotation(RParam.class).defaultValue() : defaultResult)
									: null); // The field could be a Object
				}
		}
	}

	private void loadArrayData(Field m, String typeName,String[] value) throws IllegalArgumentException, IllegalAccessException {
		String[] aux = value;
		if (aux != null) {
			// Awesome !!! We need make casts for all [] primitive type ... pff
			switch (typeName) {
				case "[I": // Array of int
					// m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
					m.set(this, (int[]) IgrpHelper.convertToArray(aux, "int"));
					break;
				case "[J":// Array de long
					// m.set(this, Arrays.stream(aux).mapToLong(Long::parseLong).toArray());
					m.set(this, (long[]) IgrpHelper.convertToArray(aux, "long"));
					break;
				case "[D":
					// m.set(this, Arrays.stream(aux).mapToDouble(Double::parseDouble).toArray());
					m.set(this, (double[]) IgrpHelper.convertToArray(aux, "double"));
					break;
				case "[S":// Array de short
					m.set(this, (short[]) IgrpHelper.convertToArray(aux, "short"));
					break;
				case "[F":
					// m.set(this, Arrays.stream(aux).mapToDouble(Float::parseFloat).toArray());
					m.set(this, (float[]) IgrpHelper.convertToArray(aux, "float"));
					break;
				default:
					m.set(this, typeName.equals("[Ljava.lang.String;") ? aux : null); // The field could be a Object
			}
		} else {
			if (typeName.equals("[Ljavax.servlet.http.Part;")) {
				List<Part> files;
				try {
					files = Core.getFiles();
					if (files != null) {
						Part[] filesArray = files.stream()
								.filter(f -> f.getName().equals(m.getAnnotation(RParam.class).rParamName()))
								.toArray(Part[]::new);
						if (filesArray != null) {
							m.set(this, (Part[]) filesArray);
						}
					}
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
			} else {
				m.set(this, aux);
			}
		}
	}

	@SuppressWarnings("static-method")
	private void loadModelFromFile() {
		try {
			Part file = Igrp.getInstance().getRequest().getPart("p_igrpfile");
			if (file != null) {
				String xml = FileHelper.convertToString(file);
				DomXML domXml = new DomXML(xml);
				NodeList n = domXml.getDocument().getElementsByTagName("row").item(0).getChildNodes();
				QueryString<String, Object> queryString = new QueryString<>();
				for (int i = 0; i < n.getLength(); i++) {
					queryString.addQueryString(n.item(i).getNodeName(), n.item(i).getTextContent());
				}
				queryString.getQueryString().entrySet().forEach(qs -> {
					Core.setAttribute(qs.getKey(), qs.getValue().toArray());
				});
			}
		} catch (ServletException | IOException e) {

		}
	}

	/**
	 * When using this.forward("app","page","index",model, this.queryString());
	 */
	private void loadModelFromAttribute() {
		Model model = (Model)Igrp.getInstance().getRequest().getSession().getAttribute(ATTRIBUTE_NAME_REQUEST);
		if (model != null) {
			Igrp.getInstance().getRequest().getSession().removeAttribute(ATTRIBUTE_NAME_REQUEST);
			for (Method m : model.getClass().getDeclaredMethods()) {
				m.setAccessible(true);
				for (Field f : this.getClass().getDeclaredFields()) {
					if (m.getName().startsWith("get") && m.getName().toLowerCase().endsWith(f.getName())) {
						f.setAccessible(true);
						String typeName = f.getType().getName();
						try {
							if(f.getType().isArray()) {
								this.loadArrayData(f, typeName, (String[])m.invoke(model));
							}else {
								this.loadData(f, typeName, ""+m.invoke(model));
							}
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
	
	private Map<String,List<Part>> getFiles(){
		Map<String,List<Part>> list = new HashMap<>();
		Collection<Part> allFiles = null;			
		try {
			allFiles = Igrp.getInstance().getRequest().getParts();
			if(allFiles!=null) {
				for(Part f:allFiles){
					if(Core.isNotNull(f.getContentType())) {
						list.put(f.getName().toLowerCase(), allFiles.stream().filter(file->file.getName().equals(f.getName())).collect(Collectors.toList()));
					}
				}
			}
		} catch (ServletException | IOException e1) {
		}
		return list;
	}

	@SuppressWarnings("resource")
	public boolean validate() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();		
		Set<ConstraintViolation<Model>> constraintViolations = validator.validate(this);
		constraintViolations.stream().forEach(e->{
			Core.setMessageError(Core.gt(e.getMessage()));
		});
		return constraintViolations.size()==0;
	}

}
