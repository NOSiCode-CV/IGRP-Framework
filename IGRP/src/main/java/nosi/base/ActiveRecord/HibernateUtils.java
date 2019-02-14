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
import nosi.core.exception.PermissionException;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.EncrypDecrypt;
import nosi.webapps.igrp.dao.Config_env;

public class HibernateUtils {

	private static ServiceRegistry registry= null;
	private static final Map<String,SessionFactory> sessionFactory = new HashMap<>();

	public static SessionFactory getSessionFactory(Config_env config_env) {
		if (config_env != null && config_env.getApplication()!=null)
			return getSessionFactory(config_env.getName(),config_env.getApplication().getDad(),null);
		return getSessionFactory(new ConfigApp().getBaseConnection(),Core.getCurrentDadParam(),null);
	}

	public static SessionFactory getSessionFactory(String connectionName,String schemaName) {
		return getSessionFactory(connectionName,Core.getCurrentDadParam(),schemaName);
	}
	
	public static SessionFactory getSessionFactory(String connectionName,String dad,String schemaName) {
		if(Core.isNotNull(connectionName)) {	
			String connectionName_ = new ConfigApp().getBaseConnection();
			if(!connectionName.equalsIgnoreCase(new ConfigApp().getBaseConnection()) && !connectionName.equalsIgnoreCase(new ConfigApp().getH2IGRPBaseConnection())) {
				connectionName_ = connectionName+"."+dad;
			}
			if (!sessionFactory.containsKey(connectionName_)) {
				registry = buildConfig(connectionName,dad,schemaName);
				MetadataSources metadataSources = new MetadataSources(registry);;
				if(registry!=null) {
					try {
						sessionFactory.put(connectionName_,metadataSources.buildMetadata().getSessionFactoryBuilder().build());
					} catch (Exception e) {
						e.printStackTrace();
						destroy();
					}finally {
				        ServiceRegistry metaServiceRegistry = metadataSources.getServiceRegistry();
				        if(metaServiceRegistry instanceof BootstrapServiceRegistry ) {
				            BootstrapServiceRegistryBuilder.destroy( metaServiceRegistry );
				        }
				    }
				}else {
					throw new PermissionException("Acesso nao permitido");
				}
			}
			return sessionFactory.get(connectionName_);
		}
		return null;
	}

	private static ServiceRegistry buildConfig(String connectionName,String dad,String schemaName) {
		StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
		try {
			if (new ConfigApp().getBaseConnection().equalsIgnoreCase(connectionName)) {
				registryBuilder.configure("/" + connectionName + ".cfg.xml");
				registryBuilder.applySettings(getIGRPSettings(connectionName));
			}else if (new ConfigApp().getH2IGRPBaseConnection().equalsIgnoreCase(connectionName)) {
				registryBuilder.configure("/" + connectionName + ".cfg.xml");
				registryBuilder.applySettings(getH2IGRPSettings(connectionName));
			}else {
				Map<String, Object> settings = getOthersAppSettings(connectionName,dad,schemaName);
				if(settings!=null) {
					registryBuilder.configure("/" + connectionName + "." + dad + ".cfg.xml");
					if(registryBuilder!=null)
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
		return getSettings(config.getDriverConnection(), config.getUrlConnection(), config.getUsername(), config.getPassword(), hibernateDialect,null);
	}

	private static Map<String, Object> getOthersAppSettings(String connectionName, String dad,String schemaName) {
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
			return getSettings(driver, url, user, password, hibernateDialect,schemaName);
		}
		return null;
	}

	private static Map<String, Object> getIGRPSettings(String connectionName) {
		ConfigDBIGRP config = new ConfigDBIGRP();
		try {
			config.load();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(config.getType_db());
		return getSettings(config.getDriverConnection(), config.getUrlConnection(), config.getUsername(), config.getPassword(), hibernateDialect,null);
	}

	private static Map<String, Object> getSettings(String driver,String url,String user,String password,String hibernateDialect,String schemaName) {
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
			//suspense pool
			settings.put("allowPoolSuspension", cHCp.getAllowPoolSuspension());
			//It releases the connection after org.hibernate.Transaction commit or rollback.
			if(Core.isNotNull(cHCp.getRelease_mode()))
				settings.put("hibernate.connection.handling_mode", cHCp.getRelease_mode());
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
//		sessionFactory.entrySet().stream().forEach(s->{
//			s.getValue().close();
//		});
	}

	public static void removeSessionFactory(String connectionName) {
//		sessionFactory.remove(connectionName);
	}

}
