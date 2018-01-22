package nosi.core.webapp.webservices.helpers;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.text.ParseException;
import java.util.Base64;
import java.util.List;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.Part;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.client.ClientResponse;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;
import org.glassfish.jersey.media.multipart.FormDataMultiPart; 
import org.glassfish.jersey.media.multipart.MultiPart; 
import org.glassfish.jersey.media.multipart.MultiPartFeature; 
import org.glassfish.jersey.media.multipart.file.StreamDataBodyPart; 
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.Gson;
import nosi.core.webapp.helpers.UrlHelper;
import nosi.webapps.igrp.dao.Config;


/**
 * @author: Emanuel Pereira
 * 26 Sep 2017
 * @param <T>
 */

public class RestRequest{
	
	private String base_url = new Config().find().andWhere("name", "=", "url_ativiti_connection").one().getValue();
	private String username = new Config().find().andWhere("name", "=", "ativiti_user").one().getValue();
	private String password = new Config().find().andWhere("name", "=", "ativiti_password").one().getValue();
	private String accept_format = MediaType.APPLICATION_JSON;
	private String content_type = MediaType.APPLICATION_JSON;
	private ConfigurationRequest config;
	
	public RestRequest() {
		config = new ConfigurationRequest(this);
	}	
	
	public  Response get(String url, Object id) {
		try {
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
	        Response response = target.request(this.getAccept_format()).get(Response.class);
	        client.close();
	        return response;
		}catch(Exception e){ 
			e.printStackTrace();
		}
		return null;
	}

	public Response get(String url) {
		try {
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl());
	        Response response = target.request(this.getAccept_format()).get(Response.class);
	        client.close();
	        return response;
		}catch(Exception e){ 
			e.printStackTrace();
		}
		return null;
	}
	
	public Response post(String url, Part file) throws IOException {		
	    StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream());
	    MultiPart multiPart = new MultiPart().bodyPart(stream,MediaType.APPLICATION_OCTET_STREAM_TYPE);
//	    if (multiPart instanceof FormDataMultiPart) {
//	        final FormDataMultiPart dataMultiPart = (FormDataMultiPart) multiPart;
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
			WebTarget target = client.target(this.getConfig().getUrl());
			Response response = target.request().post(Entity.entity(multiPart,multiPart.getMediaType()));
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
	            System.out.println(response.ok(response).build().toString());
	        } else {
	        	System.err.println(response.serverError().toString());
	        }
//	        formDataMultiPart.close();
//	        dataMultiPart.close();
//	    }
//		final StreamDataBodyPart stream = new StreamDataBodyPart(file.getSubmittedFileName(), file.getInputStream());
//		 WebClient webClient = WebClient.create(this.BASE_URL+url).header("Authorization",new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));
//         webClient.encoding("UTF-8");
//         webClient.type(MediaType.MULTIPART_FORM_DATA);
//         try {
//			ContentDisposition cd = new ContentDisposition("attachment;filename="+file.getName());
//	         Attachment att = new Attachment("root", file.getInputStream());
//	         
//	         javax.ws.rs.core.Response response = webClient.post(new MultipartBody(att));
//	         System.out.println(response);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		 final FormDataBodyPart p = new FormDataBodyPart(FormDataContentDisposition.name("part").build(), "CONTENT");
//		final MultiPart multipart = new MultiPart()
//		        .bodyPart(new BodyPart(stream, MediaType.APPLICATION_OCTET_STREAM_TYPE))
//		        .bodyPart(p);
		
//		final FormDataMultiPart multipart = (FormDataMultiPart) new FormDataMultiPart()
//			    .field("file bpmn", file.getSubmittedFileName())
//			    .bodyPart(stream);
//		javax.ws.rs.client.Client client = javax.ws.rs.client.ClientBuilder.newClient();
//		client.register(LoggingFilter.class);
//		WebTarget webTarget = client.target(this.BASE_URL).path(url);
//		final Response response = webTarget.request().post(Entity.entity(multipart, multipart.getMediaType()));
//		System.out.println(response);
//		ClientConfig config = new DefaultClientConfig();			 
//        Client client = Client.create(this.applySslSecurity(config));	   
//        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));     
//        url = this.BASE_URL + url;	        
//        WebResource resource = client.resource(UrlHelper.urlEncoding(url));	   
//        ClientResponse response = resource.accept(ACCEPT_FORMAT).post(ClientResponse.class, Entity.entity(multipart, multipart.getMediaType()));
//        System.out.println(response);
//        client.destroy();
//        try {
//			multiPartEntity.close();
//	        multiPartEntity.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		final WebTarget target = // Create WebTarget.
//		final Response response = target
//		        .request()
//		        .post(Entity.entity(multiPartEntity, multiPartEntity.getMediaType()));
//		RestRequest req = new RestRequest();
//	    final Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
//	    client.addFilter(new HTTPBasicAuthFilter(req.USERNAME, req.PASSWORD));
//	    
//	    final StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream());
//        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
//        final MultiPart multiPart = formDataMultiPart.field("fileName", file.getSubmittedFileName()).bodyPart(stream);
//        if (multiPart instanceof FormDataMultiPart) {
//            final FormDataMultiPart dataMultiPart = (FormDataMultiPart) multiPart;
//            final WebTarget target = client.target(req.BASE_URL+"repository/deployments");
//		    final Response response = target.request().post(Entity.entity(dataMultiPart, dataMultiPart.getMediaType()));
//		    System.out.println(response);
//            formDataMultiPart.close();
//            dataMultiPart.close();
//            file.delete();
//        }	
//		try {
//			ClientConfig config = new DefaultClientConfig();			 
//	        Client client = Client.create(this.applySslSecurity(config));	   
//	        client.addFilter(new HTTPBasicAuthFilter(this.USERNAME, this.PASSWORD));     
//	        url = this.BASE_URL + url;	        
//	        WebResource resource = client.resource(UrlHelper.urlEncoding(url));	   
//	        final StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream());
//	        final FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
//	        final MultiPart multiPart = formDataMultiPart.field("fileName", file.getSubmittedFileName()).bodyPart(stream);
//	        
//	        if (multiPart instanceof FormDataMultiPart) {
//	            final FormDataMultiPart dataMultiPart = (FormDataMultiPart) multiPart;
//	            ClientResponse response = resource.accept(ACCEPT_FORMAT).post(ClientResponse.class, Entity.entity(dataMultiPart, dataMultiPart.getMediaType()));
//	            client.destroy();
//	            formDataMultiPart.close();
//	            dataMultiPart.close();
//	            file.delete();
//		        return response;
//	        }	
//		}catch(Exception e){
//			e.printStackTrace();
//		}
	   return null;
	}
	

	public Response post(String url, String content) {
		
		try {
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl());
	        Response response = target.request(this.getAccept_format()).post(Entity.json(content));
	        client.close();
	        return response;	      
		}catch(Exception e){
		}
	   return null;
	}
	
	public Response post(String url, String content,Object id) {
		try {
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
	        Response response = target.request(this.getAccept_format()).post(Entity.json(content));
	        client.close();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	
	public Response put(String url,String content){
		try{
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl());
	        Response response = target.request(this.getAccept_format()).put(Entity.json(content));
	        client.close();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	

	public Response put(String url,String content, Object id){
		try{
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
	        Response response = target.request(this.getAccept_format()).put(Entity.json(content));
	        client.close();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	
	public Response delete(String url,Object id){
		try{
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
	        Response response = target.request(this.getAccept_format()).delete();
	        client.close();
	        return response;
		}catch(Exception e){
		}
	   return null;
	}
	
	public void addUrl(String url){
		this.base_url += url;
	}
	public String getBase_url() {
		return base_url;
	}

	public void setBase_url(String base_url) {
		this.base_url = base_url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAccept_format() {
		return accept_format;
	}

	public void setAccept_format(String accept_format) {
		this.accept_format = accept_format;
	}

	public String getContent_type() {
		return content_type;
	}

	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}

	public ConfigurationRequest getConfig() {
		return config;
	}

	public void setConfig(ConfigurationRequest config) {
		this.config = config;
	}
}
