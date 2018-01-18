package nosi.core.webapp.webservices.helpers;

import java.lang.reflect.Type;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.util.List;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.ws.rs.core.MediaType;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.client.urlconnection.HTTPSProperties;
import nosi.core.webapp.helpers.UrlHelper;
import nosi.webapps.igrp.dao.Config;
import com.sun.jersey.api.client.ClientResponse;

/**
 * @author: Emanuel Pereira
 * 26 Sep 2017
 * @param <T>
 */

public class RestRequest{
	
	public String BASE_URL = new Config().find().andWhere("name", "=", "url_ativiti_connection").one().getValue();
	public String USERNAME = new Config().find().andWhere("name", "=", "ativiti_user").one().getValue();
	public String PASSWORD = new Config().find().andWhere("name", "=", "ativiti_password").one().getValue();
	public String ACCEPT_FORMAT = MediaType.APPLICATION_JSON;
	public String CONTENT_TYPE = MediaType.APPLICATION_JSON;
	
	public  ClientResponse get(String url, Object id) {
		try {
			ClientConfig config = new DefaultClientConfig();
	        Client client = Client.create(this.applySslSecurity(config));
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));
	        url = this.BASE_URL + url;
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url)).path(String.valueOf(id));
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);	
	        client.destroy();
	   	 	return response;
		}catch(Exception e){ 
		}
		return null;
	}

	public ClientResponse get(String url) {
		try {
			ClientConfig config = new DefaultClientConfig();
	        Client client = Client.create(this.applySslSecurity(config));
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));
	        url = this.BASE_URL + url;
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url));
	        ClientResponse response = resource.accept(ACCEPT_FORMAT).get(ClientResponse.class);
		    client.destroy();
	   	 	return response;
		}catch(Exception e){
		}
		return null;
	}
	

	public ClientResponse post(String url, String content) {
		try {
			ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(this.applySslSecurity(config));	   
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));     
	        url = this.BASE_URL + url;	        
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url));	        
	        ClientResponse response = resource.accept(ACCEPT_FORMAT).type(CONTENT_TYPE).post(ClientResponse.class, content);			
	        client.destroy();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	

	public ClientResponse post(String url, String content,Object id) {
		try {
			ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(this.applySslSecurity(config));	   
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));     
	        url = this.BASE_URL + url;	        
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url)).path(String.valueOf(id));	        
	        ClientResponse response = resource.accept(ACCEPT_FORMAT).type(CONTENT_TYPE).post(ClientResponse.class, content);			
	        client.destroy();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	
	public ClientResponse put(String url,String content){
		try{
		    ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(this.applySslSecurity(config));	
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));            
	        url = this.BASE_URL + url;	               
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url));
			ClientResponse response = resource.accept(ACCEPT_FORMAT).type(CONTENT_TYPE).put(ClientResponse.class, content);			
	 	    client.destroy();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	

	public ClientResponse put(String url,String content, Object id){
		try{
		    ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(this.applySslSecurity(config));
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));	            
	        url = this.BASE_URL + url;	               
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url)).path(String.valueOf(id));
			ClientResponse response = resource.accept(ACCEPT_FORMAT).type(CONTENT_TYPE).put(ClientResponse.class, content);			
	 	    client.destroy();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	
	public ClientResponse delete(String url,Object id){
		try{
		    ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(this.applySslSecurity(config));	     
	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));       
	        url = this.BASE_URL + url;	               
	        WebResource resource = client.resource(UrlHelper.urlEncoding(url)).path(String.valueOf(id));
			ClientResponse response = resource.accept(ACCEPT_FORMAT).delete(ClientResponse.class);			
	 	    client.destroy();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	
	public String convertDaoToJson(Object dao) {
		Gson gson = new Gson();
		return gson.toJson(dao);
	}
	
	public Object convertJsonToDao(String jsonResult, Class<?> dao) {
		Object response = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			Gson gson = new Gson();
			response = gson.fromJson(jsonObject.toString(), dao);
		} catch (JSONException e) {
		}
		return response;
	}
	
	public <T> List<? extends Object> convertJsonToListDao(String jsonResult, Type type) {
		List<? extends Object> list = null;
		Gson gson = new Gson();
		list = gson.fromJson(jsonResult, type);
		return list;
	}
	
	public <T> List<? extends Object> convertJsonToListDao(String jsonResult,String keySearch, Type type) {
		List<? extends Object> list = null;
		try {
			JSONObject jsonObject = new JSONObject(jsonResult);
			if(jsonObject.has(keySearch)) {
				JSONArray aux = jsonObject.getJSONArray(keySearch);
				Gson gson = new Gson();
				list = gson.fromJson(aux.toString(), type);
			}
		} catch (JSONException e) {
		}
		return list;
	}
	public ClientConfig applySslSecurity(ClientConfig clientConfig) {
		SSLContext sslContext = this.createSslContext();
		if(sslContext != null) {
			clientConfig.getProperties()
	        .put(HTTPSProperties.PROPERTY_HTTPS_PROPERTIES,
	                new HTTPSProperties(
	                        new HostnameVerifier() {
								public boolean verify(String hostname, SSLSession session) {
									return true;
								}
							},
	                        sslContext));
			}
		return clientConfig;
	}
	
	private SSLContext createSslContext() {
		SSLContext sslContext = null;
		try {
			sslContext = SSLContext.getInstance("SSL");
			sslContext.init(null, this.createTrustManager(), new java.security.SecureRandom());// new java.security.SecureRandom()
		} catch (NoSuchAlgorithmException | KeyManagementException e) {
		}
		return sslContext;
	}
	
	private TrustManager[] createTrustManager() {
		return new TrustManager[]{
                new X509TrustManager() {
                    public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                        return null;
                    }
                    public void checkClientTrusted(
                            final java.security.cert.X509Certificate[] arg0, final String arg1)
                            throws CertificateException {
                        // do nothing and blindly accept the certificate
                    }
                    public void checkServerTrusted(
                            final java.security.cert.X509Certificate[] arg0, final String arg1)
                            throws CertificateException {
                        // do nothing and blindly accept the server
                    }

                }
        };
	}
}
