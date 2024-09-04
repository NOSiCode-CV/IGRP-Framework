package nosi.core.webapp.helpers;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Core;
import nosi.core.webapp.uploadfile.UploadFile;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.*;

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
		Map<Object, Object> map =(values!=null?new LinkedHashMap<>(values.size()):new LinkedHashMap<>());
		if(prompt != null)
			map.put(null, prompt);
		if(values!=null)
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

	public static String getValue(Object object, String name) {
		String value=null;
		if (object != null && name != null && !name.isEmpty()) {
			try {
				final var methodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
				final var method = object.getClass().getMethod(methodName);
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
			final var methodName = "get" + name.substring(0, 1).toUpperCase() + name.substring(1);
			try {
				final var method = object.getClass().getMethod(methodName);
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

			if (typeName.equalsIgnoreCase("java.lang.integer"))
				field.set(obj,Core.toInt(stringValue));
			if (typeName.equalsIgnoreCase("int"))
				field.setInt(obj,Core.toInt(stringValue));
			else if	(typeName.equalsIgnoreCase("java.lang.long"))
				field.set(obj,Core.toLong(stringValue));
			else if (typeName.equalsIgnoreCase("long"))
				field.setLong(obj,Core.toLong(stringValue));
			else if	(typeName.equalsIgnoreCase("java.lang.short"))
				field.set(obj,Core.toShort(stringValue));
			else if(typeName.equalsIgnoreCase("short"))
				field.setShort(obj,Core.toShort(stringValue));
			else if(typeName.equalsIgnoreCase("java.lang.float"))
				field.set(obj,Core.toFloat(stringValue));
			else if(typeName.equalsIgnoreCase("float"))
				field.setFloat(obj,Core.toFloat(stringValue));
			else if(typeName.equalsIgnoreCase("java.lang.double"))
				field.set(obj,Core.toDouble(stringValue));
			else if(typeName.equalsIgnoreCase("double"))
				field.setDouble(obj,Core.toDouble(stringValue));
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
