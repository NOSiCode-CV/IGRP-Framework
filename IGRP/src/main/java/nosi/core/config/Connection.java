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

	public Connection() {
		
	}
	

	public java.sql.Connection getConnection(String connectionName){		
		String url = "";
		String password = "";
		String user = "";
		String dbtype ="";
		
		if(connectionName.equalsIgnoreCase(ConfigApp.getInstance().getBaseConnection()) || connectionName.equalsIgnoreCase(ConfigApp.getInstance().getH2IGRPBaseConnection())) {
			ConfigDBIGRP config =  ConfigDBIGRP.getInstance();
			try {
				config.load();
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
		return this.getConnection(dbtype,url,user,password);
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
		return this.getConnection(dbtype,url,user,password);
	}

	private java.sql.Connection getConnection(String dbType,String url, String user, String password) {
		java.sql.Connection conn = null;
	    Properties connectionProps = new Properties();
	    connectionProps.put("user", user);
	    connectionProps.put("password", password);
	    boolean isConnect = true;
	    try {
	    	Class.forName(DatabaseConfigHelper.getDatabaseDriversExamples(dbType)); 
			conn = DriverManager.getConnection(url,connectionProps);
		} catch (SQLException | ClassNotFoundException e) {
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
