package nosi.core.webapp.helpers;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Core;
import nosi.core.webapp.Model;
import nosi.core.webapp.uploadfile.UploadFile;
import nosi.webapps.igrp.dao.TempFile;
/**
 * @author Marcel Iekiny
 * Apr 19, 2017
 */
public final class IgrpHelper {
	
	private IgrpHelper() {} // Not for instances ...
	
	public static Map<?, ?> toMap(List<?> values, String keyField, String valueField) {
		return IgrpHelper.toMap(values, keyField, valueField, null);
	}
	
	public static Map<Object, Object> toMap(List<?> values, String keyField, String valueField, String prompt) {
		Map<Object, Object> map = new LinkedHashMap<>(values.size());
		if(prompt != null)
			map.put(null, prompt);
		for(Object obj : values) {
			String key = IgrpHelper.getValue(obj, keyField);
			String value = IgrpHelper.getValue(obj, valueField);
			map.put(key, value);
		}
		return map;
	}

	// Help to convert String[] parameters to any Java primitive type
	public static Object convertToArray(String[]array, String primitiveType){
		return switch(primitiveType){
			case "int" -> {
				int[] result = new int[array.length];
				for (int i = 0; i < array.length; i++) {
					result[i] = Integer.parseInt(array[i]);
				}
				yield result;
			}
			case "float" -> {
				float[] result = new float[array.length];
				for (int i = 0; i < array.length; i++) {
					result[i] = Float.parseFloat(array[i]);
				}
				yield result;
			}
			case "double" -> {
				double[] result = new double[array.length];
				for (int i = 0; i < array.length; i++) {
					result[i] = Double.parseDouble(array[i]);
				}
				yield result;
			}
			case "short" -> {
				short[] result = new short[array.length];
				for (int i = 0; i < array.length; i++) {
					result[i] = Short.parseShort(array[i]);
				}
				yield result;
			}
			case "long" -> {
				long[] result = new long[array.length];
				for (int i = 0; i < array.length; i++) {
					result[i] = Long.parseLong(array[i]);
				}
				yield result;
			}
			default -> array;
        };
	}
	

	public static String getValue(Object model,String name){
		String value = null;
		if(model!=null && name!=null && !name.isEmpty()){
			String methodName = "get"+name.substring(0, 1).toUpperCase()+name.substring(1);
		    for (Method m : model.getClass().getDeclaredMethods()) {		    	
		    	if(m.getName().equals(methodName)){
			    	try {
						final Object invoke = m.invoke(model);
						if(invoke !=null) {
			    			if(m.getReturnType().getSimpleName().equalsIgnoreCase("IGRPLink")) {
			    				IGRPLink link = (IGRPLink) invoke;
								value = link.getLink();
			    			}else {
			    				if(m.getReturnType().getSimpleName().equals("UploadFile")) {
			    					UploadFile upload = (UploadFile) invoke;
			    					if(upload!=null) {
			    						value = upload.getSubmittedFileName();
			    					}else {
			    						TempFile tempFile = TempFileHelper.getTempFile(Model.getParamFileId(name));
			    						if(tempFile!=null)
			    							value = tempFile.getName();
			    					}
			    				}else {
				    				value = ""+ invoke;
				    				if(m.getReturnType().getName().equals("java.time.LocalDate")) {
				    					value = Core.convertDate(value, "yyyy-MM-dd", "dd-MM-yyyy");
				    				}
			    				}
			    			}
			    			break;
			    		}
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						e.printStackTrace();
					}                                                                     
		    	}
		    }
		}
		return value;
	}

	public static Object getValueArray(Object model, String name) {
		if (model != null && name != null && !name.isEmpty()) {
			String methodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
			for (Method m : model.getClass().getDeclaredMethods()) {
				if (m.getName().equals(methodName)) {
					try {
						Object aux = m.invoke(model);
						if (aux != null)
							return aux;
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return null;
	}


	/*
	 * Errors/validation purpose (begin)
	 * */
	public static void setField(Object obj, Field field, Object value) {
		if (field == null || value == null)
			return;

		try {

			final var typeName = field.getType().getName();

			if (field.getType().isArray()) {
				if (typeName.equalsIgnoreCase("java.lang.integer[]") || typeName.equalsIgnoreCase("int[]"))
					field.set(obj, (int[]) value);
				else if (typeName.equalsIgnoreCase("java.lang.long[]") || typeName.equalsIgnoreCase("long[]"))
					field.set(obj, (long[]) value);
				else if (typeName.equalsIgnoreCase("java.lang.short[]") || typeName.equalsIgnoreCase("short[]"))
					field.set(obj, (short[]) value);
				else if (typeName.equalsIgnoreCase("java.lang.float[]") || typeName.equalsIgnoreCase("float[]"))
					field.set(obj, (float[]) value);
				else if (typeName.equalsIgnoreCase("java.lang.double[]") || typeName.equalsIgnoreCase("double[]"))
					field.set(obj, (double[]) value);
				else if (typeName.equalsIgnoreCase("java.lang.boolean[]") || typeName.equalsIgnoreCase("boolean[]"))
					field.set(obj, (boolean[]) value);
				return;
			}

			final var stringValue = value.toString();

			if (typeName.equalsIgnoreCase("java.lang.integer") || typeName.equalsIgnoreCase("int"))
				field.set(obj, Core.toInt(stringValue));
			else if (typeName.equalsIgnoreCase("java.lang.long") || typeName.equalsIgnoreCase("long"))
				field.setLong(obj, Core.toLong(stringValue));
			else if (typeName.equalsIgnoreCase("java.lang.short") || typeName.equalsIgnoreCase("short"))
				field.setShort(obj, Core.toShort(stringValue));
			else if (typeName.equalsIgnoreCase("java.lang.float") || typeName.equalsIgnoreCase("float"))
				field.setFloat(obj, Core.toFloat(stringValue));
			else if (typeName.equalsIgnoreCase("java.lang.double") || typeName.equalsIgnoreCase("double"))
				field.setDouble(obj, Core.toDouble(stringValue));
			else if (typeName.equalsIgnoreCase("java.lang.boolean") || typeName.equalsIgnoreCase("boolean"))
				field.setBoolean(obj, (boolean) value);
			else if (typeName.equalsIgnoreCase("java.math.BigDecimal"))
				field.set(obj, Core.toBigDecimal(stringValue));
			else if (typeName.equalsIgnoreCase("java.math.BigInteger"))
				field.set(obj, Core.toBigInteger(stringValue));
			else if (typeName.equalsIgnoreCase("java.lang.String"))
				field.set(obj, stringValue);
			else if (typeName.equalsIgnoreCase("java.sql.Date"))
				field.set(obj, Core.ToDate(stringValue, "yyyy-MM-dd"));

		} catch (IllegalArgumentException | IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	public static String convertToJsonString(InputStream inputStream) throws IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		var data = objectMapper.readValue(inputStream, new TypeReference<>() {});
		return new Gson().toJson(data);
	}
}
