package nosi.core.webapp.databse.helpers;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.ConcurrentHashMap;

import org.hibernate.cfg.AvailableSettings;

import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.ConfigApp;
import nosi.core.webapp.Core;
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
		return Connection.getConnectionWithSettings(getConnectionConfigName(connectionName, dad));
	}
	
	public static java.sql.Connection getConnection(String connectionName){		
		String url = "";
		String password = "";
		String user = "";
		String driver ="";
		ConfigApp configApp = ConfigApp.getInstance();
		Map<String, Object> settings;
		if(connectionName.equalsIgnoreCase(configApp.getBaseConnection())) {
			settings = HibernateUtils.getSettings();
			
		}else {
			String dad = Core.getCurrentDadParam();
			settings = HibernateUtils.getSettings(connectionName+"."+dad+HibernateUtils.SUFIX_HIBERNATE_CONFIG);

		}
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
		return Connection.getConnection(driver,url,user,password);
	}
	
	private static java.sql.Connection getConnectionWithConfig(Config_env config) {
		if (config == null) {
			return null;
		}

		return Connection.getConnectionWithSettings(config.getName() + "." + config.getApplication().getDad() + HibernateUtils.SUFIX_HIBERNATE_CONFIG);
	}

	private static java.sql.Connection getConnectionWithSettings(String cfgName) {
		String url = "";
		String password = "";
		String user = "";
		String driver ="";
		if (Core.isNotNull(cfgName)) {
			Map<String, Object> settings = HibernateUtils.getSettings(cfgName);
			user = getSetting(settings, AvailableSettings.USER, user);
			password = getSetting(settings, AvailableSettings.PASS, password);
			url = getSetting(settings, AvailableSettings.URL, url);
			driver = getSetting(settings, AvailableSettings.DRIVER, driver);
		}
		return Connection.getConnection(driver,url,user,password);
	}

	private static String getSetting(Map<String, Object> settings, String key, String defaultValue) {
		if (settings == null) {
			return defaultValue;
		}
		Object value = settings.get(key);
		return value != null ? value.toString() : defaultValue;
	}

	private static String getConnectionConfigName(String connectionName, String dad) {
		if (!Core.isNotNullMultiple(connectionName, dad)) {
			return null;
		}
		return CONNECTION_CONFIG_CACHE.computeIfAbsent(getConnectionCacheKey(connectionName, dad), key -> loadConnectionConfigName(connectionName, dad));
	}

	private static String loadConnectionConfigName(String connectionName, String dad) {
		Config_env config = new Config_env().find()
				.andWhere("name", "=", connectionName)
				.andWhere("application.dad", "=",dad)
				.setApplicationName("igrp")
				.one();

		if (config == null) {
			return null;
		}

		return config.getName() + "." + config.getApplication().getDad() + HibernateUtils.SUFIX_HIBERNATE_CONFIG;
	}

	private static String getConnectionCacheKey(String connectionName, String dad) {
		return dad + "|" + connectionName;
	}


	
	public static java.sql.Connection getConnection(String driver,String url, String user, String password) {
		if(Core.isNotNullMultiple(driver,url,user,password)) {
		    Properties connectionProps = new Properties();
		    connectionProps.put("user", user);
		    connectionProps.put("password", password);
		    try {
		    	Class.forName(driver);
				return DriverManager.getConnection(url,connectionProps);
			} catch (SQLException | ClassNotFoundException e) {
				Core.setMessageError(e.getMessage());
				Core.log(e.getMessage());
				e.printStackTrace();
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

	private static final Map<String, String> DEFAULT_CONNECTION_CACHE = new ConcurrentHashMap<>();
	private static final Map<String, String> CONNECTION_CONFIG_CACHE = new ConcurrentHashMap<>();
	
	public String defaultConnection(String dad) {
		//To make BDD work, this is a forcing bd connection to change for mock use
		final String connectionTestName = Core.getParam("igrp.test.bdd",false);
		if (Core.isNotNull(connectionTestName)) {
			return connectionTestName;
		}

		if (Core.isNull(dad)) {
			return "";
		}

		return DEFAULT_CONNECTION_CACHE.computeIfAbsent(dad, this::loadDefaultConnection);
	}

	private String loadDefaultConnection(String dad) {
		String result = "";
		Map<String, Object> configEnv = new Config_env().find()
				.where("isdefault", "=", (short) 1)
				.andWhere("application.dad", "=", dad)
				.setApplicationName("igrp")
				.oneColumns("name");

		if (configEnv != null) {
			result = (String) configEnv.get("name");
		}

		return result;
	}

	public static void clearDefaultConnectionCache(String dad) {
		if (Core.isNotNull(dad)) {
			DEFAULT_CONNECTION_CACHE.remove(dad);
		}
	}

	public static void clearDefaultConnectionCache() {
		DEFAULT_CONNECTION_CACHE.clear();
	}

	public static void clearConnectionConfigCache(String connectionName, String dad) {
		if (Core.isNotNullMultiple(connectionName, dad)) {
			CONNECTION_CONFIG_CACHE.remove(getConnectionCacheKey(connectionName, dad));
		}
	}

	public static void clearConnectionConfigCache(String dad) {
		if (Core.isNotNull(dad)) {
			CONNECTION_CONFIG_CACHE.keySet().removeIf(key -> key.startsWith(dad + "|"));
		}
	}

	public static void clearConnectionConfigCache() {
		CONNECTION_CONFIG_CACHE.clear();
	}
}
