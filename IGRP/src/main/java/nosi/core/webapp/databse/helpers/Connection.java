package nosi.core.webapp.databse.helpers;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collections;
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
		ConfigApp configApp = ConfigApp.getInstance();
		if(connectionName.equalsIgnoreCase(configApp.getBaseConnection())) {
			return Connection.getConnectionWithSettings(HibernateUtils.getSettings());
		}

		String dad = Core.getCurrentDadParam();
		return Connection.getConnectionWithSettings(getConnectionConfigName(connectionName, dad));
	}
	
	private static java.sql.Connection getConnectionWithConfig(Config_env config) {
		if (config == null) {
			return null;
		}

		return Connection.getConnectionWithSettings(config.getName() + "." + config.getApplication().getDad() + HibernateUtils.SUFIX_HIBERNATE_CONFIG);
	}

	private static java.sql.Connection getConnectionWithSettings(String cfgName) {
		return Connection.getConnectionWithSettings(getConnectionSettings(cfgName));
	}

	private static java.sql.Connection getConnectionWithSettings(Map<String, Object> settings) {
		String url = "";
		String password = "";
		String user = "";
		String driver ="";
		user = getSetting(settings, AvailableSettings.USER, user);
		password = getSetting(settings, AvailableSettings.PASS, password);
		url = getSetting(settings, AvailableSettings.URL, url);
		driver = getSetting(settings, AvailableSettings.DRIVER, driver);
		return Connection.getConnection(driver,url,user,password);
	}

	private static Map<String, Object> getConnectionSettings(String cfgName) {
		if (Core.isNull(cfgName)) {
			return Collections.emptyMap();
		}
		return CONNECTION_SETTINGS_CACHE.computeIfAbsent(cfgName, HibernateUtils::getSettings);
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



	public static java.sql.Connection getConnection(String driver, String url, String user, String password) {
		if (!Core.isNotNullMultiple(driver, url, user, password))
			return null;

		try {
			Class.forName(driver);
			Properties props = new Properties();
			props.put("user", user);
			props.put("password", password);
			return DriverManager.getConnection(url, props);
		} catch (ClassNotFoundException e) {
			Core.setMessageError(e.getMessage());
			Core.log("JDBC driver not found: " + driver + " — " + e.getMessage());
			e.printStackTrace();
		} catch (SQLException e) {
			Core.setMessageError(e.getMessage());
			Core.log("Connection failed: " + url + " — " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	public static boolean validate(String url, String driver, String username, String password) {
		try (java.sql.Connection conn = Connection.getConnection(driver, url, username, password)) {
			return conn != null;
		} catch (SQLException e) {
			Core.setMessageError(e.getMessage());
			Core.log(e.getMessage());
			return false;
		}
	}
	
	public static java.sql.Connection getConnection(Config_env config_env){
		return Connection.getConnectionWithConfig(config_env);
	}
	
	private static final Map<String, String> DEFAULT_CONNECTION_CACHE = new ConcurrentHashMap<>();
	private static final Map<String, String> CONNECTION_CONFIG_CACHE = new ConcurrentHashMap<>();
	private static final Map<String, Map<String, Object>> CONNECTION_SETTINGS_CACHE = new ConcurrentHashMap<>();
	public String defaultConnection(String dad) {
		// To make BDD work, this is a forcing bd connection to change for mock use
		final String connectionTestName = Core.getParam("igrp.test.bdd", false);
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
			String cfgName = CONNECTION_CONFIG_CACHE.remove(getConnectionCacheKey(connectionName, dad));
			if (cfgName == null) {
				cfgName = connectionName + "." + dad + HibernateUtils.SUFIX_HIBERNATE_CONFIG;
			}
			clearConnectionSettingsCache(cfgName);
		}
	}
	public static void clearConnectionConfigCache(String dad) {
		if (Core.isNotNull(dad)) {
			for (Map.Entry<String, String> entry : CONNECTION_CONFIG_CACHE.entrySet()) {
				String cfgName = entry.getValue();
				if (entry.getKey().startsWith(dad + "|") || (cfgName != null && cfgName.endsWith("." + dad + HibernateUtils.SUFIX_HIBERNATE_CONFIG))) {
					clearConnectionSettingsCache(cfgName);
					CONNECTION_CONFIG_CACHE.remove(entry.getKey(), cfgName);
				}
			}
			for (String cfgName : CONNECTION_SETTINGS_CACHE.keySet()) {
				if (cfgName.endsWith("." + dad + HibernateUtils.SUFIX_HIBERNATE_CONFIG)) {
					clearConnectionSettingsCache(cfgName);
				}
			}
		}
	}

	public static void clearConnectionConfigCache() {
		CONNECTION_CONFIG_CACHE.clear();
		CONNECTION_SETTINGS_CACHE.clear();
	}

	private static void clearConnectionSettingsCache(String cfgName) {
		if (Core.isNotNull(cfgName)) {
			CONNECTION_SETTINGS_CACHE.remove(cfgName);
		}
	}
}
