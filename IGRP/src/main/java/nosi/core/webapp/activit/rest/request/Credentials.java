package nosi.core.webapp.activit.rest.request;

import nosi.webapps.igrp.dao.Config;

/**
 * Emanuel
 * 15 May 2019
 */
public class Credentials {

	private static Credentials CREDENCIALS;
	private static final String url = new Config().find().where("name", "=", "url_ativiti_connection").one().getValue();
	private static final String userName=new Config().find().where("name", "=", "ativiti_user").one().getValue();
	private static final String password=new Config().find().where("name", "=", "ativiti_password").one().getValue();
	
	
	private Credentials() {

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
