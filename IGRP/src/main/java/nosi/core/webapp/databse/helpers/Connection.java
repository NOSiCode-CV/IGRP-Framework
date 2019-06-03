package nosi.core.webapp.databse.helpers;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Core;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp.dao.Config_env;

/**
 * @author: Emanuel Pereira
 * 8 Jul 2017
 */
public class Connection {

	public Connection() {
		
	}
	

	public java.sql.Connection getConnection(String connectionName){		
		String url = "";
		String password = "";
		String user = "";
		String dbtype ="";
		ConfigApp configApp = ConfigApp.getInstance();
		if(connectionName.equalsIgnoreCase(configApp.getBaseConnection()) || connectionName.equalsIgnoreCase(configApp.getH2IGRPBaseConnection())) {
			ConfigDBIGRP config =  ConfigDBIGRP.getInstance();
			try {
				if(connectionName.equalsIgnoreCase(configApp.getBaseConnection())) {
					config.loadIGRPConnectionConfig();
				}else if(connectionName.equalsIgnoreCase(configApp.getH2IGRPBaseConnection())) {
					config.loadIGRPConnectionConfigH2();
				}
				url = config.getUrlConnection();
				password = config.getPassword();
				user = config.getUsername();
				dbtype = config.getType_db();
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
		return this.getConnection_(dbtype,url,user,password);
	}
	
	private java.sql.Connection getConnectionWithConfig(Config_env config) {
		String url = "";
		String password = "";
		String user = "";
		String dbtype ="";
		if (config != null) {
			url = Core.isNotNull(config.getUrl_connection())? Core.decrypt(config.getUrl_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getUrl(Core.decrypt(config.getType_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
											Core.decrypt(config.getHost(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
											Core.decrypt(config.getPort(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
											Core.decrypt(config.getName_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			
			password = Core.decrypt(config.getPassword(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
			user = Core.decrypt(config.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);	
			dbtype = Core.decrypt(config.getType_db(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
		}
		return this.getConnection_(dbtype,url,user,password);
	}

	private java.sql.Connection getConnection_(String dbType,String url, String user, String password) {
	    return this.getConnection(DatabaseConfigHelper.getDatabaseDriversExamples(dbType), url, user, password);
	}

	
	public java.sql.Connection getConnection(String driver,String url, String user, String password) {
		java.sql.Connection conn = null;
	    Properties connectionProps = new Properties();
	    connectionProps.put("user", user);
	    connectionProps.put("password", password);
	    boolean isConnect = true;
	    try {
	    	Class.forName(driver); 
			conn = DriverManager.getConnection(url,connectionProps);
		} catch (SQLException | ClassNotFoundException e) {
			isConnect = false;
			Core.setMessageError(e.getMessage());
			Core.log(e.getMessage());
			e.printStackTrace();
		}
	    if(isConnect)
	    	return conn;
	    else {
	    	if(conn!=null) {
	    		try {
					conn.close();
				} catch (SQLException e) {
					Core.setMessageError(e.getMessage());
					Core.log(e.getMessage());
					e.printStackTrace();
				}
	    	}
	    }
	    return null;
	}
	
	public boolean validate(String url,String driver,String username,String password) {
		java.sql.Connection conn = this.getConnection(driver, url, username, password);
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				Core.setMessageError(e.getMessage());
				Core.log(e.getMessage());
				return false;
			}
			return true;
		}
		return false;
	}
	
	public java.sql.Connection getConnection(Config_env config_env){
		return this.getConnectionWithConfig(config_env);
	}
}
