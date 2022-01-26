package nosi.core.webapp.databse.helpers;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;
import org.hibernate.cfg.AvailableSettings;

import nosi.base.ActiveRecord.HibernateUtils;
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
	public static String getMyConnectionName(Object connectionName) {
		if(Core.isNotNull(connectionName))
			return connectionName.toString();
		return ConfigApp.getInstance().getBaseConnection();
	}
	
	public static java.sql.Connection getConnection(String connectionName, String dad){
		Config_env config = new Config_env().find()
				.andWhere("name", "=", connectionName)
				.andWhere("application.dad", "=",dad)
				.one();
		return Connection.getConnectionWithConfig(config);
	}
	
	public static java.sql.Connection getConnection(String connectionName){		
		String url = "";
		String password = "";
		String user = "";
		String driver ="";
		ConfigApp configApp = ConfigApp.getInstance();
		if(connectionName.equalsIgnoreCase(configApp.getBaseConnection())) {
			@SuppressWarnings("unchecked")
			Map<String, Object> settings = HibernateUtils.REGISTRY_BUILDER_IGRP.getAggregatedCfgXml().getConfigurationValues();
			if(settings!=null) {
				for(java.util.Map.Entry<String, Object> s:settings.entrySet()) {
					if(s.getKey().equals(AvailableSettings.USER)) {
						user = s.getValue().toString();
					}
					if(s.getKey().equals(AvailableSettings.PASS)) {
						password = s.getValue().toString();
					}
					if(s.getKey().equals(AvailableSettings.URL)) {
						url = s.getValue().toString();
					}
					if(s.getKey().equals(AvailableSettings.DRIVER)) {
						driver = s.getValue().toString();
					}
				}
			}
		}else {
			String dad = Core.getCurrentDadParam();
			Config_env config = new Config_env().find()
					.andWhere("name", "=", connectionName)
					.andWhere("application.dad", "=",dad)
					.one();
			return Connection.getConnectionWithConfig(config);
		}
		return Connection.getConnection(driver,url,user,password);
	}
	
	private static java.sql.Connection getConnectionWithConfig(Config_env config) {
		String url = "";
		String password = "";
		String user = "";
		String driver ="";
		if (config != null) {
			url = Core.isNotNull(config.getUrl_connection())? Core.decrypt(config.getUrl_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getUrl(Core.decrypt(config.getType_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
											Core.decrypt(config.getHost(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
											Core.decrypt(config.getPort(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
											Core.decrypt(config.getName_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			
			password = Core.decrypt(config.getPassword(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
			user = Core.decrypt(config.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);	
			driver = DatabaseConfigHelper.getDatabaseDriversExamples(Core.decrypt(config.getType_db(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
		}
		return Connection.getConnection(driver,url,user,password);
	}


	
	public static java.sql.Connection getConnection(String driver,String url, String user, String password) {
		if(Core.isNotNullMultiple(driver,url,user,password)) {
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
		}
	    return null;
	}
	
	public static boolean validate(String url,String driver,String username,String password) {
		java.sql.Connection conn = Connection.getConnection(driver, url, username, password);
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
	
	public static java.sql.Connection getConnection(Config_env config_env){
		return Connection.getConnectionWithConfig(config_env);
	}
}
