package cv.nosi.core.webapp.workflow.activit.rest.request;

import javax.ws.rs.core.MediaType;

import cv.nosi.core.webservices.rest.client.helpers.ConfigurationRequest;

/**
 * Emanuel
 * 15 May 2019
 */
public class RestRequest extends cv.nosi.core.webservices.rest.client.helpers.RestRequest{

	public RestRequest() {
		this.setBase_url(Credentials.getInstance().getUrl()); 
		this.setUsername(Credentials.getInstance().getUserName());
		this.setPassword(Credentials.getInstance().getPassword());
		this.setAccept_format(MediaType.APPLICATION_JSON);
		this.setContent_type(MediaType.APPLICATION_JSON);
		this.setConfig(new ConfigurationRequest(this));
	}	
}
