package nosi.core.config;


import java.io.File;
import java.io.IOException;
import java.util.Properties;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 17 Jul 2018
 */
public class ConfigApp {

	private String version;
	private String data_install;
	private String isInstallation;
	private Config config;
	
	public ConfigApp(Config config) {
		this.config = config;
		try {
			this.load();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		Properties p = this.config.loadProperties("/config/install/install.properties");
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
			this.config.saveProperties(p, this.config.getPathWorkspaceResources()+File.separator+"config"+File.separator+"install"+File.separator+"install.properties");
		}
		this.config.saveProperties(p, this.config.getBasePathClass()+"config"+File.separator+"install"+File.separator+"install.properties");
	}
	
	public boolean isInstall() {
		return Core.isNotNull(this.isInstallation);
	}
}
