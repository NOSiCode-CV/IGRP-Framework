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
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.exception.PermissionException;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.webapps.igrp.dao.Config_env;

public class HibernateUtils {

	private static StandardServiceRegistry registry= null;
	private static final Map<String,SessionFactory> sessionFactory = new HashMap<>();

	public static SessionFactory getSessionFactory(Config_env config_env) {
		if (config_env != null && config_env.getApplication()!=null)
			return getSessionFactory(config_env.getName(),config_env.getApplication().getDad());
		return getSessionFactory(new ConfigApp().getBaseConnection(),Core.getCurrentDadParam());
	}

	public static SessionFactory getSessionFactory(String connectionName) {
		return getSessionFactory(connectionName,Core.getCurrentDadParam());
	}
	
	public static SessionFactory getSessionFactory(String connectionName,String dad) {
		if(Core.isNotNull(connectionName)) {		
			String connectionName_ = new ConfigApp().getBaseConnection();
			if(!connectionName.equalsIgnoreCase(new ConfigApp().getBaseConnection()) && !connectionName.equalsIgnoreCase(new ConfigApp().getH2IGRPBaseConnection())) {
				connectionName_ = connectionName+"."+dad;
			}
			if (!sessionFactory.containsKey(connectionName_)) {
				registry = buildConfig(connectionName,dad);
				if(registry!=null) {
					try {
						MetadataSources sources = new MetadataSources(registry);
						Metadata metadata = sources.getMetadataBuilder().build();
						sessionFactory.put(connectionName_,metadata.getSessionFactoryBuilder().build());
					} catch (Exception e) {
						e.printStackTrace();
						destroy();
					}
				}else {
					throw new PermissionException("Acesso nao permitido");
				}
			}
			return sessionFactory.get(connectionName_);
		}
		return null;
	}

	private static StandardServiceRegistry buildConfig(String connectionName,String dad) {
		StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
		try {
			if (new ConfigApp().getBaseConnection().equalsIgnoreCase(connectionName)) {
				registryBuilder.configure("/" + connectionName + ".cfg.xml");
				registryBuilder.applySettings(getIGRPSettings(connectionName));
			}else if (new ConfigApp().getH2IGRPBaseConnection().equalsIgnoreCase(connectionName)) {
				registryBuilder.configure("/" + connectionName + ".cfg.xml");
				registryBuilder.applySettings(getH2IGRPSettings(connectionName));
			}else {
				Map<String, Object> settings = getOthersAppSettings(connectionName,dad);
				if(settings!=null) {
					registryBuilder.configure("/" + connectionName + "." + dad + ".cfg.xml");
					registryBuilder.applySettings(settings);
				}else {
					return null;
				}
			}
		}catch(org.hibernate.internal.util.config.ConfigurationException e) {
			Core.setMessageError(e.getMessage());
			throw new PermissionException("Acesso nao permitido");
		}
		return  registryBuilder.build();
	}

	private static Map<String, Object> getH2IGRPSettings(String connectionName) {
		ConfigDBIGRP config = new ConfigDBIGRP();
		try {
			config.load("db_igrp_config_h2.xml");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(config.getType_db());
		return getSettings(config.getDriverConnection(), config.getUrlConnection(), config.getUsername(), config.getPassword(), hibernateDialect);
	}

	private static Map<String, Object> getOthersAppSettings(String connectionName, String dad) {
		Config_env config = new Config_env().find()
				.andWhere("name", "=", connectionName)
				.andWhere("application.dad", "=",dad)
				.one();
		if (config != null) {	
			EncrypDecrypt ed = new EncrypDecrypt();
			String url = Core.isNotNull(config.getUrl_connection())? Core.decrypt(config.getUrl_connection(),ed.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getUrl(
						Core.decrypt(config.getType_db(), ed.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getHost(), ed.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getPort(), ed.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getName_db(), ed.SECRET_KEY_ENCRYPT_DB)
					);
			String driver = Core.isNotNull(config.getDriver_connection())? Core.decrypt(config.getDriver_connection(),ed.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getDatabaseDriversExamples(Core.decrypt(config.getType_db(), ed.SECRET_KEY_ENCRYPT_DB));
			String password = Core.decrypt(config.getPassword(), ed.SECRET_KEY_ENCRYPT_DB);
			String user = Core.decrypt(config.getUsername(), ed.SECRET_KEY_ENCRYPT_DB);
			String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(Core.decrypt(config.getType_db(), ed.SECRET_KEY_ENCRYPT_DB));
			return getSettings(driver, url, user, password, hibernateDialect);
		}
		return null;
	}

	private static Map<String, Object> getIGRPSettings(String connectionName) {
		ConfigDBIGRP config = new ConfigDBIGRP();
		try {
			config.load();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(config.getType_db());
		return getSettings(config.getDriverConnection(), config.getUrlConnection(), config.getUsername(), config.getPassword(), hibernateDialect);
	}

	private static Map<String, Object> getSettings(String driver,String url,String user,String password,String hibernateDialect) {
		Map<String, Object> settings = getBaseSettings(driver, url, user, password, hibernateDialect);	
		//Hibernate config
		settings.put(Environment.HBM2DDL_AUTO, "update");
        settings.put("hibernate.connection.isolation", "2");
        settings.put("hibernate.current_session_context_class","org.hibernate.context.internal.ThreadLocalSessionContext");
        settings.put("hibernate.transaction.auto_close_session", "true");
//        settings.put("connection.pool_size", "30");
		// HikariCP settings (values in milliseconds)
//		ConfigHikariCP cHCp = new ConfigHikariCP();
//		
        //c3p0 config
//		settings.put("hibernate.c3p0.min_size",cHCp.getMinimumIdle());
//    	settings.put("hibernate.c3p0.max_size",cHCp.getMaximumPoolSize()); 	
//    	settings.put("hibernate.c3p0.timeout",cHCp.getConnectionTimeout());
//    	settings.put("hibernate.c3p0.max_statements","50");
//    	settings.put("hibernate.connection.provider_class","org.hibernate.connection.C3P0ConnectionProvider");
//    	settings.put("hibernate.c3p0.idle_test_period","10"); // 10s 	
//    	settings.put("hibernate.c3p0.acquire_increment", "2");//    	
//    	// Ensure that all idle connections are closed in 25s 
//    	settings.put("hibernate.c3p0.maxIdleTime",cHCp.getIdleTimeout()); // 25s to close all unused connection 
//    	settings.put("hibernate.c3p0.maxIdleTimeExcessConnections","20"); // aggressively ... close all unused connection 20s //    	
//    	// Go to http://www.mchange.com/projects/c3p0/#configuring_to_debug_and_workaround_broken_clients 
//    	// For memory leak prevention and bad clients ... 
//    	settings.put("hibernate.c3p0.unreturnedConnectionTimeout","1000"); // ... increase the timeout ... 
//    	settings.put("hibernate.c3p0.debugUnreturnedConnectionStackTraces","true"); 
//    	settings.put("hibernate.c3p0.contextClassLoaderSource","library"); 
//    	settings.put("hibernate.c3p0.privilegeSpawnedThreads","true"); 
    	
       //hickaricp config

//        settings.put("hibernate.connection.provider_class", "org.hibernate.hikaricp.internal.HikariCPConnectionProvider");
//		//Maximum waiting time for a connection from the pool. 
//		settings.put("hibernate.hikari.connectionTimeout",cHCp.getConnectionTimeout());
//		//Maximum time that a connection is allowed to sit ideal in the pool
//		settings.put("hibernate.hikari.idleTimeout", cHCp.getIdleTimeout());	
//		//Minimum number of ideal connections in the pool
//		settings.put("hibernate.hikari.minimumIdle",cHCp.getMinimumIdle());
//		//Maximum number of actual connection in the pool
//		settings.put("hibernate.hikari.maximumPoolSize", cHCp.getMaximumPoolSize());
//		//Maximum lifetime of a connection in the pool
//		settings.put("hibernate.hikari.maxLifetime", cHCp.getMaxLifetime());
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

	

	
	public synchronized static void destroy() {
		if (registry != null) {
			StandardServiceRegistryBuilder.destroy(registry);
			registry = null;
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

	public static void removeSessionFactory(String connectionName) {
		sessionFactory.remove(connectionName);
	}

}
