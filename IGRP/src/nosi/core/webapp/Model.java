package nosi.core.webapp;

import java.lang.reflect.*;
import java.util.Arrays;
import java.lang.Integer;
import java.lang.Float;
import java.lang.Double;
import java.lang.Boolean;
import java.lang.Short;
import java.lang.Long;
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
			
			if(m.getType().isArray()){
				
				String []aux = Igrp.getInstance().getRequest().getParameterValues(m.getName());
				
				switch(m.getType().getName()){
				case "[I":
					m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
					break;
				case "[D":
					m.set(this, Arrays.stream(aux).mapToDouble(Double::parseDouble).toArray());
					break;
				case "[S":
					m.set(this, Arrays.stream(aux)
							.mapToInt(Integer::parseInt).toArray());
					break;
				case "[J":
					m.set(this, Arrays.stream(aux).mapToInt(Integer::parseInt).toArray());
					break;
				default:
					m.set(this, aux);
				}
				
			}else{
				// Awesome !!! I need make casts for all primitive type ... pff
				String aux = Igrp.getInstance().getRequest().getParameter(m.getName());
				
				switch(m.getType().getName()){
					case "int":
							aux = aux == null ? "0" : aux;
							m.setInt(this, Integer.parseInt(aux));
						break;
					case "float":
							aux = aux == null ? "0.0" : aux;
							m.setFloat(this, Float.parseFloat(aux));
						break;
					case "double":
							aux = aux == null ? "0.0" : aux;
							m.setDouble(this, Double.parseDouble(aux));
						break;
					case "long":
						aux = aux == null ? "0" : aux;
							m.setLong(this, Long.parseLong(aux));
						break;
					case "short":
							aux = aux == null ? "0" : aux;
							m.setShort(this, Short.parseShort(aux));
						break;
					case "boolean":
							aux = aux == null ? "false" : aux;
							m.setBoolean(this, Boolean.parseBoolean(aux));
						break;
					default:
						m.set(this, aux);
				}
			}
		}
	}
	//... Others methods ...
	
}
