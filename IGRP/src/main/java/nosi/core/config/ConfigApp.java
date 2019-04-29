package nosi.core.config;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
import nosi.core.igrp.mingrations.MigrationIGRPInitConfig;
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
	private static final ConfigApp CONFIG_APP = new ConfigApp();
	
	private ConfigApp() {
		this.config = new Config();
	}
	
	public static ConfigApp getInstance() {
		return CONFIG_APP;
	}
	
	public Properties loadConfig(String fileName) {
		File file = new File(fileName);
		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream(file)) {
			props.loadFromXML(fis);
			fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
	
	public Properties loadConfig(String filePath, String fileName) {
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		return this.loadConfig(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath().replaceAll("%20", " "));
	}
	
	public String getBaseConnection() {
		return "hibernate-igrp-core";
	}

	public String getH2IGRPBaseConnection() {
		return "hibernate-igrp-core-h2";
	}
	
	public void configurationApp(){
		if(!this.isInstall()){
			MigrationIGRPInitConfig.start();
			try {
				this.save();
			} catch (IOException e) {
				// TODO Auto-generated catch block
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
		if(p!=null){
			this.version = p.getProperty("version");
			this.data_install = p.getProperty("data_install");
			this.isInstallation = p.getProperty("isInstallation");
		}
	}
	
	public void save() throws IOException {
		Properties p = new Properties();
		p.setProperty("version", this.config.VERSION);
		p.setProperty("data_install", Core.getCurrentDate());
		p.setProperty("isInstallation", "success");
		if(Core.isNotNull(this.config.getWorkspace())) {//Save in workspace eclipse
			this.saveProperties(p, this.config.getPathWorkspaceResources()+File.separator+"config"+File.separator+"install"+File.separator+"install.properties");
		}
		this.saveProperties(p, this.config.getBasePathClass()+"config"+File.separator+"install"+File.separator+"install.properties");
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
	
	public void saveProperties(Properties p,String fileName) throws IOException {
		OutputStream out = new FileOutputStream(fileName);	
		if(out!=null) {
			p.store(out, "");
			out.close();
		}
	}
	public boolean isInstall() {
		if(Core.isNull(this.isInstallation)) {
			try {
				this.load();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return Core.isNotNull(this.isInstallation);
	}
}
