package nosi.core.webapp;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.ValidatorFactory;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import nosi.core.gui.components.IGRPChart2D;
import nosi.core.gui.components.IGRPChart3D;
import nosi.core.gui.components.IGRPSeparatorList;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.activit.rest.entities.CustomVariableIGRP;
import nosi.core.webapp.activit.rest.entities.HistoricTaskService;
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

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.*;
import java.util.function.Supplier;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.Optional.ofNullable;

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

		if (Objects.isNull(query))
			return;

		final var tuples = query.getResultList();
		if (tuples == null || tuples.isEmpty()) {
			Core.setMessageError("QUERY result list null error. Please check connection");
			return;
		}

		final var declaredFields = this.getClass().getDeclaredFields();
		for (var tuple : tuples) {
			for (var field : declaredFields) {
				try {
					if (field.isAnnotationPresent(RParam.class)) {
						field.setAccessible(true);
						IgrpHelper.setField(this, field, tuple.get(field.getName()));
					}
				} catch (java.lang.IllegalArgumentException e) {
					e.printStackTrace();
				} finally {
					field.setAccessible(false);
				}
			}
		}
	}

	public void loadFromTask(String taskDefinitionKey) throws IllegalArgumentException, IllegalAccessException {
		final HistoricTaskService hts = Core.getTaskHistory(taskDefinitionKey);
		if (hts == null)
			return;

		final Object taskVariable = Core.getTaskVariable(BPMNConstants.CUSTOM_VARIABLE_IGRP_ACTIVITI + "_" + hts.getId());
		if(Core.isNull(taskVariable)){
			this.load();
			return;
		}

		final String json = taskVariable.toString();
		if (Core.isNotNull(json)) {
			final var customVariableIGRP = new Gson().fromJson(json, CustomVariableIGRP.class);
			if (customVariableIGRP.getRows() != null) {
				final var override = Core.getParam("overrided");
				final var isOverrideFalse = override.equalsIgnoreCase("false");
				customVariableIGRP.getRows().stream()
						.filter(v -> !isNotValidName(v.getName()))
						.forEach(v -> {
							if (isOverrideFalse) {
								if (Core.isNull(Core.getParam(v.getName(), false)))
									Core.setAttribute(v.getName(), v.getValue());
							} else {
								Core.setAttribute(v.getName(), v.getValue());
							}
						});
			}
		}

		this.load();
	}

	private boolean isNotValidName(String name) {
		return name.equalsIgnoreCase(BPMNConstants.PRM_RUNTIME_TASK)
			   || name.equalsIgnoreCase(BPMNConstants.PRM_PROCESS_DEFINITION)
			   || name.equalsIgnoreCase(BPMNConstants.PRM_TASK_DEFINITION)
			   || name.equalsIgnoreCase(BPMNConstants.PRM_APP_ID)
			   || name.equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_APP)
			   || name.equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_TASK)
			   || name.equalsIgnoreCase(BPMNConstants.PRM_PREVIEW_PROCESSDEFINITION);
	}

	public <T> List<T> loadTable(BaseQueryInterface query, Class<T> clazz) {

		final var tuples = ofNullable(query).map(BaseQueryInterface::getResultList).orElse(List.of());
		if (tuples.isEmpty())
			return null;

		final var list = new ArrayList<T>();

		final var constructor = getClassConstructor(clazz);
		if (constructor == null)
			return list;

		for (var tuple : tuples) {
			try {

				final T newInstance = constructor.newInstance();
				final Field[] fields;
				if (newInstance instanceof IGRPChart3D || newInstance instanceof IGRPChart2D)
					fields = clazz.getSuperclass().getDeclaredFields();
				else
					fields = clazz.getDeclaredFields();

				for (var field : fields) {
					try {
						final var value = tuple.get(field.getName());
						if (value != null)
							BeanUtils.setProperty(newInstance, field.getName(), value.toString());

					} catch (java.lang.IllegalArgumentException | IllegalAccessException |
							 InvocationTargetException ignored) {
					}
				}
				list.add(newInstance);
			} catch (SecurityException | InvocationTargetException | IllegalArgumentException | InstantiationException |
					 IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	private <T> Constructor<T> getClassConstructor(Class<T> clazz) {
		try {
			return clazz.getDeclaredConstructor();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		return null;
	}

	public <T> List<T> loadFormList(BaseQueryInterface query, Class<T> clazz) {

		final var tuples = ofNullable(query).map(BaseQueryInterface::getResultList).orElse(List.of());
		if (tuples.isEmpty())
			return null;

		final var list = new ArrayList<T>();

		final var constructor = getClassConstructor(clazz);
		if (constructor == null)
			return list;

		final var declaredFields = clazz.getDeclaredFields();

		for (var tuple : tuples) {
			try {
				final T newInstance = constructor.newInstance();
				for (var field : declaredFields) {
					final var tupleValue = tuple.get(field.getName());
					if (tupleValue != null) {
						final var value = tupleValue.toString();
						BeanUtils.setProperty(newInstance, field.getName(), new Pair(value, value));
					}
				}
				list.add(newInstance);
			} catch (SecurityException | InvocationTargetException | IllegalArgumentException | InstantiationException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	private String getFieldParamName(Field field) {
		return ofNullable(field.getAnnotation(RParam.class))
				.map(obj -> field.getAnnotation(RParam.class).rParamName())
				.filter(rParamName -> !rParamName.isEmpty())
				.orElse(field.getName()); // default case use the name of field;
	}

	/*
	 * Load/auto-populate (begin)
	 */
	// this mehtod allow auto-inicialization for all sub-models
	public void load() throws IllegalArgumentException, IllegalAccessException {
		this.loadModelFromFile();
		Class<? extends Model> c = this.getClass();
		List<Field> fields = new ArrayList<>(); // For particular case purpose ...
		for (Field field : c.getDeclaredFields()) {
			field.setAccessible(true);
			final var rParamFieldName = this.getFieldParamName(field);
			if (field.getType().isArray()) {
				String[] aux = Core.getParamArray(rParamFieldName);
				this.loadArrayData(field,aux);
			} else {
				final Object o = Core.getParamObject(rParamFieldName);
				String aux = null;
				if (o != null) {
					if (o.getClass().isArray()) {
						String[] s = (String[]) o;
						aux = s[s.length - 1];
					} else
						aux = o.toString();
				}
				if(Core.isNull(aux) && field.getAnnotation(RParam.class)!=null && Core.isNotNull(field.getAnnotation(RParam.class).defaultValue())) {
					aux = field.getAnnotation(RParam.class).defaultValue();
				}
				this.loadData(field,aux);
			}
			/* Begin */
			if (field.isAnnotationPresent(SeparatorList.class)) {
				fields.add(field);
			}
			/* End */
		}

		Map<String, List<Part>> allFiles = this.getFiles();

		for (Field obj : fields) {
			Map<String, List<String>> mapFk = new LinkedHashMap<>();
			Map<String, List<String>> mapFkDesc = new LinkedHashMap<>();
			Map<String, List<String>> mapFileId = new LinkedHashMap<>();

			Class<?> c_ = obj.getDeclaredAnnotation(SeparatorList.class).name();

			for (Field m : c_.getDeclaredFields()) {

				m.setAccessible(true);

				String s = c_.getName().substring(c_.getName().lastIndexOf("$") + 1).toLowerCase();
				String[] fileId = Core.getAttributeArray(Model.getParamFileId(m.getName()));
			
				if(fileId==null) {
					fileId = Core.getParamArray(Model.getParamFileId(m.getName()));
				}
				mapFileId.put(m.getName(),  fileId != null ? Arrays.asList(fileId) : new ArrayList<>(0));
				if (m.getName().equals(s + "_id")) {
					String[] values1 = Core.getParamArray("p_" + m.getName());
					if (values1 != null && values1.length > 1 && values1[0] != null && values1[0].isEmpty()) {
						String[] auxS = new String[values1.length - 1];
						System.arraycopy(values1, 1, auxS, 0, auxS.length);
						values1 = auxS;
					}
					String[] values2 = values1;
					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<>());
					mapFkDesc.put(m.getName(), values2 != null ? Arrays.asList(values2) : new ArrayList<>(0));
				} else {
					String param = "p_" + m.getName() + "_fk";
					String[] values1 = Core.getParamArray(param);
					if((values1 == null || values1.length == 0) && allFiles.containsKey(param))
						values1 = allFiles.get(param).stream().map(Part::getName).toArray(String[]::new); 
					String[] values2 = Core.getParamArray(param+ "_desc");
					mapFk.put(m.getName(), values1 != null ? Arrays.asList(values1) : new ArrayList<>(0));
					// If the field is checkbox, we don't have _check_desc with value2=null so
					// causing indexOutOfBounds here
					List<String> list1 = values1 != null ? Arrays.asList(new String[values1.length]) : new ArrayList<>(0);
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

				final int MAX_ITERATION = mapFk.values()
						.stream()
						.mapToInt(List::size)
						.max()
						.orElse(0);

				while (row < MAX_ITERATION) {
					Object obj2 = Class.forName(c_.getName()).getDeclaredConstructor().newInstance();
					for (Field m : obj2.getClass().getDeclaredFields()) {
						m.setAccessible(true);
						String param = "p_" + m.getName().toLowerCase() + "_fk";
						final var mapFKKey = mapFk.get(m.getName());
						String key = mapFKKey.size() > row ? mapFKKey.get(row) : "";
						final var mapFkDescValue = mapFkDesc.get(m.getName());
						String value = mapFkDescValue.size() > row ? mapFkDescValue.get(row): "";
						List<String> fileId = mapFileId.get(m.getName());
						if (allFiles.containsKey(param)) {
							List<Part> filesByLine = allFiles.get(param);
							if (!filesByLine.isEmpty()) {
								try {
									String id = "-1";
									if(("p_"+m.getName().toLowerCase()+"_fk").equalsIgnoreCase(key)) {
										id = fileId != null && fileId.size() > row ? fileId.get(row) : id;
									} else {
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

	private void loadData(Field field, String value) throws IllegalArgumentException, IllegalAccessException {
		String aux = value;
		String defaultResult = aux != null && !aux.isEmpty() ? aux : null;
		final var typeName = field.getType().getName();
		switch (typeName) {
			case "int" -> field.setInt(this, Core.toInt(aux));
			case "java.lang.Integer" -> field.set(this, Core.isNotNull(aux) ? Core.toInt(aux) : null);
			case "float" -> field.setFloat(this, Core.toFloat(aux));
			case "java.lang.Float" -> field.set(this, Core.isNotNull(aux) ? Core.toFloat(aux) : null);
			case "double" -> field.setDouble(this, Core.toDouble(aux));
			case "java.lang.Double" -> field.set(this, Core.isNotNull(aux) ? Core.toDouble(aux) : null);
			case "long" -> field.setLong(this, Core.toLong(aux));
			case "java.lang.Long" -> field.set(this, Core.isNotNull(aux) ? Core.toLong(aux) : null);
			case "short" -> field.setShort(this, Core.toShort(aux));
			case "java.lang.Short" -> field.set(this, Core.isNotNull(aux) ? Core.toShort(aux) : null);
			case "java.math.BigInteger" -> field.set(this, Core.isNotNull(aux) ? Core.toBigInteger(aux) : null);
			case "java.math.BigDecimal" -> field.set(this, Core.isNotNull(aux) ? Core.toBigDecimal(aux) : null);
			case "java.sql.Date" -> {
				if (aux != null && !aux.equals("0")) {
					aux = DateHelper.convertDate(aux, "dd-mm-yyyy", "yyyy-mm-dd");
					field.set(this, java.sql.Date.valueOf(aux));
				}
			}
			case "java.time.LocalDate" -> {
				if (aux != null && !aux.equals("0")) {
					String[] datePart = aux.split("-");
					if (datePart.length > 2) {
						int day = Core.toInt(datePart[0]);
						int month = Core.toInt(datePart[1]);
						int year = Core.toInt(datePart[2]);
						LocalDate date = LocalDate.of(year, month, day);
						field.set(this, date);
					}
				}
			}
			case "java.time.LocalTime" -> {
				if (aux != null && !aux.equals("0")) {
					String[] timePart = aux.split(":");
					if (timePart.length > 1) {
						int hour = Core.toInt(timePart[0]);
						int minute = Core.toInt(timePart[1]);
						int second = timePart.length > 2 ? Core.toInt(timePart[2]) : 0;
						LocalTime time = LocalTime.of(hour, minute, second);
						field.set(this, time);
					}
				}
			}
			case "jakarta.servlet.http.Part" -> {
				try {
					field.set(this, Core.getFile(field.getAnnotation(RParam.class).rParamName()));
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
			}
			case "nosi.core.webapp.uploadfile.UploadFile" -> {
				try {
					String param = Model.getParamFileId(field.getName().toLowerCase());
					String fileId = Core.getParam(param);
					if (Core.isNotNull(fileId)) {
						Core.addHiddenField((Model.getParamFileId(field.getName().toLowerCase())).replaceFirst("p_", ""), fileId);
						field.set(this, new UploadFile(fileId));
					} else {
						field.set(this, new UploadFile(Core.getFile(field.getAnnotation(RParam.class).rParamName())));
					}
				} catch (IOException | ServletException e) {
					e.printStackTrace();
				}
			}
			default -> {
				if ((field.isAnnotationPresent(NotEmpty.class) || field.isAnnotationPresent(NotNull.class)) && field.isAnnotationPresent(RParam.class)) {
					if (defaultResult == null) {
						defaultResult = field.getAnnotation(RParam.class).defaultValue();
					}
					field.set(this, typeName.equals("java.lang.String") ? (Core.isNotNull(defaultResult) ? defaultResult : null) : null);
				} else {
					field.set(this,typeName.equals("java.lang.String") ? (defaultResult == null ? field.getAnnotation(RParam.class).defaultValue() : defaultResult) : null);
				}
			}
		}
	}

	private void loadArrayData(Field field, String[] value) throws IllegalArgumentException, IllegalAccessException {
		final var typeName = field.getType().getName();
		if (value != null) {
			switch (typeName) {
				case "[I" -> field.set(this, IgrpHelper.convertToArray(value, "int"));
				case "[Ljava.lang.Integer;" -> {
					final var integerArray = Arrays.stream(value).map(Integer::valueOf).toArray(Integer[]::new);
					field.set(this, integerArray);
				}
				case "[J" -> field.set(this, IgrpHelper.convertToArray(value, "long"));
				case "[Ljava.lang.Long;" -> {
					final var longArray = Arrays.stream(value).map(Long::valueOf).toArray(Long[]::new);
					field.set(this, longArray);
				}
				case "[D" -> field.set(this, IgrpHelper.convertToArray(value, "double"));
				case "[S" -> field.set(this, IgrpHelper.convertToArray(value, "short"));
				case "[F" -> field.set(this, IgrpHelper.convertToArray(value, "float"));
				default -> field.set(this, typeName.equals("[Ljava.lang.String;") ? value : null);
			}
		} else {
			if (!typeName.equals("[Ljakarta.servlet.http.Part;")) {
				field.set(this, null);
				return;
			}
			try {
				List<Part> files = Core.getFiles();
				if (files != null) {
					final var filesArray = files.stream()
							.filter(f -> f.getName().equals(field.getAnnotation(RParam.class).rParamName()))
							.toArray(Part[]::new);
					field.set(this, filesArray);
				}
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
		}
	}

	private void loadModelFromFile() {
		if(Core.isUploadedFiles()) {
			try {
				Part file = Igrp.getInstance().getRequest().getPart("p_igrpfile");
				if (file != null && file.getSize()>0) {
					String xml = new FileHelper().convertToString(file);
					DomXML domXml = new DomXML(xml);
					NodeList n = domXml.getDocument().getElementsByTagName("row").item(0).getChildNodes();
					QueryString<String, Object> queryString = new QueryString<>();
					for (int i = 0; i < n.getLength(); i++) {
						final var item = n.item(i);
						queryString.addQueryString(item.getNodeName(), item.getTextContent());
					}
					queryString.getQueryString().forEach((key, value) -> Core.setAttribute(key, value.toArray()));
				}
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * When using this.forward("app","page","index",model, this.queryString());
	 */
	private void loadModelFromAttribute() {

		Model model = (Model) Igrp.getInstance().getRequest().getSession().getAttribute(ATTRIBUTE_NAME_REQUEST);
		if (model != null) {

			Igrp.getInstance().getRequest().getSession().removeAttribute(ATTRIBUTE_NAME_REQUEST);

			final var fields = this.getClass().getDeclaredFields();
			final var methods = Arrays.stream(model.getClass().getDeclaredMethods())
					.filter(m -> m.getName().startsWith("get"))
					.toList();

			for (var method : methods) {

				final var lowerCaseMethodName = method.getName().toLowerCase();

				for (var field : fields) {
					if (lowerCaseMethodName.endsWith(field.getName())) {
						field.setAccessible(true);
						method.setAccessible(true);
						try {
							final var invokedResult = method.invoke(model);
							if (field.getType().isArray()) {
								this.loadArrayData(field, (String[]) invokedResult);
							} else {
								this.loadData(field, "" + invokedResult);
							}
						} catch (IllegalArgumentException | IllegalAccessException | InvocationTargetException e) {
							e.printStackTrace();
						} finally {
							field.setAccessible(false);
							method.setAccessible(false);
						}
					}
				}
			}
		}
	}


	private Map<String, List<Part>> getFiles() {

		if (!Core.isUploadedFiles())
			return Map.of();

		try {
			final var allFiles = Igrp.getInstance().getRequest().getParts();
			if (allFiles == null)
				return Map.of();

			final Supplier<Stream<Part>> partStream = allFiles::stream;

			final var files = new HashMap<String, List<Part>>();
			allFiles.stream()
					.filter(file -> Core.isNotNull(file.getContentType()))
					.forEach(f -> {
						final var collect = partStream.get().filter(file -> file.getName().equals(f.getName())).toList();
						files.put(f.getName().toLowerCase(), collect);
					});

			return files;
		} catch (ServletException | IOException e1) {
			e1.printStackTrace();
		}

		return Map.of();
	}

	/**
	 * Validates all constraints on this Model Instance and prints the error validations on screen.
	 *
	 * @return Returns <tt>true</tt> if this model has no constraint violations, otherwise returns <tt>false</tt>.
	 */
	public boolean validate() {
		final List<String> constraintViolations = getConstraintViolations(List.of(), true);
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
				UploadFile file = (UploadFile) m.get(this);
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
		QueryString<String, String> queryString = new QueryString<>();
		m.setAccessible(true);
		try {
			List<?> list = (List<?>) m.get(this);
			if(list!=null) {
				for(Object obj:list) {
					Class<?> className = obj.getClass();
					for(Method method:className.getDeclaredMethods()) {
						if(method.getReturnType().getName().equals(PAIR_TYPE)) {
							method.setAccessible(true);
							try {
								Pair pair = (Pair) method.invoke(obj);
								if(pair.getFile()!=null) {
									String paramFileName = Model.getParamFileId(method.getName().replace("get", "").toLowerCase());
									if(pair.isUploaded()) {
										String uuid = TempFileHelper.saveTempFile(pair.getFile());
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
			queryString.getQueryString().forEach((k, v) -> Core.setAttribute(k, v.toArray(String[]::new)));
		}
	}

	public void deleteTempFile() {

		Class<? extends Model> clazz = this.getClass();

		Arrays.stream(clazz.getDeclaredFields())
				.filter(field -> field.isAnnotationPresent(SeparatorList.class) || field.getType().getName().equals(FILE_TYPE))
				.forEach(field -> {
					if (field.isAnnotationPresent(SeparatorList.class))
						this.deleteTempFileSeparatorFormlist(field);
					else
						this.deleteTempFileForm(field);
				});
	}

	private void deleteTempFileForm(Field m) {
		try {
			m.setAccessible(true);
			UploadFile file = (UploadFile) m.get(this);
			if (file != null)
				TempFileHelper.deleteTempFile(file.getId());
		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		} finally {
			m.setAccessible(false);
		}
	}

	
	private void deleteTempFileSeparatorFormlist(Field m) {
		m.setAccessible(true);
		try {
			List<?> list = (List<?>) m.get(this);
			if(list!=null) {
				for(Object obj:list) {
					Class<?> className = obj.getClass();
					for(Method method:className.getDeclaredMethods()) {
						if(method.getReturnType().getName().equals(PAIR_TYPE)) {
							method.setAccessible(true);
							try {
								Pair pair = (Pair) method.invoke(obj);
								if(pair.getFile()!=null && Core.isNotNull(pair.getFile().getId())) {
									TempFileHelper.deleteTempFile(pair.getFile().getId());
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
	}
	
	public static String getParamFileId(String paramName) {
		if(Core.isNotNull(paramName) && paramName.startsWith("p_")) {
			return paramName+"_"+SUFIX_UPLOADED_FILE_ID;
		}
		return "p_"+paramName+"_"+SUFIX_UPLOADED_FILE_ID;
	}
}
