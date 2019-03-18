package nosi.base.ActiveRecord;

import java.util.Optional;
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
	private String mminimumPoolSize;
	private String incrementPool;
	private String maxLifetime;
	private String leakDetectionThreshold;
	private String provider_class;
	private String useConnectionPool="";
	private String allowPoolSuspension;
	private static ConfigHikariCP instance;
	private String hbm2ddlAuto;
	private String connectionIsolation;
	private String currentSessionContextClass;
	private String autCloseSession;
	private String autocommit;
	private String release_mode;
	

	private ConfigHikariCP() {
		try {
			this.load();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ConfigHikariCP getInstance() {
		if(instance==null)
			instance = new ConfigHikariCP();
		return instance;
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

	public String getAllowPoolSuspension() {
		return allowPoolSuspension;
	}

	public void setAllowPoolSuspension(String allowPoolSuspension) {
		this.allowPoolSuspension = allowPoolSuspension;
	}
	
	public Optional<String> getHbm2ddlAuto() {
		return Optional.ofNullable(hbm2ddlAuto);
	}

	public void setHbm2ddlAuto(String hbm2ddlAuto) {
		this.hbm2ddlAuto = hbm2ddlAuto;
	}

	public Optional<String> getConnectionIsolation() {
		return Optional.ofNullable(connectionIsolation);
	}

	public void setConnectionIsolation(String connectionIsolation) {
		this.connectionIsolation = connectionIsolation;
	}

	public Optional<String> getCurrentSessionContextClass() {
		return Optional.ofNullable(currentSessionContextClass);
	}

	public void setCurrentSessionContextClass(String currentSessionContextClass) {
		this.currentSessionContextClass = currentSessionContextClass;
	}

	public Optional<String> getAutCloseSession() {
		return Optional.ofNullable(autCloseSession);
	}

	public void setAutCloseSession(String autCloseSession) {
		this.autCloseSession = autCloseSession;
	}

	public Optional<String> getAutocommit() {
		return Optional.ofNullable(autocommit);
	}

	public void setAutocommit(String autocommit) {
		this.autocommit = autocommit;
	}

	public String getRelease_mode() {
		return release_mode;
	}

	public void setRelease_mode(String release_mode) {
		this.release_mode = release_mode;
	}

	@Override
	public String toString() {
		return "ConfigHikariCP [connectionTimeout=" + connectionTimeout + ", idleTimeout=" + idleTimeout
				+ ", minimumIdle=" + minimumIdle + ", maximumPoolSize=" + maximumPoolSize + ", maxLifetime="
				+ maxLifetime + ", leakDetectionThreshold=" + leakDetectionThreshold + ", provider_class="
				+ provider_class + ", useConnectionPool=" + useConnectionPool + ", allowPoolSuspension="
				+ allowPoolSuspension + ", hbm2ddlAuto=" + hbm2ddlAuto + ", connectionIsolation=" + connectionIsolation
				+ ", currentSessionContextClass=" + currentSessionContextClass + ", autCloseSession=" + autCloseSession
				+ ", autocommit=" + autocommit + "]";
	}

	public void load() throws Exception{
		Properties p = new ConfigApp().loadProperties("/config/db/hikaricp.properties");
		if(p!=null){
			this.connectionTimeout = p.getProperty("connectionTimeout");
			this.idleTimeout = p.getProperty("idleTimeout");
			this.maximumPoolSize = p.getProperty("maximumPoolSize","10");
			this.maxLifetime = p.getProperty("maxLifetime");
			this.minimumIdle = p.getProperty("minimumIdle");
			this.provider_class = p.getProperty("provider_class");
			this.leakDetectionThreshold = p.getProperty("leakDetectionThreshold");
			this.useConnectionPool = p.getProperty("useConnectionPool");
			this.allowPoolSuspension = p.getProperty("allowPoolSuspension");
			this.autCloseSession = p.getProperty("autCloseSession");
			this.connectionIsolation = p.getProperty("connectionIsolation");
			this.hbm2ddlAuto = p.getProperty("hbm2ddlAuto");
			this.currentSessionContextClass = p.getProperty("currentSessionContextClass");
			this.autocommit = p.getProperty("autocommit","false");
			this.release_mode = p.getProperty("releaseMode");
			this.mminimumPoolSize = p.getProperty("mminimumPoolSize", "5");
			this.incrementPool = p.getProperty("incrementPool","5");
		}
	}

	public String getMinimumPoolSize() {
		return this.mminimumPoolSize;
	}

	public String getIncrement() {
		return this.incrementPool;
	}
}
