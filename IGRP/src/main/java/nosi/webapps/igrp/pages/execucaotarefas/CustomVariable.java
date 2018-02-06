package nosi.webapps.igrp.pages.execucaotarefas;

import java.io.Serializable;
import java.util.Map;

/**
 * Emanuel
 * 2 Feb 2018
 * @param <T>
 */
public class CustomVariable<T> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private Map<String,T> value;
	
	public Map<String, T> getValue() {
		return value;
	}
	public void setValue(Map<String, T> value) {
		this.value = value;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
}
