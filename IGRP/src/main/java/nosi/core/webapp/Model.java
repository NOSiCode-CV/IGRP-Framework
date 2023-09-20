package nosi.core.webapp;

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
import nosi.core.webapp.helpers.TempFileHelper;
import nosi.core.webapp.uploadfile.UploadFile;
import nosi.core.xml.DomXML;
import org.apache.commons.beanutils.BeanUtils;
import org.w3c.dom.NodeList;

import javax.persistence.Tuple;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * We have function like loadFromlist for separatorlist and formlist, loadTable
 * for table/list.
 * 
 * @author Marcel Iekiny Apr 15, 2017
 */
public abstract class Model { // IGRP super model

	public static final String ATTRIBUTE_NAME_REQUEST = "model";
	private static final String PAIR_TYPE = "nosi.core.gui.components.IGRPSeparatorList$Pair";
	private static final String FILE_TYPE = "nosi.core.webapp.uploadfile.UploadFile";
	public static final String SUFIX_UPLOADED_FILE_ID = "file_uploaded_id";

	public void load(BaseQueryInterface query) throws IllegalArgumentException, IllegalAccessException {

		if (query == null)
			return;

		final List<Tuple> list = query.getResultList();
		if (list == null) {
			Core.setMessageError("QUERY result list null error. Please check connection");
			return;
		}

		for (Tuple tuple : list) {
			for (Field field : this.getClass().getDeclaredFields()) {
				field.setAccessible(true);
				try {
					if (field.getAnnotation(RParam.class) != null)
						IgrpHelper.setField(this, field, tuple.get(field.getName()));
				} catch (java.lang.IllegalArgumentException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void loadFromTask(String taskId) throws IllegalArgumentException, IllegalAccessException {

		final HistoricTaskService hts = Core.getTaskHistory(taskId);
		if (hts == null || hts.getVariables() == null)
			return;

		final List<TaskVariables> taskVariables = hts.getVariables()
				.stream()
				.filter(v -> v.getName().equalsIgnoreCase(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI + "_" + hts.getId()))
				.collect(Collectors.toList());
		if(taskVariables.isEmpty()){
			this.load();
			return;
		}

		final String json = taskVariables.get(0).getValue().toString();
		if (Core.isNotNull(json)) {
			final CustomVariableIGRP custom = new Gson().fromJson(json, CustomVariableIGRP.class);
			if (custom.getRows() != null) {
				final String overrided = Core.getParam("overrided");
				custom.getRows().forEach(v -> {
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

	public <T> List<T> loadTable(BaseQueryInterface query, Class<T> className) {
		if (query != null) {
			List<Tuple> tuples = query.getResultList();
			if (tuples != null && !tuples.isEmpty()) {
				List<T> list = new ArrayList<>();
				for (Tuple tuple : tuples) {
					T t;
					try {
						t = className.getDeclaredConstructor().newInstance();
						final Field[] fields;
						if (t instanceof IGRPChart3D || t instanceof IGRPChart2D) {
							fields = className.getSuperclass().getDeclaredFields();
						} else {
							fields = className.getDeclaredFields();
						}
						for (Field field : fields) {
							try {
								Object value = tuple.get(field.getName());
								if (value != null) {
									BeanUtils.setProperty(t, field.getName(), value.toString());
								}
							} catch (java.lang.IllegalArgumentException | IllegalAccessException
									 | InvocationTargetException ignored) {
							}
						}
						list.add(t);
					} catch (SecurityException | NoSuchMethodException | InvocationTargetException
							 | IllegalArgumentException | InstantiationException | IllegalAccessException e1) {
						e1.printStackTrace();
					}
				}
				return list;
			}
		}
		return null;
	}

	public <T> List<T> loadFormList(BaseQueryInterface query, Class<T> className)  {
		if (query != null) {
			final List<Tuple> queryResult = query.getResultList();
			if (queryResult != null) {
				final List<T> list = new ArrayList<>();
				for (Tuple tuple : queryResult) {
					try {
						final T t = className.getDeclaredConstructor().newInstance();
						for (Field field : className.getDeclaredFields()) {
							final Object value = tuple.get(field.getName());
							if (value != null)
								BeanUtils.setProperty(t, field.getName(), new Pair(value.toString(), value.toString()));
						}
						list.add(t);
					} catch (SecurityException | NoSuchMethodException | InvocationTargetException
							| IllegalArgumentException | InstantiationException | IllegalAccessException e1) {
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
		final Class<? extends Model> c = this.getClass();
		final List<Field> fields = new ArrayList<>(); // For particular case purpose ...
		for (Field m : c.getDeclaredFields()) {
			m.setAccessible(true);
			String typeName = m.getType().getName();
			if (m.getType().isArray()) {
				String[] aux;
				aux = Core.getParamArray(
						m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().isEmpty()
								? m.getAnnotation(RParam.class).rParamName()
								: m.getName() // default case use the name of field
				);
				this.loadArrayData(m,typeName,aux);
			} else {
				final String name = m.getAnnotation(RParam.class) != null && !m.getAnnotation(RParam.class).rParamName().isEmpty()
						? m.getAnnotation(RParam.class).rParamName()
						: m.getName();

				final Object o = Core.getParam(name); // default case use the name of field
				String aux = null;
				if (o != null) {
					if (o.getClass().isArray()) {
						String[] s = (String[]) o;
						aux = s[s.length - 1];
					} else
						aux = o.toString();
				}
				if(Core.isNull(aux) && m.getAnnotation(RParam.class)!=null && Core.isNotNull(m.getAnnotation(RParam.class).defaultValue())) {
					aux = m.getAnnotation(RParam.class).defaultValue();
				}
				this.loadData(m,typeName,aux);
			}
			/* Begin */
			if (m.isAnnotationPresent(SeparatorList.class)) {
				fields.add(m);
			}
			/* End */
		}

		final Map<String, List<Part>> allFiles = this.getFiles();

		for (Field obj : fields) {

			final Map<String, List<String>> mapFk = new LinkedHashMap<>();
			final Map<String, List<String>> mapFkDesc = new LinkedHashMap<>();
			final Map<String, List<String>> mapFileId = new LinkedHashMap<>();

			final Class<?> clazz = obj.getDeclaredAnnotation(SeparatorList.class).name();

			for (Field m : clazz.getDeclaredFields()) {

				m.setAccessible(true);

				final String s = clazz.getName().substring(clazz.getName().lastIndexOf("$") + 1).toLowerCase();

				String[] fileId = Core.getAttributeArray(Model.getParamFileId(m.getName()));
				if (fileId == null) {
					fileId = Core.getParamArray(Model.getParamFileId(m.getName()));
				}
				mapFileId.put(m.getName(),  fileId != null ? Arrays.asList(fileId) : new ArrayList<>());
				if (m.getName().equals(s + "_id")) {
					String[] values1 = Core.getParamArray("p_" + m.getName());
					if (values1 != null && values1.length > 1 && values1[0] != null && values1[0].isEmpty()) {
						final String[] auxS = new String[values1.length - 1];
						System.arraycopy(values1, 1, auxS, 0, auxS.length);
						values1 = auxS;
					}
					final String[] values2 = values1;
					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<>());
					mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : new ArrayList<>());
				} else {
					final String param = "p_" + m.getName() + "_fk";
					String[] values1 = Core.getParamArray(param);
					if((values1 == null || values1.length == 0) && (allFiles != null && allFiles.containsKey(param)))
						values1 = allFiles.get(param).stream().map(Part::getName).toArray(String[]::new); 
					final String[] values2 = Core.getParamArray(param+ "_desc");
					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<>());
					// If the field is checkbox, we don't have _check_desc with value2=null so
					// causing indexOutOfBounds here
					final List<String> list1 = values1 != null ? Arrays.asList(new String[values1.length])
							: new ArrayList<>();
					mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : list1);
				}
				m.setAccessible(false);
			}

			final ArrayList<Object> auxResults = new ArrayList<>();

			obj.setAccessible(true);
			obj.set(this, auxResults);
			obj.setAccessible(false);

			try {
				int row = 0;

				final int MAX_ITERATION = mapFk.values()
						.stream()
						.mapToInt(List::size)
						.max()
						.orElse(0);

				while (row < MAX_ITERATION) {
					final Object obj2 = Class.forName(clazz.getName()).getDeclaredConstructor().newInstance();
					for (Field m : obj2.getClass().getDeclaredFields()) {
						m.setAccessible(true);
						final String param = "p_" + m.getName().toLowerCase() + "_fk";
						final String key = mapFk.get(m.getName()).size() > row ? mapFk.get(m.getName()).get(row) : "";
						final String value = mapFkDesc.get(m.getName()).size() > row ? mapFkDesc.get(m.getName()).get(row): "";
						final List<String> fileId = mapFileId.get(m.getName());
						if (allFiles != null && allFiles.containsKey(param)) {
							final List<Part> filesByLine = allFiles.get(param);
							if (!filesByLine.isEmpty()) {
								try {
									String id = "-1";
									if(("p_"+m.getName().toLowerCase()+"_fk").equalsIgnoreCase(key)) {
										id = fileId != null && fileId.size() > row ? fileId.get(row) : id;
									}else {
										id = fileId != null && fileId.size() > row ? fileId.get(row) : key;
									}
									BeanUtils.setProperty(obj2, m.getName(),new IGRPSeparatorList.Pair(id, key,value, filesByLine.get(row)));
								} catch (Exception e) {
									e.printStackTrace();
									m.setAccessible(false);
									continue;
								}
							}
						} else {
							try {
								if(fileId!=null && fileId.size() > row && Core.isNotNull(fileId.get(row))) 
									BeanUtils.setProperty(obj2, m.getName(),new IGRPSeparatorList.Pair(fileId.get(row), key,value));
								else  
									BeanUtils.setProperty(obj2, m.getName(), new IGRPSeparatorList.Pair(key,key, value));
							} catch (Exception e) {
								e.printStackTrace();
								m.setAccessible(false);
								continue;
							}
						}
						m.setAccessible(false);
					}
					auxResults.add(obj2);
					row++;
				}
			} catch (ClassNotFoundException | SecurityException | NoSuchMethodException | InvocationTargetException
					| IllegalArgumentException | InstantiationException | IllegalAccessException e) { 
				e.printStackTrace();
			} catch (IndexOutOfBoundsException ignored) {
               // go to next -- Separator list
            }
		}
		this.loadModelFromAttribute();
	}

	private void loadData(Field m, String typeName,String value) throws IllegalArgumentException, IllegalAccessException {
		String aux = value;
		String defaultResult = (aux != null && !aux.isEmpty() ? aux : null);
		switch (typeName) {
			case "int":
				m.setInt(this, Core.toInt(aux));
				break;
			case "java.lang.Integer":
				m.set(this, Core.isNotNull(aux)?Core.toInt(aux):null);
				break;
			case "float":
				m.setFloat(this, Core.toFloat(aux));
				break;
			case "java.lang.Float":
				m.set(this, Core.isNotNull(aux)?Core.toFloat(aux):null);
				break;
			case "double":
				m.setDouble(this, Core.toDouble(aux));
				break;
			case "java.lang.Double":
				m.set(this, Core.isNotNull(aux)?Core.toDouble(aux):null);
				break;
			case "long":
				m.setLong(this, Core.toLong(aux));
				break;
			case "java.lang.Long":
				m.set(this,Core.isNotNull(aux)?Core.toLong(aux):null);
				break;
			case "short":
				m.setShort(this, Core.toShort(aux));
				break;
			case "java.lang.Short":
				m.set(this, Core.isNotNull(aux)?Core.toShort(aux):null);
				break;
			case "java.math.BigInteger":
				m.set(this, Core.isNotNull(aux)?Core.toBigInteger(aux):null);
				break;
			case "java.math.BigDecimal":
				m.set(this, Core.isNotNull(aux)?Core.toBigDecimal(aux):null);
				break;
			case "java.sql.Date":
				if (aux != null && !aux.equals("0")) {
					aux = DateHelper.convertDate(aux, "dd-mm-yyyy", "yyyy-mm-dd");
					m.set(this, java.sql.Date.valueOf(aux));
				}
				break;
			case "java.time.LocalDate":
				if (aux != null && !aux.equals("0")) {
					final String[] datePart = aux.split("-");
					if(datePart.length > 2) {
						final int day = Core.toInt(datePart[0]);
						final int month = Core.toInt(datePart[1]);
						final int year = Core.toInt(datePart[2]);
						final LocalDate date = LocalDate.of(year, month, day);
						m.set(this, date);
					}
				}
				break;
			case "java.time.LocalTime":
				if (aux != null && !aux.equals("0")) {
					final String[] timePart = aux.split(":");
					if(timePart.length > 1) {
						final int hour = Core.toInt(timePart[0]);
						final int minute = Core.toInt(timePart[1]);
						final int second = timePart.length > 2 ? Core.toInt(timePart[2]) : 0;
						final LocalTime time = LocalTime.of(hour, minute, second);
						m.set(this, time);
					}
				}
				break;
			case "javax.servlet.http.Part":
				try {
					m.set(this, Core.getFile(m.getAnnotation(RParam.class).rParamName()));
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
				break;
			case "nosi.core.webapp.uploadfile.UploadFile":
				try {
					final String param = Model.getParamFileId(m.getName().toLowerCase());
					final String fileId = Core.getParam(param);
					if(Core.isNotNull(fileId)) {
						Core.addHiddenField((Model.getParamFileId(m.getName().toLowerCase())).replaceFirst("p_", ""), fileId);
						m.set(this, new UploadFile(fileId));
					}else {
						m.set(this, new UploadFile(Core.getFile(m.getAnnotation(RParam.class).rParamName())));
					}
				} catch (IOException | ServletException e) {
					e.printStackTrace();
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
       if (value != null) {
			// Awesome !!! We need make casts for all [] primitive type ... pff
			switch (typeName) {
				case "[I": // Array of int
					// m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
					m.set(this, IgrpHelper.convertToArray(value, "int"));
					break;
				case "[J":// Array de long
					// m.set(this, Arrays.stream(aux).mapToLong(Long::parseLong).toArray());
					m.set(this, IgrpHelper.convertToArray(value, "long"));
					break;
				case "[D":
					// m.set(this, Arrays.stream(aux).mapToDouble(Double::parseDouble).toArray());
					m.set(this, IgrpHelper.convertToArray(value, "double"));
					break;
				case "[S":// Array de short
					m.set(this, IgrpHelper.convertToArray(value, "short"));
					break;
				case "[F":
					// m.set(this, Arrays.stream(aux).mapToDouble(Float::parseFloat).toArray());
					m.set(this, IgrpHelper.convertToArray(value, "float"));
					break;
				default:
					m.set(this, typeName.equals("[Ljava.lang.String;") ? value : null); // The field could be a Object
			}
		} else {
			if (typeName.equals("[Ljavax.servlet.http.Part;")) {
				try {
					final List<Part> files = Core.getFiles();
					if (files != null) {
						final Part[] filesArray = files.stream()
								.filter(f -> f.getName().equals(m.getAnnotation(RParam.class).rParamName()))
								.toArray(Part[]::new);
						m.set(this, filesArray);
					}
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
			} else {
				m.set(this, value);
			}
		}
	}

	private void loadModelFromFile() {
		try {
			final Part file = Igrp.getInstance().getRequest().getPart("p_igrpfile");
			if (file != null && file.getSize() > 0) {
				final String xml = FileHelper.convertToString(file);
				final DomXML domXml = new DomXML(xml);
				final NodeList n = domXml.getDocument().getElementsByTagName("row").item(0).getChildNodes();
				final QueryString<String, Object> queryString = new QueryString<>();
				for (int i = 0; i < n.getLength(); i++) {
					queryString.addQueryString(n.item(i).getNodeName(), n.item(i).getTextContent());
				}
				queryString.getQueryString().forEach((key, value) -> Core.setAttribute(key, value.toArray()));
			}
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * When using this.forward("app","page","index",model, this.queryString());
	 */
	private void loadModelFromAttribute() {

		final Model model = (Model) Igrp.getInstance().getRequest().getSession().getAttribute(ATTRIBUTE_NAME_REQUEST);
		if (model == null)
			return;

		Igrp.getInstance().getRequest().getSession().removeAttribute(ATTRIBUTE_NAME_REQUEST);

		for (Method m : model.getClass().getDeclaredMethods()) {
			m.setAccessible(true);
			for (Field f : this.getClass().getDeclaredFields()) {
				if (m.getName().startsWith("get") && m.getName().toLowerCase().endsWith(f.getName())) {
					f.setAccessible(true);
					final String typeName = f.getType().getName();
					try {
						if (f.getType().isArray()) {
							this.loadArrayData(f, typeName, (String[]) m.invoke(model));
						} else {
							this.loadData(f, typeName, "" + m.invoke(model));
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

	private Map<String, List<Part>> getFiles() {
		try {
			final Collection<Part> allFiles = Igrp.getInstance().getRequest().getParts();
			if (allFiles != null) {
				return allFiles.stream()
						.filter(file -> Core.isNotNull(file.getContentType()))
						.collect(Collectors.groupingBy(file -> file.getName().toLowerCase()));
			}
		} catch (ServletException | IOException e1) {
			e1.printStackTrace();
		}
		return new HashMap<>();
	}

	/**
	 * Validates all constraints on this Model Instance and prints the error validations on screen.
	 *
	 * @return Returns <tt>true</tt> if this model has no constraint violations, otherwise returns <tt>false</tt>.
	 */
	public boolean validate() {
		final List<String> constraintViolations = getConstraintViolations(new ArrayList<>(), true);
		constraintViolations.forEach(Core::setMessageError);
		return constraintViolations.isEmpty();
	}

	/**
	 * Validates all constraints on this Model Instance and colects it into a list.
	 * This method is intended to be used in cases where the validation depends on any business rule.
	 * If the {@code fieldsToSkip} is {@code null} or {@code empty}, then is assumed that all validations are to be executed.
	 *
	 * @param fieldsToSkip fields that should be skipped from validation
	 * @return Returns <a list of constraint violated, otherwise returns an empty list if none
	 */
	public List<String> getConstraintViolations(List<nosi.core.gui.fields.Field> fieldsToSkip) {
		return getConstraintViolations(fieldsToSkip, true);
	}

	/**
	 * Validates all constraints on this Model Instance and colects it into a list.
	 * This method is intended to be used in cases where the validation depends on any business rule.
	 * If the {@code fieldsToSkip} is {@code null} or {@code empty}, then is assumed that all validations are to be executed.
	 *
	 * @param fieldsToSkip fields that should be skipped from validation
	 * @param  appendFieldTagToMessage if the tag should be appended to the message
	 * @return Returns <a list of constraint violated, otherwise returns an empty list if none
	 */

	public List<String> getConstraintViolations(List<nosi.core.gui.fields.Field> fieldsToSkip, boolean appendFieldTagToMessage) {
		return processConstraintViolations(fieldsToSkip).stream()
				.map(cvm -> Core.gt(cvm.getMessage()) + (appendFieldTagToMessage ? " [" + cvm.getPropertyPath().toString() + "]" : ""))
				.collect(Collectors.toList());
	}

	private Set<ConstraintViolation<Model>> processConstraintViolations(List<nosi.core.gui.fields.Field> fieldsToSkip) {
		try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {

			final Set<ConstraintViolation<Model>> allConstraintViolations = factory.getValidator().validate(this);

			if (null == fieldsToSkip || fieldsToSkip.isEmpty())
				return allConstraintViolations;

			final Set<String> tags = fieldsToSkip.stream()
					.map(nosi.core.gui.fields.Field::getName)
					.collect(Collectors.toSet());

			return allConstraintViolations.stream()
					.filter(cv -> {
						final String propertyPath = cv.getPropertyPath().toString();
						final int index = propertyPath.indexOf(".");
						// Check if field is from a component
						final String propertyPathProcessed = index == -1 ? propertyPath : propertyPath.substring(index + 1);
						return !tags.contains(propertyPathProcessed);
					})
					.collect(Collectors.toSet());
		}
	}

	public void saveTempFile() {
		if(Core.isUploadedFiles()) {
			Class<? extends Model> c = this.getClass();
			for (Field m : c.getDeclaredFields()) {
				if (m.isAnnotationPresent(SeparatorList.class)) {
					this.saveTempFileSeparatorFormlist(m);
				}else {
					this.saveTempFileForm(m);
				}
			}
		}
	}

	private void saveTempFileForm(Field m) {
		try {
			m.setAccessible(true);
			if (m.getType().getName().equals(FILE_TYPE)) {
				final UploadFile file = (UploadFile) m.get(this);
				if (file != null && file.isUploaded()) {
					String uuid = TempFileHelper.saveTempFile(file);
					Core.setAttribute(Model.getParamFileId(m.getName().toLowerCase()), uuid);
				}
			}
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		} finally {
			m.setAccessible(false);
		}
	}

	private void saveTempFileSeparatorFormlist(Field m) {
		final QueryString<String, String> queryString = new QueryString<>();
		m.setAccessible(true);
		try {
			final List<?> list = (List<?>) m.get(this);
			if(list!=null) {
				for(Object obj:list) {
					final Class<?> className = obj.getClass();
					for(Method method:className.getDeclaredMethods()) {
						if(method.getReturnType().getName().equals(PAIR_TYPE)) {
							method.setAccessible(true);
							try {
								final Pair pair = (Pair) method.invoke(obj);
								final String paramFileName = Model.getParamFileId(method.getName().replace("get", "").toLowerCase());
								if(pair.getFile()!=null) {
									if(pair.isUploaded()) {
										final String uuid = TempFileHelper.saveTempFile(pair.getFile());
										queryString.addQueryString(paramFileName, uuid);
									}else {
										if(Core.isNotNull(pair.getFile().getId()) && !pair.getFile().getId().equals("-1")) {
											queryString.addQueryString(paramFileName, pair.getFile().getId());
										}else {
											queryString.addQueryString(paramFileName, "-1");
										}
									}
								}
							} catch (IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
								e.printStackTrace();
							}finally {
								method.setAccessible(false);
							}							
						}
					}
				}
			}
		} catch (IllegalArgumentException | IllegalAccessException | SecurityException e) {
			e.printStackTrace();
		}finally {
			m.setAccessible(false);
		}
		if(queryString.getQueryString()!=null) {
			queryString.getQueryString().forEach((key, value) -> {
               final String[] val = value.toArray(new String[0]);
               Core.setAttribute(key, val);
            });
		}
	}
	
	public void deleteTempFile() {
		final Class<? extends Model> c = this.getClass();
		for (Field m : c.getDeclaredFields()) {
			if (m.isAnnotationPresent(SeparatorList.class)) {
				this.deleteTempFileSeparatorFormlist(m);
			}else {
				this.deleteTempFileForm(m);
			}
		}
	}


	private void deleteTempFileSeparatorFormlist(Field m) {
		m.setAccessible(true);
		try {
			final List<?> list = (List<?>) m.get(this);
			if (list == null)
				return;

			for (Object obj : list) {
				final Class<?> className = obj.getClass();
				for (Method method : className.getDeclaredMethods()) {
					if (method.getReturnType().getName().equals(PAIR_TYPE)) {
						method.setAccessible(true);
						this.deleteTemFileFromSeparatorFormList(obj, method);
					}
				}
			}
		} catch (IllegalArgumentException | IllegalAccessException | SecurityException e) {
			e.printStackTrace();
		} finally {
			m.setAccessible(false);
		}
	}

	private void deleteTemFileFromSeparatorFormList(Object obj, Method method) {
		try {
			final Pair pair = (Pair) method.invoke(obj);
			if (pair.getFile() != null && Core.isNotNull(pair.getFile().getId())) {
				TempFileHelper.deleteTempFile(pair.getFile().getId());
			}
		} catch (IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		} finally {
			method.setAccessible(false);
		}
	}

	private void deleteTempFileForm(Field m) {
		try {
			m.setAccessible(true);

			if (m.getType().getName().equals(FILE_TYPE)) {
				final UploadFile file = (UploadFile) m.get(this);
				if (file != null) {
					TempFileHelper.deleteTempFile(file.getId());
				}
			}
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		} finally {
			m.setAccessible(false);
		}
	}
	
	public static String getParamFileId(String paramName) {
		if(Core.isNotNull(paramName) && paramName.startsWith("p_")) {
			return paramName+"_"+SUFIX_UPLOADED_FILE_ID;
		}
		return "p_"+paramName+"_"+SUFIX_UPLOADED_FILE_ID;
	}
}
