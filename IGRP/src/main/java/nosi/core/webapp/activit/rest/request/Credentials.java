package nosi.core.webapp.activit.rest.request;

import nosi.webapps.igrp.dao.Config;

/**
 * Emanuel
 * 15 May 2019
 */
public class Credentials {

	private static Credentials credencial;
	private static final String URL = new Config().find().where("name", "=", "url_ativiti_connection").one().getValue();
	private static final String USERNAME=new Config().find().where("name", "=", "ativiti_user").one().getValue();
	private static final String PASSWORD=new Config().find().where("name", "=", "ativiti_password").one().getValue();
	
	
	private Credentials() {

	}
	
	public static Credentials getInstance() {
		if(credencial==null) {
			credencial = new Credentials();
		}
		return credencial;
	}

	public String getUrl() {
		return URL;
	}

	public String getUserName() {
		return USERNAME;
	}

	public String getPassword() {
		return PASSWORD;
	}
	
}
