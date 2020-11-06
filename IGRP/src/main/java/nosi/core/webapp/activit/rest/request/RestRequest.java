package nosi.core.webapp.activit.rest.request;

import javax.ws.rs.core.MediaType;
import nosi.core.webapp.webservices.helpers.ConfigurationRequest;

/**
 * Emanuel
 * 15 May 2019
 */
public class RestRequest extends nosi.core.webapp.webservices.helpers.RestRequest{

	public RestRequest() {
		this.setBase_url(Credentials.getInstance().getUrl()); 
		this.setUsername(Credentials.getInstance().getUserName());
		this.setPassword(Credentials.getInstance().getPassword());
		this.setAccept_format(MediaType.APPLICATION_JSON);
		this.setContent_type(MediaType.APPLICATION_JSON);
		this.setConfig(new ConfigurationRequest(this));
	}	
}
