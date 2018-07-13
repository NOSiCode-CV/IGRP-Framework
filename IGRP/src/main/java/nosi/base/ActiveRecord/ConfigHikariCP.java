package nosi.base.ActiveRecord;

import java.io.InputStream;
import java.util.Properties;

/**
 * Emanuel
 * 11 Jul 2018
 */
public class ConfigHikariCP {

	private String connectionTimeout;
	private String	idleTimeout;
	private String minimumIdle;
	private String maximumPoolSize;
	private String maxLifetime;
	
	public ConfigHikariCP() {
		try {
			this.load();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getConnectionTimeout() {
		return connectionTimeout;
	}


	public void setConnectionTimeout(String connectionTimeout) {
		this.connectionTimeout = connectionTimeout;
	}


	public String getIdleTimeout() {
		return idleTimeout;
	}


	public void setIdleTimeout(String idleTimeout) {
		this.idleTimeout = idleTimeout;
	}


	public String getMinimumIdle() {
		return minimumIdle;
	}


	public void setMinimumIdle(String minimumIdle) {
		this.minimumIdle = minimumIdle;
	}


	public String getMaximumPoolSize() {
		return maximumPoolSize;
	}


	public void setMaximumPoolSize(String maximumPoolSize) {
		this.maximumPoolSize = maximumPoolSize;
	}


	public String getMaxLifetime() {
		return maxLifetime;
	}


	public void setMaxLifetime(String maxLifetime) {
		this.maxLifetime = maxLifetime;
	}


	public void load() throws Exception{
		Properties props = new Properties();
		InputStream in = getClass().getResourceAsStream("/config/db/hikaricp.properties");
		props.load(in);
		in.close();
		if(props!=null){
			this.connectionTimeout = props.getProperty("connectionTimeout");
			this.idleTimeout = props.getProperty("idleTimeout");
			this.maximumPoolSize = props.getProperty("maximumPoolSize");
			this.maxLifetime = props.getProperty("maxLifetime");
			this.minimumIdle = props.getProperty("minimumIdle");
		}
	}
}
