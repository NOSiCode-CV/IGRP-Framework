package nosi.core.webapp.webservices.helpers;


import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

import jakarta.ws.rs.core.HttpHeaders;
import nosi.core.webapp.Core;
import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.ContentDisposition;
import org.apache.cxf.jaxrs.ext.multipart.MultipartBody;

import com.google.gson.annotations.Expose;
import nosi.core.webapp.activit.rest.request.Credentials;

import jakarta.servlet.http.Part;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.Entity;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.CacheControl;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;


/**
 * @author: Emanuel Pereira
 * 26 Sep 2017
 *
 */

public class RestRequest{

	@Expose(serialize=false,deserialize=false)
	private String base_url;
	@Expose(serialize=false,deserialize=false)
	private String final_url;
	@Expose(serialize=false,deserialize=false)
	private Boolean useBaseUrl=true;
	@Expose(serialize=false,deserialize=false)
	private String username;
	@Expose(serialize=false,deserialize=false)
	private String password;
	@Expose(serialize=false,deserialize=false)
	private static String accept_format=MediaType.APPLICATION_JSON;
	@Expose(serialize=false,deserialize=false)
	private static final String content_type=MediaType.APPLICATION_JSON;
	@Expose(serialize=false,deserialize=false)
	private ConfigurationRequest config;
	
	
	public RestRequest() {
		 cacheControl.setNoCache(false);
		 cacheControl.setMaxAge(60); // Cache for 60 seconds
	
	}	
	CacheControl cacheControl = new CacheControl();
     

	
	public  Response get(String url, Object id) {
		try {
			Client client = this.getConfig().bluidClient();
			this.addUrl(url);
	        WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
	        Response response = target.request(this.getAccept_format()).cacheControl(cacheControl).get(Response.class);
	        client.close();
	        return response;
		}catch(Exception e){ 
			e.printStackTrace();
		}
		return null;
	}
	public <T> T get(String url, Object id, Class<T> responseType) throws Exception {
		Client client = this.getConfig().bluidClient();
		this.addUrl(url);
		WebTarget target;

		if (Core.isNotNull(id)){
			target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
		} else {
			target = client.target(this.getConfig().getUrl());
		}

		T response = target.request(this.getAccept_format()).cacheControl(cacheControl).get(responseType);
		client.close();
		return response;
	}

	public Response get(String url) {
		try {
			return this.get(url, Response.class);
		}catch(Exception e){ 
			e.printStackTrace();
		}
		return null;
	}
	public <T> T get(String url, Class<T> responseType) throws Exception {
		return this.get(url,null, responseType);
	}
	public Response post(String url, Part file, String fileExtension) throws IOException {
		return this.post( url,  file,  fileExtension, Response.class);
	}
	public <T> T post(String url, Part file, String fileExtension, Class<T> responseType) throws IOException {
		this.addUrl(url);
		Client client = this.getConfig().bluidClient();
		WebTarget target = client.target(this.getConfig().getUrl());
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+file.getName()+fileExtension+"\"");
		List<Attachment> atts = new LinkedList<>();
		atts.add(new Attachment("file", file.getInputStream(),cd));
		MultipartBody body = new MultipartBody(atts);
		T response = target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.entity(body,MediaType.MULTIPART_FORM_DATA), responseType);
		client.close();
		return response;
	}

	public Response post(String url, Part file) throws IOException {
		return this.post( url,  file, Response.class);
	}

	public <T> T post(String url, Part file, Class<T> responseType) throws IOException {
		this.addUrl(url);
		Client client = this.getConfig().bluidClient();
		WebTarget target = client.target(this.getConfig().getUrl());
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+file.getSubmittedFileName()+"\"; Content-Type=\""+file.getContentType()+"\"");
		List<Attachment> atts = new LinkedList<>();
		atts.add(new Attachment("file", file.getInputStream(),cd));
		MultipartBody body = new MultipartBody(atts);
		T response = target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.entity(body,MediaType.MULTIPART_FORM_DATA), responseType);
		client.close();
		return response;
	}

	public Response post(String url, InputStream file,String fileName,String contentType) throws IOException {
		return this.post(url, file, fileName, contentType, Response.class);
	}

	public <T> T post(String url, InputStream file,String fileName,String contentType, Class<T> responseType) {
		this.addUrl(url);
		Client client = this.getConfig().bluidClient();
		WebTarget target = client.target(this.getConfig().getUrl());
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+fileName+"\"; Content-Type=\""+contentType+"\"");
		List<Attachment> atts = new LinkedList<>();
		atts.add(new Attachment("file", file,cd));
		MultipartBody body = new MultipartBody(atts);
		T response = target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.entity(body,MediaType.MULTIPART_FORM_DATA), responseType);
		client.close();
		return response;
	}

	public Response post(String url, String content) {
		try {
			return this.post( url,  content, Response.class) ;
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public <T> T post(String url, String content, Class<T> responseType) throws Exception {
		Client client = this.getConfig().bluidClient();

		T response;
		this.addUrl(url);
		WebTarget target = client.target(this.getConfig().getUrl());

		try {
			response = target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.json(content), responseType);
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		} finally {
			client.close();
		}
		return response;
	}


	public Response post(String url, String content,Object id) {
        try {
            return this.post(url,content, id, Response.class);
        } catch (Exception e) {
			e.printStackTrace();
        }
		return null;
    }

	public <T> T post(String url, String content,Object id, Class<T> responseType) {
		Client client = this.getConfig().bluidClient();
		T response;

			this.addUrl(url);
			WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
            response = target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.json(content), responseType);

			client.close();

		return response;
	}

	public Response put(String url,String content){
		try{
		return this.put( url, content, Response.class);
		}catch(Exception e){
			e.printStackTrace();
		}
 		return null;
	}

	public <T> T put(String url,String content, Class<T> responseType) {
		Client client = this.getConfig().bluidClient();
		this.addUrl(url);
		WebTarget target = client.target(this.getConfig().getUrl());
		T response = target.request(this.getAccept_format()).put(Entity.json(content), responseType);
		client.close();
		return response;
	}

	public Response put(String url,String content, Object id){
		try{
		return put(url, content, id, Response.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public <T> T put(String url, String content, Object id, Class<T> responseType) {
		Client client = this.getConfig().bluidClient();
		this.addUrl(url);
		WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
		T response = target.request(this.getAccept_format()).put(Entity.json(content), responseType);
		client.close();
		return response;
	}

	public Response delete(String url,Object id){
        try {
            return delete(url, id, Response.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }

	public <T> T delete(String url,Object id, Class<T> responseType) {
		Client client = this.getConfig().bluidClient();
		this.addUrl(url);
		WebTarget target = client.target(this.getConfig().getUrl()).path(String.valueOf(id));
		T response = target.request(this.getAccept_format()).delete(responseType);
		client.close();
		return response;
	}
	
	public void addUrl(String url){
		final_url=(useBaseUrl?base_url:"") + url;
	}
	public String getBase_url() {
		return base_url;
	}

	public void userBaseUrl(Boolean use_base_url) {
		useBaseUrl=use_base_url;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}
	
	public String getAccept_format() {
		return accept_format;
	}

	public void setAccept_format(String accept_format) {
		RestRequest.accept_format = accept_format;
	}

	public String getContent_type() {
		return content_type;
	}

	public ConfigurationRequest getConfig() {
		return config;
	}

	public void setConfig(ConfigurationRequest config) {
		this.config = config;
	}

    public String getFinal_url() {
        return final_url;
    }
	public void setBase_url(String url) {
		base_url=url;
	}

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
