package nosi.core.webapp.activit.rest.request;

import nosi.webapps.igrp.dao.Config;

import java.util.Optional;

/**
 * Emanuel
 * 15 May 2019
 */
public class Credentials {

	private static Credentials credencial;
    private static final String URL = Optional.ofNullable(new Config().find().where("name", "=", "url_ativiti_connection").oneColumns("value")).map(map -> (String) map.get("value")).orElse("");
    private static final String USERNAME = Optional.ofNullable(new Config().find().where("name", "=", "ativiti_user").oneColumns("value")).map(map -> (String) map.get("value")).orElse("");
    private static final String PASSWORD = Optional.ofNullable(new Config().find().where("name", "=", "ativiti_password").oneColumns("value")).map(map -> (String) map.get("value")).orElse("");
	
	
	private Credentials() {

	}
	
	public static Credentials getInstance() {
		if(credencial==null) {
			credencial = new Credentials();
		}
		return credencial;
	}

	public String getUrl() {
        return URL != null ? URL : "";
	}

	public String getUserName() {
        return USERNAME != null ? USERNAME : "";
	}

	public String getPassword() {
		return PASSWORD != null ? PASSWORD : "";
	}
	
}
