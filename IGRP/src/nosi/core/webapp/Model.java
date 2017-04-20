package nosi.core.webapp;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.lang.Integer;
import java.lang.Float;
import java.lang.Double;
import java.lang.Boolean;
import java.lang.Short;
import java.lang.Long;

import nosi.core.webapp.helpers.Helper;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public abstract class Model { // IGRP super model
	
	// this mehtod allow auto-inicialization for all sub-models
	public void load() throws IllegalArgumentException, IllegalAccessException{
		Class c = this.getClass();
		for(Field m : c.getDeclaredFields()){
			m.setAccessible(true);
			String typeName = m.getType().getName();
			if(m.getType().isArray()){
				String []aux = Igrp.getInstance().getRequest().getParameterValues(m.getName());
				// Awesome !!! I need make casts for all [] primitive type ... pff
				switch(typeName){
					case "[I": // Array of int
						//m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
						m.set(this, (int[])Helper.convertToArray(aux, "int"));
						break;
					case "[J":// Array de long
						//m.set(this, Arrays.stream(aux).mapToLong(Long::parseLong).toArray());
						m.set(this, (long[])Helper.convertToArray(aux, "long"));
						break;
					case "[D":
						//m.set(this, Arrays.stream(aux).mapToDouble(Double::parseDouble).toArray());
						m.set(this, (double[])Helper.convertToArray(aux, "double"));
						break;
					case "[S":// Array de short
						m.set(this, (short[])Helper.convertToArray(aux, "short"));
						break;
					case "[F":
						//m.set(this, Arrays.stream(aux).mapToDouble(Float::parseFloat).toArray());
						m.set(this, (float[])Helper.convertToArray(aux, "float"));
						break;
					case "[Z": // boolean
						m.set(this, (boolean[])Helper.convertToArray(aux, "boolean"));
						break;
					default:
						m.set(this, typeName == "java.lang.String" ? aux : null); // The field could be a Object
				}
			}else{
				// Awesome again !!! I need make casts for all primitive type ... pff
				String aux = Igrp.getInstance().getRequest().getParameter(m.getName());
				aux = aux == null || aux.equals("") ? "0" : aux; // For throw format exception purpose
				switch(typeName){
					case "int":
							m.setInt(this, Integer.parseInt(aux));
						break;
					case "float":
							m.setFloat(this, Float.parseFloat(aux));
						break;
					case "double":
							m.setDouble(this, Double.parseDouble(aux));
						break;
					case "long":
							m.setLong(this, Long.parseLong(aux));
						break;
					case "short":
							m.setShort(this, Short.parseShort(aux));
						break;
					case "boolean":
							aux = aux == null ? "false" : aux;
							m.setBoolean(this, Boolean.parseBoolean(aux));
						break;
					default:
						m.set(this, typeName == "java.lang.String" ? aux : null); // The field could be a Object
				}
			}
		}
	}
	
	//... Others methods ...

	
}
