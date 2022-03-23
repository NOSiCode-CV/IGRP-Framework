package nosi.core.embedded.server;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.tomee.embedded.Configuration;

import nosi.core.config.ConfigCommonMainConstants;
/**
 * @author Iekiny Marcel
 * Mar 18, 2022
 */
public final class ContainerConfiguration extends Configuration{
	
	private static final Logger LOGGER = LogManager.getLogger(ContainerConfiguration.class);
	
	public static final String CONFIGURATION_RESOURCE_PATH = "config/common/main.xml";
	public static final String DEFAULT_CONTEXT_PATH = "/IGRP";
	public static final int DEFAULT_HTTP_PORT = 8080;
	
	private String contextPath;
	
	public void loadConfigurations() {
		Properties configs = loadConfigurationProperties();
		this.setHttpPort(Integer.parseInt(configs.getProperty(ConfigCommonMainConstants.IGRP_EMBEDDED_SERVER_HTTP_PORT.value(), DEFAULT_HTTP_PORT + "")));
		contextPath = configs.getProperty(ConfigCommonMainConstants.IGRP_EMBEDDED_SERVER_SERVLET_CONTEXT_PATH.value(), DEFAULT_CONTEXT_PATH);
		// ... more configuration loaded can be defined here ...
	}
	
	private Properties loadConfigurationProperties() {
		Properties configs = new Properties();
		try {
			InputStream inputStream = getResourceStream();
			configs.loadFromXML(inputStream);
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
		}
		return configs;
	}
	
	private InputStream getResourceStream() throws FileNotFoundException {
		InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(CONFIGURATION_RESOURCE_PATH);
		if (inputStream == null) {
            final File file = new File(CONFIGURATION_RESOURCE_PATH);
            if (file.exists())
                return new FileInputStream(file);
        }
		return inputStream;
	}

	public String getContextPath() {
		return contextPath;
	}
	
}
