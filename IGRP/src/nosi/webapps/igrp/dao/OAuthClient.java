package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import nosi.base.ActiveRecord.BaseActiveRecord;;
/**
 * Marcel Iekiny
 * Sep 16, 2017
 */
@Entity
@Table(name = "oauth_clients")
public class OAuthClient extends BaseActiveRecord<OAuthClient> implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String client_id;
	
	private String client_secret;
	private String redirect_uri;
	private String grant_types;
	private String scope;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private User user;
	
	@OneToMany(mappedBy = "authClient")
	private List<OAuthorizationCode> oauthorizationCode;
	
	public OAuthClient() {}
	
	public OAuthClient(String client_id, String client_secret, String redirect_uri, String grant_types, String scope,
			User user) {
		super();
		this.client_id = client_id;
		this.client_secret = client_secret;
		this.redirect_uri = redirect_uri;
		this.grant_types = grant_types;
		this.scope = scope;
		this.user = user;
	}

	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getClient_secret() {
		return client_secret;
	}
	public void setClient_secret(String client_secret) {
		this.client_secret = client_secret;
	}
	public String getRedirect_uri() {
		return redirect_uri;
	}
	public void setRedirect_uri(String redirect_uri) {
		this.redirect_uri = redirect_uri;
	}
	public String getGrant_types() {
		return grant_types;
	}
	public void setGrant_types(String grant_types) {
		this.grant_types = grant_types;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OAuthorizationCode> getOauthorizationCode() {
		return oauthorizationCode;
	}

	public void setOauthorizationCode(List<OAuthorizationCode> oauthorizationCode) {
		this.oauthorizationCode = oauthorizationCode;
	}
}
