package cv.nosi.core.webservices.rest.client.integration.pdex.service;

import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Iekiny Marcel
 * May 21, 2020
 */
public abstract class PdexServiceTemplate {
	
	protected String url; 
	protected String token; 
	
	protected String appCode;
	
	public static final String IGRPWEB_INSTANCE_NAME = "IGRPWEB_INSTANCE_NAME";
	public static final int DEFAULT_TIMEOUT = 2000; 

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
	
	public static boolean ping(String hostUrl, int timeout) {
		boolean success = false; 
		try {
			HttpURLConnection connection = (HttpURLConnection) new URL(hostUrl).openConnection();
		    connection.setConnectTimeout(timeout);
		    connection.setReadTimeout(timeout);
		    connection.setRequestMethod("HEAD");
		    int responseCode = connection.getResponseCode(); 
		    success =  (200 <= responseCode && responseCode <= 399); 
		} catch (Exception e) {
			//e.printStackTrace(); 
		}
		return success; 
	}
	
}
