package nosi.core.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.webapp.helpers.FileHelper;

/**
 * @author: Emanuel Pereira
 * 15 Sep 2017
 */
public class ConfigDBIGRP {

	private int port;
	private String type_db;
	private String host;
	private String name_db;
	private String username;
	private String password;
	private String name;
	private String fileName;
	private String path;
	
	//Default configuratio for h2
	public ConfigDBIGRP() {
		this.port = 0;
		this.type_db = "h2";
		this.host = "~";
		this.name_db = "db_igrp_core";
		this.username = "root";
		this.password = "root";
		this.name = "hibernate-igrp-core";
		this.fileName = "db_igrp_config.xml";
		this.path = Config.getBasePathConfig()+"db";
	}
	
	public void save(){
		try {
			FileHelper.createDiretory(this.path);
			File file = new File(this.path+File.separator+this.fileName);
			FileOutputStream out = new FileOutputStream(file);
			this.generateConfig().storeToXML(out, "store config igrp database");
			out.close();	
			this.saveIntoWorkSpace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//Save config connection into worksapce
	public void saveIntoWorkSpace(){
		this.path = Config.getWorkspace();
		if(FileHelper.fileExists(this.path)){
			try {
				this.path +=File.separator+"WebContent"+File.separator+"WEB-INF"+File.separator+"config"+File.separator+"db";
				FileHelper.createDiretory(this.path);
				File file = new File(this.path+File.separator+this.fileName);
				FileOutputStream out = new FileOutputStream(file);
				this.generateConfig().storeToXML(out, "store config igrp database");
				out.close();			
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public void load(){
		File file = new File(this.path+File.separator+this.fileName);
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
			this.save();
			this.load();
			return;
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
			this.port = Integer.parseInt(props.getProperty("port"));
			this.type_db = props.getProperty("type_db");
			this.host = props.getProperty("hostname");
			this.name_db = props.getProperty("dbname");
			this.username = props.getProperty("username");
			this.password = props.getProperty("password");
			this.name = props.getProperty("connectionName");
		}
	}
	
	private Properties generateConfig(){
		Properties props = new Properties();
		props.setProperty("port", ""+this.port);
		props.setProperty("type_db", this.type_db);
		props.setProperty("hostname", this.host);
		props.setProperty("dbname", this.name_db);
		props.setProperty("username", this.username);
		props.setProperty("password", this.password);
		props.setProperty("connectionName", this.name);
		return props;
	}

	public int getPort() {
		return port;
	}
	public void setPort(int port) {
		this.port = port;
	}
	public String getType_db() {
		return type_db;
	}
	public void setType_db(String type_db) {
		this.type_db = type_db;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getName_db() {
		return name_db;
	}
	public void setName_db(String name_db) {
		this.name_db = name_db;
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

	@Override
	public String toString() {
		return "ConfigDBIGRP [port=" + port + ", type_db=" + type_db + ", host=" + host + ", name_db="
				+ name_db + ", username=" + username + ", password=" + password + ", name=" + name + ", fileName="
				+ fileName + ", path=" + path + "]";
	}

	public boolean validate() {
		String url = PersistenceUtils.getUrl(this.getType_db(),this.getHost(),this.getPort(), this.getName_db());
		Configuration cfg = new Configuration();
    	cfg.configure("/"+this.getName()+".cfg.xml");
    	String driver = PersistenceUtils.getDriver(this.getType_db());
    	cfg.getProperties().setProperty("hibernate.connection.driver_class", driver);
    	cfg.getProperties().setProperty("hibernate.connection.password",this.getPassword());
    	cfg.getProperties().setProperty("hibernate.connection.username",this.getUsername());
    	cfg.getProperties().setProperty("hibernate.connection.url",url);
    	cfg.getProperties().setProperty("current_session_context_class","thread");
    	boolean isConnected = false;
    	try{
			SessionFactory sf = cfg.buildSessionFactory();	
			sf.close();
			isConnected = true;
    	}catch(Exception e){
    		isConnected = false;
    	}
    	return isConnected;
	}
	
	
}
