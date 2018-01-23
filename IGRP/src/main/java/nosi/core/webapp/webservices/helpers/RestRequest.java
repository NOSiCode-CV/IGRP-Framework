package nosi.core.webapp.webservices.helpers;

import java.io.IOException;
import javax.servlet.http.Part;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.ContentDisposition;
import org.apache.cxf.jaxrs.ext.multipart.MultipartBody;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.file.StreamDataBodyPart;

import com.google.gson.annotations.Expose;

import nosi.webapps.igrp.dao.Config;


/**
 * @author: Emanuel Pereira
 * 26 Sep 2017
 * @param <T>
 */

public class RestRequest{

	@Expose(serialize=false,deserialize=false)
	private String base_url;
	@Expose(serialize=false,deserialize=false)
	private String username;
	@Expose(serialize=false,deserialize=false)
	private String password;
	@Expose(serialize=false,deserialize=false)
	private String accept_format;
	@Expose(serialize=false,deserialize=false)
	private String content_type;
	@Expose(serialize=false,deserialize=false)
	private ConfigurationRequest config;
	
	public RestRequest() {
		this.base_url = new Config().find().andWhere("name", "=", "url_ativiti_connection").one().getValue(); 
		this.username = new Config().find().andWhere("name", "=", "ativiti_user").one().getValue();
		this.password = new Config().find().andWhere("name", "=", "ativiti_password").one().getValue();
		this.accept_format = MediaType.APPLICATION_JSON;
		this.content_type  = MediaType.APPLICATION_JSON;
		this.config = new ConfigurationRequest(this);
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
//		 	final Client client = this.getConfig().bluidClient(); 
//	        final StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream()); 
//	        FormDataMultiPart formDataMultiPart = new FormDataMultiPart(); 
//	        final MultiPart multiPart = formDataMultiPart.field("fileName", file.getSubmittedFileName()).bodyPart(stream); 
//	        if (multiPart instanceof FormDataMultiPart) { 
//	            final FormDataMultiPart dataMultiPart = (FormDataMultiPart) multiPart; 
//	            ContentDisposition cd = new ContentDisposition("attachment;filename="+file.getSubmittedFileName());
//	            Attachment att = new Attachment(file.getName(), file.getInputStream(),cd);
//	            dataMultiPart.bodyPart(new MultipartBody(att),MediaType.MULTIPART_FORM_DATA_TYPE);
//	            final WebTarget target = client.target(this.getConfig().getUrl()); 
//	            final Response response = target.request().post(Entity.entity(dataMultiPart, dataMultiPart.getMediaType())); 
//	            formDataMultiPart.close(); 
//	            dataMultiPart.close();
//	            client.close();
//	            return response;
//	        }
//	        formDataMultiPart.close(); 
//            client.close();
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
			WebTarget target = client.target(this.getConfig().getUrl());
		    ContentDisposition cd = new ContentDisposition("attachment;filename="+file.getSubmittedFileName());
	        Attachment att = new Attachment(file.getName(), file.getInputStream(),cd);
			Response response = target.request(this.getAccept_format())
									  .header("Content-Type", "multipart/form-data")
									  .post(Entity.entity(new MultipartBody(att),MediaType.MULTIPART_FORM_DATA));
			System.out.println(response.getStatus());
			client.close();
			return response;
//			final FileDataBodyPart filePart = new FileDataBodyPart("my_pom", new File("C:\\Users\\Emanuel\\Desktop\\diagram.xml"));
//			 
//			final FormDataMultiPart multipart = (FormDataMultiPart) new FormDataMultiPart()
//			    .field("foo", "bar")
//			    .bodyPart(filePart);
//			Client client = this.getConfig().bluidClientMultiPart();
//			this.addUrl(url);
//			WebTarget target = client.target(this.getConfig().getUrl());
//			final Response response = target.request().post(Entity.entity(multipart, multipart.getMediaType()));
//			return response;
//	        return null;
		
//		StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream()); 
//		FormDataMultiPart multipart = (FormDataMultiPart) new FormDataMultiPart()
//			    .bodyPart(stream);
//		Client client = this.getConfig().bluidClient();
//		this.addUrl(url);
//		WebTarget target = client.target(this.getConfig().getUrl());
//		Response response = target.request(this.getAccept_format()).header("Content-Type", MediaType.MULTIPART_FORM_DATA).post(Entity.entity(multipart,MediaType.MULTIPART_FORM_DATA));
//		client.close();
//		return response;
//		final StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream(),file.getSubmittedFileName()); 
//
//		Client client = this.getConfig().bluidClientMultiPart();
//		this.addUrl(url);
//		WebTarget target = client.target(this.getConfig().getUrl());
//		StreamDataBodyPart stream = new StreamDataBodyPart("file", file.getInputStream()); 
//		FormDataMultiPart multipart = (FormDataMultiPart) new FormDataMultiPart()
//			    .bodyPart(stream);
//		Response response = target.request(this.getAccept_format()).post(Entity.entity(multipart,MediaType.MULTIPART_FORM_DATA));
//		multipart.close();
//		client.close();		
//		return response;
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
