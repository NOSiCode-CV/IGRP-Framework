package nosi.core.webapp.helpers;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
	
	/*public static Map<Object, Object> toMap(List<Object> keys, List<Object> values, String prompt) {
		Map<Object, Object> map = new HashMap<>();
		if(prompt != null)
			map.put(null, prompt);
		for(int i = 0; i < keys.size(); i++) {
			map.put(keys.get(i) + "", values.get(i) + "");
			System.out.println(keys.get(i) + "");
		}
		return map;
	}
	
	public static Map<Object, Object> toMap(List<Object> keys, List<Object> values) {
		return toMap(keys, values, null);
	}
	*/
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
	

	public static String getValue(Object model,String name){
		String value = "";
		if(model!=null && name!=null && !name.isEmpty()){
			value = "";
			String methodName = name.substring(0, 1).toUpperCase()+name.substring(1);
		    for (Method m : model.getClass().getDeclaredMethods()) {		    	
		    	if(m.getName().startsWith("get") && m.getName().equals("get"+methodName)){
			    	try {
			    		if(m.invoke(model)!=null) {
			    			if(m.getReturnType().getSimpleName().equalsIgnoreCase("IGRPLink")) {
			    				IGRPLink link = (IGRPLink) m.invoke(model);
								value = link.getLink();
			    			}else {
			    				if(m.getReturnType().getSimpleName().equals("UploadFile")) {
			    					UploadFile upload = (UploadFile) m.invoke(model);
			    					if(upload!=null) {
			    						value = upload.getSubmittedFileName();
			    					}else {
			    						TempFile tempFile = TempFileHelper.getTempFile(Model.getParamFileId(name));
			    						if(tempFile!=null)
			    							value = tempFile.getName();
			    					}
			    				}else {
				    				value = ""+ m.invoke(model);
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
	
	public static Object getValueArray(Object model,String name){
		Object value = null;
		if(model!=null && name!=null && !name.isEmpty()){
			String methodName = name.substring(0, 1).toUpperCase()+name.substring(1);
			for (Method m : model.getClass().getDeclaredMethods()) {		    	
		    	if(m.getName().startsWith("get") && m.getName().equals("get"+methodName)){
			    	try {
			    		
			    		Object aux = m.invoke(model);
			    		
			    		if(aux != null) {
			    			
			    			value = aux;
			    			
			    			break;
			    		}
					} catch (Exception e) {
						e.printStackTrace();
					}                                                                     
		    	}
		    }
		}
		return value;
	}


	/*
	 * Errors/validation purpose (begin)
	 * */
	public static void setField(Object obj, java.lang.reflect.Field field, Object value) {
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
}
