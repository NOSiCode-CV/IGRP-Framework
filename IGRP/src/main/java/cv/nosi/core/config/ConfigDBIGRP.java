package cv.nosi.core.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringReader;
import java.util.Iterator;
import java.util.Properties;

import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cv.nosi.core.webapp.ie.import_export_v2.common.Path;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.dao.SaveMapeamentoDAO;
import cv.nosi.core.webapp.util.helpers.file.FileHelper;

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
	private static final ConfigDBIGRP CONFIG_DB_IGRP = new ConfigDBIGRP();
	private static final String FILE_NAME_IGRP_CONNECTION_CONFIG = "db_igrp_config.xml";
	private static final String FILE_NAME_IGRP_CONNECTION_CONFIG_H2 = "db_igrp_config_h2.xml";
	public static final String FILE_NAME_HIBERNATE_IGRP_CONFIG = "hibernate-igrp-core";
	//Default configuration for h2
	private ConfigDBIGRP() {
		this.driverConnection = "";
		this.driverConnection = "";
		this.type_db = "h2";
		this.username = "root";
		this.password = "root";
		this.name = FILE_NAME_HIBERNATE_IGRP_CONFIG;
		this.fileName = FILE_NAME_IGRP_CONNECTION_CONFIG;
		this.path = new Config().getBasePathConfig()+"/"+"db"+"/";
	}
	
	public static ConfigDBIGRP getInstance() {
		return CONFIG_DB_IGRP;
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
		if(Core.isNotNull(this.path) && FileHelper.fileExists(this.path)){
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
  
	public void loadIGRPConnectionConfig() throws Exception{
		this.load(FILE_NAME_IGRP_CONNECTION_CONFIG);
	}
	
	public void loadIGRPConnectionConfigH2() throws Exception{
		this.load(FILE_NAME_IGRP_CONNECTION_CONFIG_H2);
	}
	
	private void load(String fileName) throws Exception {
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
	
	//Update de URL no ficheiro cfg.xml para conecção dinâmina com a base de dados IGRP Web Doc H2.
	
	  public static boolean updateHibernateConfigFileOfApp(String connectionName) { 
			boolean success = false;
			try {
				String fileName = connectionName + ".cfg.xml"; 
				String path = new Config().getPathConexao() ; 
				String connectionURL =	"jdbc:h2:file:"+Path.getRootPath()+"tutorial"+File.separator+"igrpweb_doc;AUTO_SERVER=TRUE";
				String cfgFileContent = SaveMapeamentoDAO.getHibernateConfig(path + File.separator + fileName); 
				String fgFileContent = processHibernateConfigFileXml(cfgFileContent, connectionURL); 
				if(fgFileContent != null && !fgFileContent.isEmpty()) 
					success = saveFiles(fileName, fgFileContent, path); 
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			return success;
		}
		
		private static String processHibernateConfigFileXml(String xmlInput, String Url) {
			String xmlOutput = null; 
			try {
			//   Document originalDoc = new SAXReader().read(new StringReader("<root><given></given></root>")); 
				 org.dom4j.Document  doc = new SAXReader().read(new StringReader(xmlInput)); 
				Element root = doc.getRootElement();

				    // iterate through child elements of root
				    Iterator<Element> i = root.elementIterator("session-factory"); 
				    if(i.hasNext()) { 
				    	Element element = (Element) i.next(); 
				    	   Iterator<Element> j = element.elementIterator(); 
				    	   while(j.hasNext()) { 
				    		   Element property = (Element) j.next(); 
				    		   String attr_name = property.attributeValue("name");
				    		   if(attr_name != null) {
				    			   if(attr_name.equals("hibernate.connection.url")) 
				    				   property.setText(Url);
				    			    }
				    	   }
				    }
				    xmlOutput = doc.asXML();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return xmlOutput;
		}
		
		private static boolean saveFiles(String fileName,String content,String path) throws IOException {
			boolean flag = false;
			if(Core.isNotNull(content)) {
				flag = FileHelper.save(path, fileName, content);
			}
			return flag;
		}

	
}
