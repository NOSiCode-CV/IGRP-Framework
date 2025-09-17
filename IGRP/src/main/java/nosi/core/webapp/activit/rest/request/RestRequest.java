package nosi.core.webapp.activit.rest.request;

import com.google.gson.annotations.Expose;
import jakarta.ws.rs.core.HttpHeaders;
import jakarta.ws.rs.core.MediaType;

import nosi.core.webapp.Core;
import nosi.core.webapp.webservices.helpers.ConfigurationRequest;
import nosi.core.webapp.webservices.helpers.RestRequestHttpClient;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;

/**
 * Emanuel
 * 15 May 2019
 */
public class RestRequest extends nosi.core.webapp.webservices.helpers.RestRequest{
	RestRequestHttpClient restRequestHttpClient;

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

		//initialize HttpClientRequest configuration
		this.setHttpClientRequestConfig();

	}

	private void setHttpClientRequestConfig() {
        restRequestHttpClient = new RestRequestHttpClient();

        // get activiti CONFIGURATION from tbl_config AND set on request config
		restRequestHttpClient.setBaseURL(this.getBase_url());
		restRequestHttpClient.setUsername(this.getUsername());
		restRequestHttpClient.setPassword(this.getPassword());
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

	public String getString(String url){
       if(Core.isNull(this.getUsername()))
                return "";
		var authString = this.getUsername() + ":" + this.getPassword();
		var encodedAuthString = Base64.getEncoder().encodeToString(authString.getBytes());

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.header(HttpHeaders.AUTHORIZATION, "Basic " + encodedAuthString)
				.uri(URI.create(url))
				.build();

		HttpResponse<String> response;
		try {
			response = client.send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			throw new RuntimeException(e);
		}
		return response.body();
	}
	public byte[] getBytes(String url){
		var authString = this.getUsername() + ":" + this.getPassword();
		var encodedAuthString = Base64.getEncoder().encodeToString(authString.getBytes());

		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
				.header(HttpHeaders.AUTHORIZATION, "Basic " + encodedAuthString)
				.uri(URI.create(url))
				.build();

		HttpResponse<byte[]> response;
		try {
			response = client.send(request, HttpResponse.BodyHandlers.ofByteArray());
		} catch (IOException | InterruptedException e) {
			throw new RuntimeException(e);
		}
		return response.body();
	}
}
