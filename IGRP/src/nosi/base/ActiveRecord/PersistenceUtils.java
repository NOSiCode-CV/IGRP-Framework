package nosi.base.ActiveRecord;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import nosi.core.config.DbInfo;
import nosi.core.webapp.Igrp;

//import nosi.core.config.Config;

/**
 * @author Emanuel Pereira
 * 4 Jul 2017
 */
public class PersistenceUtils {
	public static Map<String,EntityManagerFactory> ENTITY_MANAGER_FACTORY = new HashMap<>();	
	static{
			init();
	}
	
	public static void init(){
		for(DbInfo dbI:Igrp.getInstance().getDbConfig().getDbInfo()){
			Map<String,String> properties = new HashMap<>();
			String url = getUrl(dbI.getDbmsName(),dbI.getHostName(),dbI.getPort(), dbI.getDbName());
			System.out.println("url:"+url);
			properties.put("javax.persistence.jdbc.url",url);
		    properties.put("javax.persistence.jdbc.user",dbI.getUser());
		    properties.put("javax.persistence.jdbc.password",dbI.getPassword());
		    properties.put("hibernate.hbm2ddl.auto", "update");
			ENTITY_MANAGER_FACTORY.put(dbI.getConnectionName(), Persistence.createEntityManagerFactory(dbI.getConnectionName(),properties));
		}
	}
	public static String getUrl(String type,String host,int port,String db_name){
		switch (type) {
			case "h2":			
				return "jdbc:h2:"+host+"/"+db_name;
			case "mysql":			
				return "jdbc:mysql://"+host+":"+port+"/"+db_name;
			case "postgresql":			
				return "jdbc:postgresql://"+host+":"+port+"/"+db_name;
			case "oracle":
				return "jdbc:oracle:"+host+":"+port+":"+db_name;
		}
		return "jdbc:h2:./WebContent/WEB-INF/config/db/"+db_name;
	}
}
