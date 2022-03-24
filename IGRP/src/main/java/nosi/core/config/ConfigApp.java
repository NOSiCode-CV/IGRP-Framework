package nosi.core.config;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import nosi.core.db.migration.api.MigrationIGRPInitConfig;
import nosi.core.webapp.Core;


/**
 * Emanuel
 * 17 Jul 2018
 */
public final class ConfigApp {

	private String version;
	private String data_install;
	private String isInstallation;
	private Config config; 
	
	private Properties commonMain;
	
	private static final ConfigApp CONFIG_APP = new ConfigApp();
	
	private ConfigApp() {
		this.config = new Config();
		commonMain = this.loadConfig("common", "main.xml");
	}
	
	public static ConfigApp getInstance() {
		return CONFIG_APP;
	}
	
	public static Properties loadConfig(String fileName) { // xml to properties 
		File file = new File(fileName);
		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream(file)) {
			props.loadFromXML(fis);			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
	
	/**
	 * @deprecated (Use getMainSettings)	
	 * @return loadConfig("common", "main.xml");
	 */
	@Deprecated	
	public Properties loadCommonConfig() {
		return commonMain;
}
	public Properties loadProperties(String fileName) throws IOException {
		Properties props = new Properties();
		InputStream in = getClass().getResourceAsStream(fileName);
		if(in!=null) {
			props.load(in);
			in.close();
		}
		return props;
	}
	
	
	public Properties loadConfig(String filePath, String fileName) {
		String path = this.config.getBasePathConfig() + "/" + filePath;
		return loadConfig(this.getClass().getClassLoader().getResource(path + "/" + fileName).getPath().replace("%20", " "));
	}
	
	public String getBaseConnection() { 
		return commonMain.getProperty(ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.value(), getDefaultBaseConnectionName());
	}

	public String getDefaultBaseConnectionName() {
		return "hibernate-igrp-core";
	}
	
	public void configurationApp(){
		if(!this.isInstall()){
			MigrationIGRPInitConfig.start();
			try {
				this.save();
			} catch (IOException e) {		
				e.printStackTrace();
			}
		}
	}
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getData_install() {
		return data_install;
	}
	public void setData_install(String data_install) {
		this.data_install = data_install;
	}
	public String isInstallation() {
		return isInstallation;
	}
	public void setInstallation(String isInstallation) {
		this.isInstallation = isInstallation;
	}
	
	private void load() throws IOException {
		Properties p = this.loadProperties("/config/install/install.properties");		
			this.version = p.getProperty("version");
			this.data_install = p.getProperty("data_install");
			this.isInstallation = p.getProperty("isInstallation");
		
	}
	
	public void save() throws IOException {
		Properties p = new Properties();
		p.setProperty("version", this.config.VERSION);
		p.setProperty("data_install", Core.getCurrentDate());
		p.setProperty("isInstallation", "success");
		if(Core.isNotNull(this.getWorkspace())) {//Save in workspace eclipse
			this.saveProperties(p, this.config.getPathWorkspaceResources()+File.separator+"config"+File.separator+"install"+File.separator+"install.properties");
		}
		this.saveProperties(p, this.config.getBasePathClass()+"config"+File.separator+"install"+File.separator+"install.properties");
	}
	
	public void saveProperties(Properties p,String fileName) throws IOException {
		try(OutputStream out = new FileOutputStream(fileName)){			
			p.store(out, "");			
		}catch ( IOException e) {
			e.printStackTrace();
		  }
		
	}
	public boolean isInstall() {
		if(Core.isNull(this.isInstallation)) {
			try {
				this.load();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return Core.isNotNull(this.isInstallation);
	}
	
	public String getAutentikaUrlForSso() {
		String url = commonMain.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_AUTHORIZE.value()); 
		String redirect_uri = commonMain.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value()); 
		String client_id = commonMain.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value()); 
		url += "?response_type=code&client_id=" + client_id + "&scope=openid+email+profile&state=igrp&redirect_uri=" + redirect_uri; 
		return url;
	}
	
	public String getWorkspace(){
		return commonMain.getProperty(ConfigCommonMainConstants.IGRP_WORKSPACE.value());
	}
	
	public String getEnvironment() {
		return commonMain.getProperty(ConfigCommonMainConstants.IGRP_ENV.value()); 
	}
	
	public String getAutenticationType(){
		return commonMain.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());
	}

	public Properties getMainSettings() {
		return commonMain;
	}

	public Config getConfig() {
		return config;
	}
	
}
