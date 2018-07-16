package nosi.base.ActiveRecord;
/**
 * Emanuel
 * 29 May 2018
 */

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;
import nosi.core.config.Config;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Config_env;

public class HibernateUtils {

	private static StandardServiceRegistry registry;
	private static Map<String,SessionFactory> sessionFactory = new HashMap<>();

	public static SessionFactory getSessionFactory(Config_env config_env) {
		if (config_env != null && config_env.getApplication()!=null)
			return getSessionFactory(config_env.getName(), config_env.getApplication().getId());
		return getSessionFactory(new Config().getBaseConnection());
	}

	public static SessionFactory getSessionFactory(String connectionName) {
		return getSessionFactory(connectionName, -1);
	}

	public static SessionFactory getSessionFactory(String connectionName, Integer appId) {
		if (!sessionFactory.containsKey(connectionName)) {
			try {
				StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
				registryBuilder.configure("/" + connectionName + ".cfg.xml");
				registryBuilder.applySettings(getSettings(connectionName, appId));
				registry = registryBuilder.build();
				MetadataSources sources = new MetadataSources(registry);
				Metadata metadata = sources.getMetadataBuilder().build();
				sessionFactory.put(connectionName,metadata.getSessionFactoryBuilder().build());
			} catch (Exception e) {
				e.printStackTrace();
				destroy();
			}
		}
		return sessionFactory.get(connectionName);
	}

	private static Map<String, Object> getSettings(String connectionName, Integer appId) {
		Config cf = new Config();
		String url = null, driver = null, password = null, user = null, hibernateDialect = null;
		if (cf.getBaseConnection().equalsIgnoreCase(connectionName)) {
			ConfigDBIGRP config = new ConfigDBIGRP();
			try {
				config.load();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			url = getUrl(config.getType_db(), config.getHost(), "" + config.getPort(), config.getName_db());
			driver = getDriver(config.getType_db());
			password = config.getPassword();
			user = config.getUsername();
			hibernateDialect = getHibernateDialect(config.getType_db());
		} else {
			Config_env config = new Config_env();
			config.find().andWhere("name", "=", connectionName);
			config = config.one();

			if (config != null) {
				
				url = getUrl(
							Core.decrypt(config.getType_db(), cf .SECRET_KEY_ENCRYPT_DB),
							Core.decrypt(config.getHost(), cf.SECRET_KEY_ENCRYPT_DB),
							Core.decrypt(config.getPort(), cf.SECRET_KEY_ENCRYPT_DB),
							Core.decrypt(config.getName_db(), cf.SECRET_KEY_ENCRYPT_DB)
						);
				driver = getDriver(Core.decrypt(config.getType_db(), cf.SECRET_KEY_ENCRYPT_DB));
				password = Core.decrypt(config.getPassword(), cf.SECRET_KEY_ENCRYPT_DB);
				user = Core.decrypt(config.getUsername(), cf.SECRET_KEY_ENCRYPT_DB);
				hibernateDialect = getHibernateDialect(config.getType_db());
			}
		}
		return getSettings(driver, url, user, password, hibernateDialect);
	}

	public static Map<String, Object> getSettings(String driver,String url,String user,String password,String hibernateDialect) {
		Map<String, Object> settings = getBaseSettings(driver, url, user, password, hibernateDialect);
	
		settings.put(Environment.HBM2DDL_AUTO, "update");
		//settings.put(Environment.SHOW_SQL, true);
		
		// HikariCP settings (values in milliseconds)
		ConfigHikariCP cHCp = new ConfigHikariCP();
		//Maximum waiting time for a connection from the pool. 
		settings.put("hibernate.hikari.connectionTimeout",cHCp.getConnectionTimeout());
		//Maximum time that a connection is allowed to sit ideal in the pool
		settings.put("hibernate.hikari.idleTimeout", cHCp.getIdleTimeout());	
		//Minimum number of ideal connections in the pool
		settings.put("hibernate.hikari.minimumIdle",cHCp.getMinimumIdle());
		//Maximum number of actual connection in the pool
		settings.put("hibernate.hikari.maximumPoolSize", cHCp.getMaximumPoolSize());
		//Maximum lifetime of a connection in the pool
		settings.put("hibernate.hikari.maxLifetime", cHCp.getMaxLifetime());

		//Hibernate configuration
//        settings.put("hibernate.current_session_context_class","thread");
//        settings.put("hibernate.connection.isolation", "2");
        settings.put("hibernate.connection.provider_class", "org.hibernate.hikaricp.internal.HikariCPConnectionProvider");
		return settings;
	}

	public static Map<String, Object> getBaseSettings(String driver,String url,String user,String password,String hibernateDialect) {
		Map<String, Object> settings = new HashMap<>();
		settings.put(Environment.DRIVER, driver);
		settings.put(Environment.URL, url);
		settings.put(Environment.USER, user);
		settings.put(Environment.PASS, password);
		settings.put("hibernate.dialect", hibernateDialect);
		return settings;
	}

	public static String getDriver(String type) {
		switch (type.toLowerCase()) {
		case "h2":
			return "org.h2.Driver";
		case "mysql":
			return "com.mysql.jdbc.Driver";
		case "postgresql":
			return "org.postgresql.Driver";
		case "oracle":
			return "oracle.jdbc.driver.OracleDriver";
		}
		return "org.h2.Driver";
	}

	public static String getUrl(String type, String host, String port, String db_name) {
		switch (type) {
		case "h2":
			return host.equalsIgnoreCase("mem") ? ("jdbc:h2:" + host + ":" + db_name): ("jdbc:h2:" + host + "/" + db_name);
		case "mysql":
			return "jdbc:mysql://" + host + ":" + port + "/" + db_name;
		case "postgresql":
			return "jdbc:postgresql://" + host + ":" + port + "/" + db_name;
		case "oracle":
			return "jdbc:oracle:thin:@" + host + ":" + port + "/" + db_name;
		}
		return "";
	}

	public static String getHibernateDialect(String type) {
		switch (type.toLowerCase()) {
		case "h2":
			return "org.hibernate.dialect.H2Dialect";
		case "mysql":
			return "org.hibernate.dialect.MySQL5InnoDBDialect";
		case "postgresql":
			return "org.hibernate.dialect.PostgreSQLDialect";
		case "oracle":
			return "org.hibernate.dialect.OracleDialect";
		}
		return "";
	}

	
	public synchronized static void destroy() {
		if (registry != null) {
			StandardServiceRegistryBuilder.destroy(registry);
		}
	}

	public synchronized static void unregisterAllDrivers() {
		   Enumeration<Driver> drivers = DriverManager.getDrivers();
	      while(drivers.hasMoreElements()) {
	          try {
					DriverManager.deregisterDriver(drivers.nextElement());
				} catch (SQLException e) {
					e.printStackTrace();
					continue;
				}
	      }
	}

	public static void closeAllConnection() {
		sessionFactory.entrySet().stream().forEach(s->{
			s.getValue().close();
		});
	}
}
