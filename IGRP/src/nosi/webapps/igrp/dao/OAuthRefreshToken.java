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
@Table(name = "oauth_refresh_tokens")
public class OAuthRefreshToken extends BaseActiveRecord<OAuthRefreshToken> implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String refresh_token;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "client_id", referencedColumnName = "client_id")
	private OAuthClient authClient;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	
	private String expires;
	private String scope;
	
	public OAuthRefreshToken() {}
	
	public OAuthRefreshToken(String refresh_token, OAuthClient authClient, User user, String expires, String scope) {
		super();
		this.refresh_token = refresh_token;
		this.authClient = authClient;
		this.user = user;
		this.expires = expires;
		this.scope = scope;
	}

	public String getRefresh_token() {
		return refresh_token;
	}
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
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
}
