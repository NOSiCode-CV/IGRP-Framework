package nosi.core.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.exception.GenericJDBCException;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.DatabaseConfigHelper;
import nosi.core.webapp.helpers.FileHelper;

/**
 * @author: Emanuel Pereira
 * 15 Sep 2017
 */
public class ConfigDBIGRP {

	private String urlConnection;
	private String driverConnection;
	private String type_db;
	private String username;
	private String password;
	private String name;
	private String fileName;
	private String path;
	
	//Default configuration for h2
	public ConfigDBIGRP() {
		this.driverConnection = "";
		this.driverConnection = "";
		this.type_db = "h2";
		this.username = "root";
		this.password = "root";
		this.name = "hibernate-igrp-core";
		this.fileName = "db_igrp_config.xml";
		this.path = new Config().getBasePathConfig()+"/"+"db"+"/";
	}
	
	public boolean save(){
		boolean r = true;
		try {
			File file = new File(getClass().getClassLoader().getResource(path+fileName).getFile().replaceAll("%20", " "));
			FileOutputStream out = new FileOutputStream(file);
			this.generateConfig().storeToXML(out, "store config igrp database");
			out.close();				
			r = this.saveIntoWorkSpace();
		} catch (IOException e) {
			r = false;
			e.printStackTrace();
		}
		return r;
	}
	
	//Save config connection into worksapce
	public boolean saveIntoWorkSpace(){
		boolean r = true;
		this.path = new Config().getWorkspace();
		if(FileHelper.fileExists(this.path)){
			try {				
				this.path +=File.separator+ new Config().getResourcesConfigDB();			
				File file = new File(path+fileName);
				FileOutputStream out = new FileOutputStream(file);
				this.generateConfig().storeToXML(out, "store config igrp database");
				out.close();			
			} catch (IOException e) {
				r = false;
				e.printStackTrace();
			}
		}
		return r;
	}
  
	public void load() throws Exception{
		this.load(this.fileName);
	}
	
	public void load(String fileName) throws Exception {
		File file = new File(getClass().getClassLoader().getResource(path+fileName).getFile().replaceAll("%20", " "));
		FileInputStream fis = null;
				Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;
			throw new Exception("Databse failed");
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if(props!=null){
			this.type_db = props.getProperty("type_db");
			this.username = props.getProperty("username");
			this.password = props.getProperty("password");
			this.name = props.getProperty("connectionName");
			this.driverConnection = props.getProperty("driverConnection");
			this.urlConnection = props.getProperty("urlConnection");
		}
	}

	private Properties generateConfig(){
		Properties props = new Properties();
		props.setProperty("type_db", this.type_db);
		props.setProperty("username", this.username);
		props.setProperty("password", this.password);
		props.setProperty("connectionName", this.name);
		props.setProperty("driverConnection", this.driverConnection);
		props.setProperty("urlConnection", this.urlConnection);
		return props;
	}

	public String getType_db() {
		return type_db;
	}
	public void setType_db(String type_db) {
		this.type_db = type_db;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
		
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getUrlConnection() {
		return urlConnection;
	}

	public void setUrlConnection(String urlConnection) {
		this.urlConnection = urlConnection;
	}

	public String getDriverConnection() {
		return driverConnection;
	}

	public void setDriverConnection(String driverConnection) {
		this.driverConnection = driverConnection;
	}
	
	
	@Override
	public String toString() {
		return "ConfigDBIGRP [urlConnection=" + urlConnection + ", driverConnection=" + driverConnection + ", type_db="
				+ type_db + ", username=" + username + ", password=" + password + ", name=" + name + ", fileName="
				+ fileName + ", path=" + path + "]";
	}

	public boolean validate() {
    	return this.validate(this.getUrlConnection(), this.getDriverConnection());
	}
	
	public boolean validate(String url,String driver) {
		String hibernateDialect = DatabaseConfigHelper.getHibernateDialect(this.getType_db());
    	Map<String, Object> settings = HibernateUtils.getBaseSettings(driver, url, this.getUsername(), this.getPassword(), hibernateDialect);        
    	StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
		registryBuilder.configure("/" + this.getName() + ".cfg.xml");
		registryBuilder.applySettings(settings);
		StandardServiceRegistry registry = registryBuilder.build();
		MetadataSources sources = new MetadataSources(registry);
		
    	boolean isConnected = false;
    	try{	
    		Metadata metadata = sources.getMetadataBuilder().build();	
    		SessionFactory sf = metadata.getSessionFactoryBuilder().build();
    		sf.close();
    		StandardServiceRegistryBuilder.destroy(registry);
			isConnected = true;
    	}catch(Exception e){
    		e.printStackTrace();
    		try {
	    		final String errormessage = ((GenericJDBCException) e.getCause()).getSQLException().getMessage();
				Core.setMessageError("SqlExceptionHelper - "+errormessage.substring(7, errormessage.indexOf("Location:")));
			}catch(Exception e1) {
				e1.printStackTrace();
				Core.setMessageError("SqlExceptionHelper - "+(e1.getCause()!=null && e1.getCause().getCause()!= null?e1.getCause().getCause().getMessage():""));
    		}
    		isConnected = false;
    	}
    	return isConnected;
	}
}
