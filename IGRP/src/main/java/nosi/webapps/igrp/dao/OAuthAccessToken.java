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
@Table(name = "oauth_access_tokens")
public class OAuthAccessToken extends BaseActiveRecord <OAuthAccessToken> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7180329588761600830L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	private String access_token;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "client_id", referencedColumnName = "client_id")
	private OAuthClient authClient;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	
	private String expires;
	private String scope;
	
	public OAuthAccessToken() {}
	
	public OAuthAccessToken(String access_token, OAuthClient authClient, User user, String expires, String scope) {
		super();
		this.access_token = access_token;
		this.authClient = authClient;
		this.user = user;
		this.expires = expires;
		this.scope = scope;
	}

	public String getAccess_token() {
		return access_token;
	}
	
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
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
