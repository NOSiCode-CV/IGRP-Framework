package nosi.core.webapp.helpers;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import nosi.core.gui.components.IGRPLink;
import nosi.core.gui.fields.Field;
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
		Map<Object, Object> map = new LinkedHashMap<>();
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
	public static Object convertToArray(String []array, String primitiveType){
		switch(primitiveType){
			case "int":{ 
				int []result = new int[array.length];
				for(int i = 0; i < array.length; i++)
					result[i] = Integer.parseInt(array[i]);
				return result;
			}
			case "float": {
				float []result = new float[array.length];
				for(int i = 0; i < array.length; i++)
					result[i] = Float.parseFloat(array[i]);
				return result;
			}
			case "double": {
				double []result = new double[array.length];
				for(int i = 0; i < array.length; i++)
					result[i] = Double.parseDouble(array[i]);
				return result;
			}
			case "short": {
				short []result = new short[array.length];
				for(int i = 0; i < array.length; i++)
					result[i] = Short.parseShort(array[i]);
				return result;
			}
			case "long":{
				long []result = new long[array.length];
				for(int i = 0; i < array.length; i++)
					result[i] = Long.parseLong(array[i]);
				return result;
			}
			case "boolean": break;
			default:
        }
		return array; // default purpose ...
	}


	public static String getValue(Object object, String name) {
		String value=null;
		if (object != null && name != null && !name.isEmpty()) {
			try {
				final String methodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
				final Method method = object.getClass().getMethod(methodName);
				//Without this code value="", when exists the method, upload and IGRPLink will not render
				value = "";
				final Object invoke = method.invoke(object);
				if (Objects.nonNull(invoke)) {
					if (method.getReturnType().getSimpleName().equalsIgnoreCase("IGRPLink")) {
						IGRPLink link = (IGRPLink) invoke;
						return link.getLink();
					} else {
						if (method.getReturnType().getSimpleName().equals("UploadFile")) {
							UploadFile upload = (UploadFile) invoke;
							return upload.getSubmittedFileName();
						}
						value = "" + invoke;
						if (method.getReturnType().getName().equals("java.time.LocalDate"))
							return Core.convertDate(value, "yyyy-MM-dd", "dd-MM-yyyy");
						return value;
					}
				}
			} catch (NoSuchMethodException e) {
				return null;
			} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				e.printStackTrace();
			}
		}
		return value;
	}

	public static Object getValueArray(Object object, String name) {
		if (object != null && name != null && !name.isEmpty()) {
			final String methodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
			try {
				final Method method = object.getClass().getMethod(methodName);
				final Object result = method.invoke(object);
				if (Objects.nonNull(result))
					return result;
			} catch (NoSuchMethodException e) {
				return null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}



	/*
	 * Errors/validation purpose (begin)
	 * */
	public static void setField(Object obj,java.lang.reflect.Field field,Object value) {
		if(field !=null && value!=null) {
			try {
				if(field.getType().isArray()) {
					if (field.getType().getName().equalsIgnoreCase("java.lang.integer[]") || field.getType().getName().equalsIgnoreCase("int[]"))
						field.set(obj,(int[])value);
					else if	(field.getType().getName().equalsIgnoreCase("java.lang.long[]") || field.getType().getName().equalsIgnoreCase("long[]"))
						field.set(obj,(long[])value);
					else if	(field.getType().getName().equalsIgnoreCase("java.lang.short[]") || field.getType().getName().equalsIgnoreCase("short[]"))
						field.set(obj,(short[])value);
					else if(field.getType().getName().equalsIgnoreCase("java.lang.float[]") || field.getType().getName().equalsIgnoreCase("float[]"))
						field.set(obj,(float[])value);
					else if(field.getType().getName().equalsIgnoreCase("java.lang.double[]") || field.getType().getName().equalsIgnoreCase("double[]"))
						field.set(obj,(double[])value);
					else if	(field.getType().getName().equalsIgnoreCase("java.lang.boolean[]") || field.getType().getName().equalsIgnoreCase("boolean[]"))
						field.set(obj,(boolean[])value);
				}else {
					if (field.getType().getName().equalsIgnoreCase("java.lang.integer"))
						field.set(obj,Core.toInt(value.toString()));
					if (field.getType().getName().equalsIgnoreCase("int"))
						field.setInt(obj,Core.toInt(value.toString()));
					else if	(field.getType().getName().equalsIgnoreCase("java.lang.long"))
						field.set(obj,Core.toLong(value.toString()));
					else if (field.getType().getName().equalsIgnoreCase("long"))
						field.setLong(obj,Core.toLong(value.toString()));
					else if	(field.getType().getName().equalsIgnoreCase("java.lang.short"))
						field.set(obj,Core.toShort(value.toString()));
					else if(field.getType().getName().equalsIgnoreCase("short"))
						field.setShort(obj,Core.toShort(value.toString()));
					else if(field.getType().getName().equalsIgnoreCase("java.lang.float"))
						field.set(obj,Core.toFloat(value.toString()));
					else if(field.getType().getName().equalsIgnoreCase("float"))
						field.setFloat(obj,Core.toFloat(value.toString()));
					else if(field.getType().getName().equalsIgnoreCase("java.lang.double"))
						field.set(obj,Core.toDouble(value.toString()));
					else if(field.getType().getName().equalsIgnoreCase("double"))
						field.setDouble(obj,Core.toDouble(value.toString()));
					else if	(field.getType().getName().equalsIgnoreCase("java.lang.boolean"))
						field.setBoolean(obj,(boolean)value);
					else if(field.getType().getName().equalsIgnoreCase("boolean"))
						field.setBoolean(obj,(boolean)value);
					else if(field.getType().getName().equalsIgnoreCase("java.math.BigDecimal"))
						field.set(obj,Core.toBigDecimal(value.toString())); 
					else if(field.getType().getName().equalsIgnoreCase("java.math.BigInteger"))
						field.set(obj,Core.toBigInteger(value.toString())); 
					else if(field.getType().getName().equalsIgnoreCase("java.lang.String")) 
						field.set(obj,value.toString());						
					else if(field.getType().getName().equalsIgnoreCase("java.sql.Date"))
						field.set(obj,Core.ToDate(value.toString(), "yyyy-MM-dd"));
				}
			}catch (IllegalArgumentException | IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static String getLabel(Field field) {
       return "";
	}
}
