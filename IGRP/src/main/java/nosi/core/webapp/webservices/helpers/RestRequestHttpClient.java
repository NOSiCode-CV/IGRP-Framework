package nosi.core.webapp.webservices.helpers;


import com.google.gson.annotations.Expose;
import jakarta.ws.rs.core.MediaType;
import nosi.core.webapp.activit.rest.request.Credentials;
import nosi.core.webapp.helpers.UrlHelper;

import java.io.IOException;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
//-------------------------------------------------

/**
 * {@code @author:Ederlino Tavares}
 * 24 Jun 2024
 *
 */

public class RestRequestHttpClient {

	@Expose(serialize=false,deserialize=false)
	private static String base_url;
	@Expose(serialize=false,deserialize=false)
	private String final_url;
	@Expose(serialize=false,deserialize=false)
	private static String username;
	@Expose(serialize=false,deserialize=false)
	private static String password;
	@Expose(serialize=false,deserialize=false)
	private static String accept_format= MediaType.APPLICATION_JSON;
	@Expose(serialize=false,deserialize=false)
	private static final String content_type=MediaType.APPLICATION_JSON;
	@Expose(serialize=false,deserialize=false)
	private ConfigurationRequest config;
	@Expose(serialize=false,deserialize=false)
	private final HttpClient.Builder httpClientBuilder;
	private final String CONTENTTYPE = "Content-Type";


	public RestRequestHttpClient() {
		httpClientBuilder = this.getHttpClientBuilder();
	}

	public Authenticator getBasicAuthenticationForHttpClient(){
		return new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password.toCharArray());
			}
		};
	}

	public HttpResponse<String> get(String url) {
		this.addUrl(url);
		HttpClient httpClient = httpClientBuilder.build();
		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(this.getFullUrl()))
				.header(CONTENTTYPE, this.getContentType())
				.build();
		try {
			return httpClient.send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			System.err.println("RestRequestHttpClient.InterruptedException: "+e.getCause());
		}
		return null;
	}

	public  HttpResponse<String> get(String url, Object id) {
		return this.get(url+"/"+id);
	}
	public HttpResponse<String> post(String url, String content) {
			this.addUrl(url);
			HttpClient httpClient = httpClientBuilder.build();

			HttpRequest request = HttpRequest.newBuilder()
					.uri(URI.create(this.getFullUrl()))
					.header(CONTENTTYPE, this.getContentType())
					.POST(HttpRequest.BodyPublishers.ofString(content))
					.build();
		try {
			return httpClient.send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		return null;
	}
	public HttpResponse<String> post(String url, String content, Object id) {
		return this.post(url+"/"+id, content);
	}


	public HttpResponse<String> put(String url, String content){
		try {
			this.addUrl(url);
			HttpClient httpClient = httpClientBuilder.build();

			HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(this.getFullUrl()))
				.header(CONTENTTYPE, this.getContentType())
				.PUT(HttpRequest.BodyPublishers.ofString(content))
				.build();

			return httpClient.send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		return null;
	}

	public HttpResponse<String> put(String url, String content, Object id) {
		return this.put(url+"/"+id, content);
	}

	public HttpResponse<String> delete(String url, Object id){
		this.addUrl(url+"/"+id);
		HttpClient httpClient = httpClientBuilder.build();

		HttpRequest request = HttpRequest.newBuilder()
				.uri(URI.create(this.getFullUrl()))
				.header(CONTENTTYPE, this.getContentType())
				.DELETE()
				.build();
		try {
			return httpClient.send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		return null;
	}


	public void addUrl(String url){
		final_url=base_url+url;
	}
	public String getBaseURL() {
		return base_url;
	}

	public void setUsername(String username) {
		RestRequestHttpClient.username = username;
	}
	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		RestRequestHttpClient.password = password;
	}
	public String getPassword() {
		return password;
	}

	public String getAcceptFormat() {
		return accept_format;
	}

	public void setAcceptFormat(String accept_format) {
		RestRequestHttpClient.accept_format = accept_format;
	}

	public String getContentType() {
		return content_type;
	}
	public HttpClient.Builder getHttpClientBuilder() {
		// HttpClient configuration
		return HttpClient.newBuilder()
				.connectTimeout(Duration.ofMinutes(10)) // default no limit
				.followRedirects(HttpClient.Redirect.ALWAYS)
				.authenticator(this.getBasicAuthenticationForHttpClient()); // allow redirect always
	}

	public void setBaseURL(String baseUrl) {
		base_url=baseUrl;
	}

	public String getFullUrl() {
		return UrlHelper.urlEncoding(final_url);
	}

}
