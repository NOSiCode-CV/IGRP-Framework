package nosi.base.ActiveRecord;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Config_env;

/**
 * @author Emanuel Pereira
 * 4 Jul 2017
 */
public class PersistenceUtils {
	
	private static Map<String,SessionFactory> SESSION_FACTORY = new HashMap<>();
	
	public static SessionFactory getSessionFactory(String connectionName) {
      if (!SESSION_FACTORY.containsKey(connectionName)) {
         try {
    		System.out.println("Config for:"+connectionName);
    		Configuration configuration = getConfiguration(connectionName);
    		if(configuration!=null) {
    			SessionFactory sf = configuration.buildSessionFactory();		
    			SESSION_FACTORY.put(connectionName, sf);	  
    		}else {
    			return null;
    		}
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      return SESSION_FACTORY.get(connectionName);
	 }

	public static Configuration getConfiguration(String connectionName) {
		String url = null;
        String driver = null;
        String password = null;
        String user = null;
		  if("hibernate-igrp-core".equalsIgnoreCase(connectionName)) {
            	ConfigDBIGRP config = new ConfigDBIGRP();
    			config.load();
    			url = getUrl(config.getType_db(),config.getHost(),""+config.getPort(), config.getName_db());
    			driver = getDriver(config.getType_db());
    			password = config.getPassword();
    			user = config.getUsername();
            }else{
            	Config_env config = new Config_env().find().andWhere("name", "=",connectionName).one();
            	if(config!=null) {
            		url = getUrl(Core.decrypt(config.getType_db()),Core.decrypt(config.getHost()),Core.decrypt(config.getPort()), Core.decrypt(config.getName_db()));
    				driver = getDriver(Core.decrypt(config.getType_db()));
	    			password = Core.decrypt(config.getPassword());
	    			user = Core.decrypt(config.getUsername());
            	}
            }
    		Configuration cfg = new Configuration();
        	cfg.configure("/"+connectionName+".cfg.xml");	        
        	cfg.getProperties().setProperty("hibernate.connection.driver_class", driver);
        	cfg.getProperties().setProperty("hibernate.connection.password",password);
        	cfg.getProperties().setProperty("hibernate.connection.username",user);
        	cfg.getProperties().setProperty("hibernate.connection.url",url);
        	cfg.getProperties().setProperty("current_session_context_class","thread");
        	cfg.getProperties().setProperty("hibernate.hbm2ddl.auto","update");
        	cfg.getProperties().setProperty("hibernate.c3p0.min_size","5");
        	cfg.getProperties().setProperty("hibernate.c3p0.max_size","20");
        	cfg.getProperties().setProperty("hibernate.c3p0.timeout","6000");
        	cfg.getProperties().setProperty("hibernate.c3p0.max_statements","50");
        	cfg.getProperties().setProperty("hibernate.c3p0.idle_test_period","3000");
        	
        	// Go to http://www.mchange.com/projects/c3p0/#configuring_to_debug_and_workaround_broken_clients 
        	// For memory leak prevention and bad clients ... 
        	cfg.getProperties().setProperty("hibernate.c3p0.unreturnedConnectionTimeout","300"); // 300 sceonds 
        	cfg.getProperties().setProperty("hibernate.c3p0.debugUnreturnedConnectionStackTraces","true"); 
        	cfg.getProperties().setProperty("hibernate.c3p0.contextClassLoaderSource","library"); 
        	cfg.getProperties().setProperty("hibernate.c3p0.privilegeSpawnedThreads","true"); 
        	
        return cfg;
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
		
		public static String getUrl(String type,String host,String port,String db_name){
			switch (type) {
				case "h2":			
					return host.equalsIgnoreCase("mem")?("jdbc:h2:"+host+":"+db_name):("jdbc:h2:"+host+"/"+db_name);
				case "mysql":			
					return "jdbc:mysql://"+host+":"+port+"/"+db_name;
				case "postgresql":			
					return "jdbc:postgresql://"+host+":"+port+"/"+db_name;
				case "oracle":
					return "jdbc:oracle:thin:@"+host+":"+port+"/"+db_name;
			}
			return "";
		}
		
	public static void destroy() {
		Iterator<SessionFactory> i = PersistenceUtils.SESSION_FACTORY.values().iterator();
		while(i.hasNext()) { 
			SessionFactory sf = i.next(); 
			if(sf.isOpen())
				sf.close();
		} 
		PersistenceUtils.SESSION_FACTORY.clear();
		System.out.println("Destroyed  ");
	}
}
