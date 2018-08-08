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
import nosi.core.exception.PermissionException;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Config_env;

public class HibernateUtils {

	private static StandardServiceRegistry registry= null;
	private static final Map<String,SessionFactory> sessionFactory = new HashMap<>();

	public static SessionFactory getSessionFactory(Config_env config_env) {
		if (config_env != null && config_env.getApplication()!=null)
			return getSessionFactory(config_env.getName(),config_env.getApplication().getDad());
		return getSessionFactory(new Config().getBaseConnection(),Core.getCurrentDadParam());
	}

	public static SessionFactory getSessionFactory(String connectionName) {
		return getSessionFactory(connectionName,Core.getCurrentDadParam());
	}
	
	public static SessionFactory getSessionFactory(String connectionName,String dad) {
		if(Core.isNotNull(connectionName)) {			
			Config cf = new Config();
			String connectionName_ = cf.getBaseConnection();
			if(!connectionName.equalsIgnoreCase(cf.getBaseConnection())) {
				connectionName_ = connectionName+"."+dad;
			}
			if (!sessionFactory.containsKey(connectionName_)) {
				registry = buildConfig(cf,connectionName,dad);
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

	private static StandardServiceRegistry buildConfig(Config cf,String connectionName,String dad) {
		StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
		try {
			if (cf.getBaseConnection().equalsIgnoreCase(connectionName)) {
				registryBuilder.configure("/" + connectionName + ".cfg.xml");
				registryBuilder.applySettings(getIGRPSettings(connectionName));
			}else {
				Map<String, Object> settings = getOthersAppSettings(cf,connectionName,dad);
				if(settings!=null) {
					registryBuilder.configure("/" + connectionName + "." + dad + ".cfg.xml");
					registryBuilder.applySettings(settings);
				}else {
					return null;
				}
			}
		}catch(org.hibernate.internal.util.config.ConfigurationException e) {
			throw new PermissionException("Acesso nao permitido");
		}
		return  registryBuilder.build();
	}

	private static Map<String, Object> getOthersAppSettings(Config cf,String connectionName, String dad) {
		Config_env config = new Config_env().find()
				.andWhere("name", "=", connectionName)
				.andWhere("application.dad", "=",dad)
				.one();
		if (config != null) {			
			String url = getUrl(
						Core.decrypt(config.getType_db(), cf.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getHost(), cf.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getPort(), cf.SECRET_KEY_ENCRYPT_DB),
						Core.decrypt(config.getName_db(), cf.SECRET_KEY_ENCRYPT_DB)
					);
			String driver = getDriver(Core.decrypt(config.getType_db(), cf.SECRET_KEY_ENCRYPT_DB));
			String password = Core.decrypt(config.getPassword(), cf.SECRET_KEY_ENCRYPT_DB);
			String user = Core.decrypt(config.getUsername(), cf.SECRET_KEY_ENCRYPT_DB);
			String hibernateDialect = getHibernateDialect(Core.decrypt(config.getType_db(), cf.SECRET_KEY_ENCRYPT_DB));
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
		String url = getUrl(config.getType_db(), config.getHost(), "" + config.getPort(), config.getName_db());
		String driver = getDriver(config.getType_db());
		String password = config.getPassword();
		String user = config.getUsername();
		String hibernateDialect = getHibernateDialect(config.getType_db());
		return getSettings(driver, url, user, password, hibernateDialect);
	}

	private static Map<String, Object> getSettings(String driver,String url,String user,String password,String hibernateDialect) {
		Map<String, Object> settings = getBaseSettings(driver, url, user, password, hibernateDialect);	
		//Hibernate config
		settings.put(Environment.HBM2DDL_AUTO, "update");
        settings.put("hibernate.connection.isolation", "2");
        settings.put("hibernate.current_session_context_class","org.hibernate.context.internal.ThreadLocalSessionContext");
        settings.put("hibernate.transaction.auto_close_session", "true");
        
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
			case "mssql":
				return "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			case "hsqldb":
				return "org.hsqldb.jdbcDriver";
			case "sybase":
				return "com.sybase.jdbc3.jdbc.SybDriver";
			case "derby":
				return "org.apache.derby.jdbc.EmbeddedDriver";
			case "ibm":
				return "com.ibm.db2.jcc.DB2Driver";
			case "informix":
				return "com.informix.jdbc.IfxDriver";
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
			case "mssql":
				return "jdbc:sqlserver://" + host + ":" + port + ";databaseName=" + db_name;
			case "hsqldb":
				return "jdbc:hsqldb:" + host + ":" + db_name;
			case "sybase":
				return "jdbc:sybase:Tds:" + host + ":" + port + "/" + db_name;
			case "derby":
				return "jdbc:derby:" + host + "/" + db_name + ";create=true";
			case "ibm":
				return "jdbc:db2://" + host + ":" + port +"/" + db_name;
			case "informix":
				return "jdbc:informix-sqli://" + host + ":" + port + "/" + db_name; //+ ":INFORMIXSERVER=demo_on";
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
			case "mssql":
				return "org.hibernate.dialect.SQLServerDialect";
			case "hsqldb":
				return "org.hibernate.dialect.HSQLDialect";
			case "sybase":
				return "org.hibernate.dialect.SybaseDialect";
			case "derby":
				return "org.hibernate.dialect.DerbyDialect";
			case "ibm":
				return "org.hibernate.dialect.DB2Dialect";
			case "informix":
				return "org.hibernate.dialect.InformixDialect";
		}
		return "";
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
