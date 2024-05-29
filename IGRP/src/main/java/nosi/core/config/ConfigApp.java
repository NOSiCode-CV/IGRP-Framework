package nosi.core.config;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.Properties;

import nosi.core.db.migration.api.MigrationIGRPInitConfig;
import nosi.core.webapp.Core;


/**
 * Emanuel
 * 17 Jul 2018
 */
public final class ConfigApp {

    private String version;
    private String dataInstall;
    private String isInstallation;
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

    /**
     * @return loadConfig(" common ", " main.xml ");
     * @deprecated (Use getMainSettings)
     */
    @Deprecated
    public Properties loadCommonConfig() {
        return this.commonMain;
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
        return commonMain.getProperty(ConfigCommonMainConstants.IGRP_DATASOURCE_CONNECTION_NAME.value(), getDefaultBaseConnectionName());
    }

    public String getDefaultBaseConnectionName() {
        return "hibernate-igrp-core";
    }

    public void configurationApp() {
        if (!this.isInstall()) {
            MigrationIGRPInitConfig.start();
			this.save();
		}
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getData_install() {
        return dataInstall;
    }

    public void setData_install(String dataInstall) {
        this.dataInstall = dataInstall;
    }

    public String isInstallation() {
        return isInstallation;
    }

    public void setInstallation(String isInstallation) {
        this.isInstallation = isInstallation;
    }

    private void load() throws IOException {
        final Properties properties = this.loadProperties("/config/install/install.properties");
        this.version = properties.getProperty("version");
        this.dataInstall = properties.getProperty("data_install");
        this.isInstallation = properties.getProperty("isInstallation");
    }

    public void save() {
        Properties p = new Properties();
        p.setProperty("version", Config.VERSION);
        p.setProperty("data_install", Core.getCurrentDate());
        p.setProperty("isInstallation", "success");
        if (Core.isNotNull(this.getWorkspace())) {//Save in workspace eclipse
            this.saveProperties(p, this.config.getPathWorkspaceResources() + File.separator + "config" + File.separator + "install" + File.separator + "install.properties");
        }
        this.saveProperties(p, this.config.getBasePathClass() + "config" + File.separator + "install" + File.separator + "install.properties");
    }

    public void saveProperties(Properties p, String fileName) {
        try (OutputStream out = Files.newOutputStream(Paths.get(fileName))) {
            p.store(out, "");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean isInstall() {
        if (Core.isNull(this.isInstallation)) {
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
        final String redirectUri = commonMain.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI.value());
        final String clientId = commonMain.getProperty(ConfigCommonMainConstants.IDS_OAUTH2_OPENID_CLIENT_ID.value());
        url += "?response_type=code&client_id=" + clientId + "&scope=openid+email+profile&state=igrp&redirect_uri=" + redirectUri;
        return url;
    }

    public String getWorkspace() {
        return commonMain.getProperty(ConfigCommonMainConstants.IGRP_WORKSPACE.value());
    }

    public String getEnvironment() {
        return commonMain.getProperty(ConfigCommonMainConstants.IGRP_ENV.value());
    }

    public String getAutenticationType() {
        return commonMain.getProperty(ConfigCommonMainConstants.IGRP_AUTHENTICATION_TYPE.value());
    }
    
    public boolean isActiveGlobalACL() {
        return Core.isNotNull(commonMain.getProperty(ConfigCommonMainConstants.IGRP_PDEX_APPCONFIG_URL.value()));

    }

    public Properties getMainSettings() {
        return commonMain;
    }

    public Config getConfig() {
        return config;
    }

}
