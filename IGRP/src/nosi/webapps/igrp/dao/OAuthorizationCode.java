package nosi.webapps.igrp.dao;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import nosi.base.ActiveRecord.BaseActiveRecord;

/**
 * Marcel Iekiny
 * Sep 16, 2017
 */
@Entity
@Table(name = "oauth_authorization_code")
public class OAuthorizationCode extends BaseActiveRecord<OAuthorizationCode> implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	private String authorization_code;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "client_id", referencedColumnName = "client_id")
	private OAuthClient authClient;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	
	private String redirect_uri;
	private String expires;
	private String scope;
	private String id_token;
	
	
	public OAuthorizationCode() {}
	
	public OAuthorizationCode(String authorization_code, OAuthClient authClient, User user, String redirect_uri,
			String expires, String scope, String id_token) {
		super();
		this.authorization_code = authorization_code;
		this.authClient = authClient;
		this.user = user;
		this.redirect_uri = redirect_uri;
		this.expires = expires;
		this.scope = scope;
		this.id_token = id_token;
	}

	public String getAuthorization_code() {
		return authorization_code;
	}
	public void setAuthorization_code(String authorization_code) {
		this.authorization_code = authorization_code;
	}

	public String getRedirect_uri() {
		return redirect_uri;
	}

	public void setRedirect_uri(String redirect_uri) {
		this.redirect_uri = redirect_uri;
	}

	public String getExpires() {
		return expires;
	}
	public void setExpires(String expires) {
		this.expires = expires;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getId_token() {
		return id_token;
	}
	public void setId_token(String id_token) {
		this.id_token = id_token;
	}

	public OAuthClient getAuthClient() {
		return authClient;
	}

	public void setAuthClient(OAuthClient authClient) {
		this.authClient = authClient;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
}
