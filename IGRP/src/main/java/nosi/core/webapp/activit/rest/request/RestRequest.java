package nosi.core.webapp.activit.rest.request;

import jakarta.ws.rs.core.MediaType;

import nosi.core.webapp.webservices.helpers.ConfigurationRequest;

/**
 * Emanuel
 * 15 May 2019
 */
public class RestRequest extends nosi.core.webapp.webservices.helpers.RestRequest{

	public RestRequest() {
		this.setBase_url(Credentials.getInstance().getUrl()); 
		this.setAccept_format(MediaType.APPLICATION_JSON);
		this.setConfig(new ConfigurationRequest(this));
	}	
}
