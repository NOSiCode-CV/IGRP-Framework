package nosi.core.config;


import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.Properties;

import nosi.core.webapp.ApplicationManager;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;


/**
 * Emanuel
 * 17 Jul 2018
 */
public final class ConfigApp {

    private final Config config;

    private final Properties commonMain;

    private static final ConfigApp CONFIG_APP = new ConfigApp();

    private ConfigApp() {
        this.config = new Config();
        this.commonMain = this.loadConfig("common", "main.xml");
    }

    public static ConfigApp getInstance() {
        return CONFIG_APP;
    }

    public static Properties loadConfig(String fileName) { // xml to properties
        final File file = new File(fileName);
        final Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream(file)) {
            properties.loadFromXML(fis);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }
	public Properties loadProperties(String fileName) throws IOException {
		final Properties properties = new Properties();
		try (InputStream inputStream = getClass().getResourceAsStream(fileName)) {
			if (inputStream != null)
				properties.load(inputStream);
		}
		return properties;
	}


    public Properties loadConfig(String filePath, String fileName) {
        final String path = Config.BASE_PATH_CONFIGURATION + "/" + filePath;
        return loadConfig(Objects.requireNonNull(this.getClass().getClassLoader().getResource(path + "/" + fileName)).getPath().replace("%20", " "));
    }

    public String getBaseConnection() {
        return ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.environmentValue("hibernate-igrp-core");
    }

    public void saveProperties(Properties p, String fileName) {
        try (OutputStream out = Files.newOutputStream(Paths.get(fileName))) {
            p.store(out, "");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public String getExternalUrl(String dad) {
    	String url = ApplicationManager.requestUrl(Igrp.getInstance().getRequest());
    	if(dad != null && !dad.trim().isEmpty()) {
    		String deployedWarName = Core.getDeployedWarName();
    		url = url.replaceFirst("/" + deployedWarName + "/", "/" + dad + "/");
    	}
    	return url;
    }

    public String getWorkspace() {
        return ConfigCommonMainConstants.isEnvironmentVariableScanActive()
                ? "" :
                ConfigCommonMainConstants.IGRP_WORKSPACE.environmentValue();
    }

    public String getEnvironment() {
        return ConfigCommonMainConstants.IGRP_ENV.environmentValue();
    }

    public String getAutenticationType() {
        return ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.environmentValue();
    }
    
    public boolean isActiveGlobalACL() {
        return Core.isNotNull(ConfigCommonMainConstants.IGRP_PDEX_APPCONFIG_URL.environmentValue());
    }

    public Properties getMainSettings() {
        return commonMain;
    }

    public Config getConfig() {
        return config;
    }
}
