package nosi.core.integration.pdex.service;
/**
 * Iekiny Marcel
 * May 21, 2020
 */
public abstract class PdexServiceTemplate {
	
	protected String url; 
	protected String token; 
	
	protected String appCode;
	
	public static final String IGRPWEB_INSTANCE_NAME = "IGRPWEB_INSTANCE_NAME";

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getAppCode() {
		return appCode;
	}

	public void setAppCode(String appCode) {
		this.appCode = appCode;
	} 
	
}
