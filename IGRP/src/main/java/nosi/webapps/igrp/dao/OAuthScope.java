package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import nosi.core.webapp.helpers.IgrpHelper;
/**
 * Marcel Iekiny
 * Sep 16, 2017
 */
@Entity
@Table(name = "oauth_scopes")
public class OAuthScope extends IGRPBaseActiveRecord<OAuthScope> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7649144758364540820L;
	@Id
	private String scope;
	private int is_default;
	
	public OAuthScope() {}
	
	public OAuthScope(String scope, int is_default) {
		super();
		this.scope = scope;
		this.is_default = is_default;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public int getIs_default() {
		return is_default;
	}
	public void setIs_default(int is_default) {
		this.is_default = is_default;
	}
	public Map<Object, Object> getListScope(){
		return IgrpHelper.toMap(this.findAll(), "scope", "scope", "");
	}
}
