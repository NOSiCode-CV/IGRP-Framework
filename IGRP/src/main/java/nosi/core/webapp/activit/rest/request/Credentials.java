package nosi.core.webapp.activit.rest.request;

import nosi.webapps.igrp.dao.Config;

/**
 * Emanuel
 * 15 May 2019
 */
public class Credentials {

	private static Credentials CREDENCIALS;
	private String url;
	private String userName;
	private String password;
	
	
	private Credentials() {
		this.url = new Config().find().where("name", "=", "url_ativiti_connection").one().getValue(); 
		this.userName = new Config().find().where("name", "=", "ativiti_user").one().getValue();
		this.password = new Config().find().where("name", "=", "ativiti_password").one().getValue();
	}
	
	public static Credentials getInstance() {
		if(CREDENCIALS==null) {
			CREDENCIALS = new Credentials();
		}
		return CREDENCIALS;
	}

	public String getUrl() {
		return url;
	}

	public String getUserName() {
		return userName;
	}

	public String getPassword() {
		return password;
	}
	
}
