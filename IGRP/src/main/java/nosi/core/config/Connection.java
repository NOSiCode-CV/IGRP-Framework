package nosi.core.config;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.webapps.igrp.dao.Config_env;

/**
 * @author: Emanuel Pereira
 * 8 Jul 2017
 */
public class Connection {

	private ConfigApp configApp;
	private EncrypDecrypt ed;
	public Connection() {
		this.configApp = new ConfigApp();
		this.ed = new EncrypDecrypt();
	}
	
	
	
	public ConfigApp getConfigApp() {
		return configApp;
	}

	public java.sql.Connection getConnection(String connectionName){		
		String url = "";
		String password = "";
		String user = "";
		
		if(connectionName.equalsIgnoreCase(this.configApp.getBaseConnection()) || connectionName.equalsIgnoreCase(this.configApp.getH2IGRPBaseConnection())) {
			ConfigDBIGRP config = new ConfigDBIGRP();
			try {
				config.load();
				url = config.getUrlConnection();
				password = config.getPassword();
				user = config.getUsername();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			String dad = Core.getCurrentDadParam();
			Config_env config = new Config_env().find()
					.andWhere("name", "=", connectionName)
					.andWhere("application.dad", "=",dad)
					.one();
			return this.getConnectionWithConfig(config);
		}
		return this.getConnection(url,user,password);
	}
	
	private java.sql.Connection getConnectionWithConfig(Config_env config) {
		String url = "";
		String password = "";
		String user = "";
		if (config != null) {
			url = Core.isNotNull(config.getUrl_connection())? Core.decrypt(config.getUrl_connection(),this.ed.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getUrl(
						Core.decrypt(config.getType_db(), this.ed.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getHost(), this.ed.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getPort(), this.ed.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getName_db(), this.ed.SECRET_KEY_ENCRYPT_DB)
					);
			password = Core.decrypt(config.getPassword(), this.ed.SECRET_KEY_ENCRYPT_DB);
			user = Core.decrypt(config.getUsername(), this.ed.SECRET_KEY_ENCRYPT_DB);				
		}
		return this.getConnection(url,user,password);
	}

	private java.sql.Connection getConnection(String url, String user, String password) {
		java.sql.Connection conn = null;
	    Properties connectionProps = new Properties();
	    connectionProps.put("user", user);
	    connectionProps.put("password", password);
	    boolean isConnect = true;
	    try {
			conn = DriverManager.getConnection(url,connectionProps);
		} catch (SQLException e) {
			isConnect = false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    if(isConnect)
	    	return conn;
	    else {
	    	if(conn!=null) {
	    		try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    	}
	    }
	    return null;
	}

	public java.sql.Connection getConnection(Config_env config_env){
		return this.getConnectionWithConfig(config_env);
	}
}
