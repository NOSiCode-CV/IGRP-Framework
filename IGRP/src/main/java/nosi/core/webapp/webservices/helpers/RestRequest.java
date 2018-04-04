package nosi.core.webapp.webservices.helpers;


import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.Part;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.ContentDisposition;
import org.apache.cxf.jaxrs.ext.multipart.MultipartBody;
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
	
	public Response post(String url, Part file, String fileExtension) throws IOException {	
		this.addUrl(url);
		Client client = this.getConfig().bluidClient();
		WebTarget target = client.target(this.getConfig().getUrl());
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+file.getName()+fileExtension+"\"");
		List<Attachment> atts = new LinkedList<Attachment>();
		atts.add(new Attachment("file", file.getInputStream(),cd));
		MultipartBody body = new MultipartBody(atts);
		Response response = target.request(this.getAccept_format()).post(Entity.entity(body,MediaType.MULTIPART_FORM_DATA));
		client.close();	
		return response;
	}
	

	public Response post(String url, Part file) throws IOException {	
		this.addUrl(url);
		Client client = this.getConfig().bluidClient();
		WebTarget target = client.target(this.getConfig().getUrl());
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+file.getSubmittedFileName()+"\"; Content-Type=\""+file.getContentType()+"\"");
		List<Attachment> atts = new LinkedList<Attachment>();
		atts.add(new Attachment("file", file.getInputStream(),cd));
		MultipartBody body = new MultipartBody(atts);
		Response response = target.request(this.getAccept_format()).post(Entity.entity(body,MediaType.MULTIPART_FORM_DATA));
		client.close();	
		return response;
	}
	
	public Response post(String url, InputStream file,String fileName,String contentType) throws IOException {	
		this.addUrl(url);
		Client client = this.getConfig().bluidClient();
		WebTarget target = client.target(this.getConfig().getUrl());
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+fileName+"\"; Content-Type=\""+contentType+"\"");
		List<Attachment> atts = new LinkedList<Attachment>();
		atts.add(new Attachment("file", file,cd));
		MultipartBody body = new MultipartBody(atts);
		Response response = target.request(this.getAccept_format()).post(Entity.entity(body,MediaType.MULTIPART_FORM_DATA));
		client.close();	
		return response;
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
			e.printStackTrace();
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
			e.printStackTrace();
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
			e.printStackTrace();
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
			e.printStackTrace();
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
			e.printStackTrace();
		}
	   return null;
	}
	
	public void addUrl(String url){
		url = new Config().find().andWhere("name", "=", "url_ativiti_connection").one().getValue().contains("https")?url.replace("http", "https").replace("httpss", "https"):url;
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
