package nosi.core.webapp.activit.rest.request;

import jakarta.ws.rs.core.MediaType;

import nosi.core.webapp.webservices.helpers.ConfigurationRequest;
import nosi.core.webapp.webservices.helpers.RestRequestHttpClient;

import java.net.http.HttpResponse;

/**
 * Emanuel
 * 15 May 2019
 */
public class RestRequest extends nosi.core.webapp.webservices.helpers.RestRequest{
	RestRequestHttpClient restRequestHttpClient;
	public RestRequest() {
		this.setBase_url(Credentials.getInstance().getUrl()); 
		this.setAccept_format(MediaType.APPLICATION_JSON);
		this.setConfig(new ConfigurationRequest(this));

		//initialize HttpClientRequest configuration
		this.setHttpClientRequestConfig();

	}

	private void setHttpClientRequestConfig() {
        restRequestHttpClient = new RestRequestHttpClient();

        // get activiti CONFIGURATION from tbl_config AND set on request config
		restRequestHttpClient.setBaseURL(Credentials.getInstance().getUrl());
		restRequestHttpClient.setUsername(Credentials.getInstance().getUserName());
		restRequestHttpClient.setPassword(Credentials.getInstance().getPassword());
	}

	public HttpResponse<String> getHttpClient(String url) {
		return restRequestHttpClient.get(url);
	}
	public HttpResponse<String> getHttpClient(String url, String id) {
		return restRequestHttpClient.get(url, id);
	}

	public HttpResponse<String> postHttpClient(String url, String content) {
		return restRequestHttpClient.post(url, content);
	}

	public HttpResponse<String> postHttpClient(String url, String content, Object id) {
		return restRequestHttpClient.post(url, content, id);
	}

	public HttpResponse<String> putHttpClient(String url, String content) {
		return restRequestHttpClient.put(url, content);
	}

	public HttpResponse<String> putHttpClient(String url, String content, Object id) {
		return restRequestHttpClient.put(url, content, id);
	}

	public HttpResponse<String> deleteHttpClient(String url, Object id) {
		return restRequestHttpClient.delete(url, id);
	}
}
