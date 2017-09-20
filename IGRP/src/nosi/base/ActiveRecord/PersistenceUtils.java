package nosi.base.ActiveRecord;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import nosi.core.config.ConfigDBIGRP;
import nosi.webapps.igrp.dao.Config_env;
import java.util.List;

/**
 * @author Emanuel Pereira
 * 4 Jul 2017
 */
public class PersistenceUtils {

	public static Map<String,SessionFactory> SESSION_FACTORY = new HashMap<>();	
	
	static{
			init();
	}
	
	public static void init(){
		ConfigDBIGRP config = new ConfigDBIGRP();
		config.load();
		String url = getUrl(config.getType_db(),config.getHost(),config.getPort(), config.getName_db());
		setConnection(config.getType_db(), config.getName(), url, config.getUsername(), config.getPassword());
	}
	
	public static void confiOtherConnections(){
		List<Config_env> configs = new Config_env().findAll();
		if(configs!=null){
			for(Config_env c:configs){
				String url = getUrl(c.getType_db(),c.getHost(),c.getPort(), c.getName_db());
				setConnection(c.getType_db(), c.getName(), url, c.getUsername(), c.getPassword());
			}
		}
	}

	public static void confiOtherConnections(String app) {
		List<Config_env> configs = new Config_env().find().andWhere("application.dad", "=", app).all();
		if(configs!=null){
			for(Config_env c:configs){
				String url = getUrl(c.getType_db(),c.getHost(),c.getPort(), c.getName_db());
				setConnection(c.getType_db(), c.getName(), url, c.getUsername(), c.getPassword());
			}
		}
	}
	
	private static void setConnection(String dbmsName,String connectioName,String url,String user,String password){
		Configuration cfg = new Configuration();
    	cfg.configure("/"+connectioName+".cfg.xml");
    	String driver = getDriver(dbmsName);
    	cfg.getProperties().setProperty("hibernate.connection.driver_class", driver);
    	cfg.getProperties().setProperty("hibernate.connection.password",user);
    	cfg.getProperties().setProperty("hibernate.connection.username",password);
    	cfg.getProperties().setProperty("hibernate.connection.url",url);
    	cfg.getProperties().setProperty("current_session_context_class","thread");
    	cfg.getProperties().setProperty("hibernate.hbm2ddl.auto","update");
		SessionFactory sf = cfg.buildSessionFactory();
		
		SESSION_FACTORY.put(connectioName, sf);
	}
	
	private static String getDriver(String type) {
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
	
	public static String getUrl(String type,String host,int port,String db_name){
		switch (type) {
			case "h2":			
				return host.equalsIgnoreCase("mem")?("jdbc:h2:"+host+":"+db_name):("jdbc:h2:"+host+"/"+db_name);
			case "mysql":			
				return "jdbc:mysql://"+host+":"+port+"/"+db_name;
			case "postgresql":			
				return "jdbc:postgresql://"+host+":"+port+"/"+db_name;
			case "oracle":
				return "jdbc:oracle:"+host+":"+port+":"+db_name;
		}
		return "";
	}
}
