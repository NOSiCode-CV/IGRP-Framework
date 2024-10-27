package nosi.core.webapp.activit.rest.request;

import com.google.gson.annotations.Expose;
import javax.ws.rs.core.MediaType;

import nosi.core.webapp.webservices.helpers.ConfigurationRequest;

/**
 * Emanuel
 * 15 May 2019
 */
public class RestRequest extends nosi.core.webapp.webservices.helpers.RestRequest{

	@Expose(serialize=false,deserialize=false)
	private static final String base_url=Credentials.getInstance().getUrl();
	@Expose(serialize=false,deserialize=false)
	private static final String username=Credentials.getInstance().getUserName();
	@Expose(serialize=false,deserialize=false)
	private static final String password=Credentials.getInstance().getPassword();
	public RestRequest() {
		this.setBase_url(base_url);
		this.setUsername(username);
		this.setPassword(password);
		this.setAccept_format(MediaType.APPLICATION_JSON);
		this.setConfig(new ConfigurationRequest(this));
	}	
}
