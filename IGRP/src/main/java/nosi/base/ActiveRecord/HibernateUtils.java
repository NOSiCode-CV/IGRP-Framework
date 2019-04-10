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
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.BootstrapServiceRegistry;
import org.hibernate.boot.registry.BootstrapServiceRegistryBuilder;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp.dao.Config_env;

public class HibernateUtils {

	private static ServiceRegistry registry= null;
	private static final Map<String,SessionFactory> SESSION_FACTORY = new HashMap<>();

	public static SessionFactory getSessionFactory(Config_env config_env) {
		if (config_env != null && config_env.getApplication()!=null)
			return getSessionFactory(config_env.getName(),config_env.getApplication().getDad(),null);
		return getSessionFactory(ConfigApp.getInstance().getBaseConnection(),Core.getCurrentDadParam(),null);
	}

	public static SessionFactory getSessionFactory(String connectionName,String schemaName) {
		return getSessionFactory(connectionName,Core.getCurrentDadParam(),schemaName);
	}
	
	public static SessionFactory getSessionFactory(String connectionName,String dad,String schemaName) {
		String myConnectionName = resolveHibernateFileName(connectionName, dad);
		if (!SESSION_FACTORY.containsKey(myConnectionName)) {
			MetadataSources metadataSources = null;
			try {
				registry = buildConfig(connectionName,myConnectionName,dad);
				metadataSources = new MetadataSources(registry);
				SESSION_FACTORY.put(myConnectionName, metadataSources.buildMetadata().getSessionFactoryBuilder().build());
			} catch (Throwable ex) {
				SESSION_FACTORY.remove(myConnectionName);
				System.err.println("Initial SessionFactory creation failed." + ex);
				Core.log(ex.getMessage());
				throw new ExceptionInInitializerError(ex);
			}finally {
		        ServiceRegistry metaServiceRegistry = metadataSources.getServiceRegistry();
		        if(metaServiceRegistry instanceof BootstrapServiceRegistry ) {
		            BootstrapServiceRegistryBuilder.destroy(metaServiceRegistry );
		        }
		    }
		}
		return SESSION_FACTORY.get(myConnectionName);	
	}
	
	private static ServiceRegistry buildConfig(String connectionName,String myConnectionName,String dad) {
		StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
		try{
			registryBuilder.configure(myConnectionName+".cfg.xml");
			registryBuilder.applySettings(hibernateSettings(registryBuilder, connectionName, dad));
		}catch(org.hibernate.internal.util.config.ConfigurationException e) {
			e.printStackTrace();
		}
		return  registryBuilder.build();
	}
	
	private static String resolveHibernateFileName(String connectionName,String dad) {
		if(!connectionName.equalsIgnoreCase(ConfigApp.getInstance().getBaseConnection()) && !connectionName.equalsIgnoreCase(ConfigApp.getInstance().getH2IGRPBaseConnection())) {
			connectionName = connectionName+"."+dad;
		}
		return connectionName;
	}
	
	private static Map<String, Object> hibernateSettings(StandardServiceRegistryBuilder registryBuilder,String connectionName,String dad){
		ConfigApp config = ConfigApp.getInstance();
		if (config.getBaseConnection().equalsIgnoreCase(connectionName)) {
			return getIGRPSettings(registryBuilder,connectionName);
		}else if (config.getH2IGRPBaseConnection().equalsIgnoreCase(connectionName)) {
			return getH2IGRPSettings(config,registryBuilder,connectionName);
		}else {
			return getOthersAppSettings(registryBuilder,connectionName,dad);
		}
	}
	
	private static Map<String, Object> getH2IGRPSettings(ConfigApp configApp,StandardServiceRegistryBuilder registryBuilder,String connectionName) {
		ConfigDBIGRP config = ConfigDBIGRP.getInstance();
		try {
			config.loadIGRPConnectionConfigH2();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(config.getType_db());
		return getSettings(registryBuilder,config.getDriverConnection(), config.getUrlConnection(), config.getUsername(), config.getPassword(), hibernateDialect,null);
	}

	private static Map<String, Object> getOthersAppSettings(StandardServiceRegistryBuilder registryBuilder,String connectionName, String dad) {
		Config_env config = new Config_env().find()
				.andWhere("name", "=", connectionName)
				.andWhere("application.dad", "=",dad)
				.one();
		if (config != null) {	
			String url = Core.isNotNull(config.getUrl_connection())? Core.decrypt(config.getUrl_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getUrl(
						Core.decrypt(config.getType_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getHost(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getPort(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getName_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB)
					);
			String driver = Core.isNotNull(config.getDriver_connection())? Core.decrypt(config.getDriver_connection(),EncrypDecrypt.SECRET_KEY_ENCRYPT_DB):
				DatabaseConfigHelper.getDatabaseDriversExamples(Core.decrypt(config.getType_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			String password = Core.decrypt(config.getPassword(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
			String user = Core.decrypt(config.getUsername(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB);
			String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(Core.decrypt(config.getType_db(), EncrypDecrypt.SECRET_KEY_ENCRYPT_DB));
			return getSettings(registryBuilder,driver, url, user, password, hibernateDialect,null);
		}
		return null;
	}

	private static Map<String, Object> getIGRPSettings(StandardServiceRegistryBuilder registryBuilder,String connectionName) {
		ConfigDBIGRP config = ConfigDBIGRP.getInstance();
		try {
			config.loadIGRPConnectionConfig();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(config.getType_db());
		return getSettings(registryBuilder,config.getDriverConnection(), config.getUrlConnection(), config.getUsername(), config.getPassword(), hibernateDialect,null);
	}

	private static Map<String, Object> getSettings(StandardServiceRegistryBuilder registryBuilder,String driver,String url,String user,String password,String hibernateDialect,String schemaName) {
		Map<String, Object> settings = getBaseSettings(driver, url, user, password, hibernateDialect);	
		ConfigHikariCP cHCp = ConfigHikariCP.getInstance();
		
		//Hibernate config
		if(cHCp.getHbm2ddlAuto().isPresent()){
			//not recommended in production environment
			settings.put(Environment.HBM2DDL_AUTO,cHCp.getHbm2ddlAuto().get().toString());
		}
        settings.put("hibernate.connection.isolation",cHCp.getConnectionIsolation().orElse("2"));
        settings.put("hibernate.current_session_context_class",cHCp.getCurrentSessionContextClass().orElse("org.hibernate.context.internal.ThreadLocalSessionContext"));
        settings.put("hibernate.transaction.auto_close_session",cHCp.getAutCloseSession().orElse("true"));
        settings.put("hibernate.connection.autocommit",cHCp.getAutocommit().orElse("false"));
      
        if(cHCp.getUseConnectionPool().compareTo("true")==0) {
        	if(cHCp.getProvider_class().equals("org.hibernate.hikaricp.internal.HikariCPConnectionProvider")) {
		       //hickaricp config	        
		        settings.put("hibernate.connection.provider_class", cHCp.getProvider_class());	        
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
				//Detected leak
				settings.put("hibernate.hikari.leakDetectionThreshold", cHCp.getLeakDetectionThreshold());
        	}else if(cHCp.getProvider_class().equals("org.hibernate.connection.C3P0ConnectionProvider")) {
                settings.put("hibernate.c3p0.timeout",cHCp.getConnectionTimeout());
                settings.put("hibernate.c3p0.min_size",cHCp.getMinimumPoolSize());
                settings.put("hibernate.c3p0.max_size",cHCp.getMaximumPoolSize());
                settings.put("hibernate.c3p0.acquire_increment",cHCp.getIncrement());
        	}
			//suspense pool
			settings.put("allowPoolSuspension", cHCp.getAllowPoolSuspension());			
			settings.put("hibernate.hbm2ddl.jdbc_metadata_extraction_strategy","individually");
        }
        /**
         * Load and use custom configuration
         */
		@SuppressWarnings("unchecked")
		Map<String,Object> customSettings = registryBuilder.getAggregatedCfgXml().getConfigurationValues();
		if(customSettings!=null) {
			customSettings.entrySet().forEach(v->{
				settings.put(v.getKey(), v.getValue());
			});
		}
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
		if(SESSION_FACTORY!=null) {
			SESSION_FACTORY.entrySet().stream().forEach(s->{
				s.getValue().close();
			});
		}
	}

	public static void removeSessionFactory(String connectionName) {
		if(SESSION_FACTORY!=null) {
			SESSION_FACTORY.remove(connectionName);
		}
	}

}
