package nosi.base.ActiveRecord;

import java.util.Properties;
import nosi.core.config.ConfigApp;

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
	private String leakDetectionThreshold;
	private String provider_class;
	private String useConnectionPool="";
	
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

	public String getLeakDetectionThreshold() {
		return leakDetectionThreshold;
	}
	
	public void setLeakDetectionThreshold(String leakDetectionThreshold) {
		this.leakDetectionThreshold = leakDetectionThreshold;
	}
	
	public String getProvider_class() {
		return provider_class;
	}
	
	public void setProvider_class(String provider_class) {
		this.provider_class = provider_class;
	}
	
	public String getUseConnectionPool() {
		return useConnectionPool;
	}

	public void setUseConnectionPool(String useConnectionPool) {
		this.useConnectionPool = useConnectionPool;
	}

	public void load() throws Exception{
		Properties p = new ConfigApp().loadProperties("/config/db/hikaricp.properties");
		if(p!=null){
			this.connectionTimeout = p.getProperty("connectionTimeout");
			this.idleTimeout = p.getProperty("idleTimeout");
			this.maximumPoolSize = p.getProperty("maximumPoolSize");
			this.maxLifetime = p.getProperty("maxLifetime");
			this.minimumIdle = p.getProperty("minimumIdle");
			this.provider_class = p.getProperty("provider_class");
			this.leakDetectionThreshold = p.getProperty("leakDetectionThreshold");
			this.useConnectionPool = p.getProperty("useConnectionPool");
		}
	}
}
