package nosi.core.config;
/**
 * Iekiny Marcel
 * Sep 10, 2020
 */
public enum ConfigCommonMainConstants { 
	
	
	IGRP_ENV("igrp.env"),
	IGRP_ENV_DEV("dev"),
	IGRP_ENV_TEST("test"),
	IGRP_ENV_STA("sta"),
	IGRP_ENV_PROD("prod"),
	
	IGRP_WORKSPACE("igrp.workspace"),
	
	IGRP_AUTHENTICATION_TYPE("igrp.authentication_type"),
	IGRP_AUTHENTICATION_TYPE_DATABASE("db"),
	IGRP_AUTHENTICATION_TYPE_LDAP("ldap"),
	IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID("oauth2-openid"),
	
	IGRP_PASSWORD_RECOVERY("igrp.pwdRecover"),
	
	IGRP_AUTHENTICATION_GOVCV_ENABLED("igrp.authentication.govcv.enbaled"),
	
	IDS_AUTENTIKA_ENABLED("ids.autentika.enabled"),
	IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL("ids.autentika.RemoteUserStoreManagerService-wsdl-url"),
	IDS_AUTENTIKA_ADMIN_USN("ids.autentika.admin-usn"),
	IDS_AUTENTIKA_ADMIN_PWD("ids.autentika.admin-pwd"),
	IDS_OAUTH2_OPENID_CLIENT_ID("ids.oauth2-openid.client_id"),
	IDS_OAUTH2_OPENID_CLIENT_SECRET("ids.oauth2-openid.client_secret"),
	IDS_OAUTH2_OPENID_ENDPOINT_TOKEN("ids.oauth2-openid.endpoint.token"),
	IDS_OAUTH2_OPENID_ENDPOINT_USER("ids.oauth2-openid.endpoint.user"),
	IDS_OAUTH2_OPENID_ENDPOINT_AUTHORIZE("ids.oauth2-openid.endpoint.authorize"),
	IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI("ids.oauth2-openid.endpoint.redirect_uri"),
	IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT("ids.oauth2-openid.endpoint.logout"),

	LDAP_AD_URL("ldap.ad.url"),
	LDAP_AD_USERNAME("ldap.ad.username"),
	LDAP_AD_PASSWORD("ldap.ad.password"),
	LDAP_AD_BASE("ldap.ad.base"),
	LDAP_AD_AUTHENTICATION_FILTER("ldap.ad.authentication_filter"),
	LDAP_AD_ENTRY_DN("ldap.ad.entryDN"),
	
	KRIOL_ADD_ROLE_USER("kriol.addrole.user"),
	
	MAIL_SMTP_HOST("mail.smtp.host"),
	MAIL_SMTP_SOCKET_FACTORY_PORT("mail.smtp.socketFactory.port"),
	MAIL_SMTP_SOCKET_FACTORY_CLASS("mail.smtp.socketFactory.class"),
	MAIL_SMTP_AUTH("mail.smtp.auth"),
	MAIL_SMTP_PORT("mail.smtp.port"),
	MAIL_USER("mail.user"),
	MAIL_PASSWORD("mail.password"),
	
	IGRP_PDEX_APPCONFIG_URL("igrp.pdex.appconfig.url"),
	IGRP_PDEX_APPCONFIG_TOKEN("igrp.pdex.appconfig.token"),
	IGRP_PDEX_PERMISSION_ACL_URL("igrp.pdex.permissionacl.url"),
	IGRP_PDEX_PERMISSION_ACL_TOKEN("igrp.pdex.permissionacl.token"),
	
	; 
	
	private String value; 
	
	ConfigCommonMainConstants(String value){
		this.value = value; 
	}

	public String value() {
		return value;
	}
	
}
