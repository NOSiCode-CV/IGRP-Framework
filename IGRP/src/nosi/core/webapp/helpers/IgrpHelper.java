package nosi.core.webapp.helpers;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
		Map<Object, Object> map = new HashMap<>();
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
			default:;
		}
		return array; // default purpose ...
	}
	
	public static String getValue(Object model,String name){
		String value = "";
		if(model!=null){		
			value = "";
			Method[] allMethods = model.getClass().getDeclaredMethods();
		    for (Method m : allMethods) {
		    	String methodName = name.substring(0, 1).toUpperCase()+name.substring(1);
		    	if(m.getName().startsWith("get") && m.getName().equals("get"+methodName)){
			    	try {
			    		if(m.invoke(model)!=null)
			    			value = ""+ m.invoke(model);
					} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
						e.printStackTrace();
					}                                                                     
		    	}
		    }
		}
		return value;
	}
}
