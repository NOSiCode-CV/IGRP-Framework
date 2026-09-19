package nosi.core.webapp.webservices.helpers;


import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.function.Function;

import nosi.core.webapp.Core;
import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.ContentDisposition;
import org.apache.cxf.jaxrs.ext.multipart.MultipartBody;

import com.google.gson.annotations.Expose;

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
	private String accept_format=MediaType.APPLICATION_JSON;
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
			return execute(url, id, true, target ->
					target.request(this.getAccept_format()).cacheControl(cacheControl).get(Response.class));
		}catch(Exception e){ 
			e.printStackTrace();
		}
		return null;
	}
	public <T> T get(String url, Object id, Class<T> responseType) throws Exception {
		return execute(url, id, Core.isNotNull(id), target ->
				target.request(this.getAccept_format()).cacheControl(cacheControl).get(responseType));
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
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+file.getName()+fileExtension+"\"");
		try (InputStream stream = file.getInputStream()) {
			return postMultipart(url, stream, cd, responseType);
		}
	}

	public Response post(String url, Part file) throws IOException {
		return this.post( url,  file, Response.class);
	}

	public <T> T post(String url, Part file, Class<T> responseType) throws IOException {
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+file.getSubmittedFileName()+"\"; Content-Type=\""+file.getContentType()+"\"");
		try (InputStream stream = file.getInputStream()) {
			return postMultipart(url, stream, cd, responseType);
		}
	}

	public Response post(String url, InputStream file,String fileName,String contentType) throws IOException {
		return this.post(url, file, fileName, contentType, Response.class);
	}

	public <T> T post(String url, InputStream file,String fileName,String contentType, Class<T> responseType) {
		ContentDisposition cd = new ContentDisposition("form-data; name=\"file\";filename=\""+fileName+"\"; Content-Type=\""+contentType+"\"");
		return postMultipart(url, file, cd, responseType);
	}

	private <T> T postMultipart(String url, InputStream file, ContentDisposition disposition, Class<T> responseType) {
		MultipartBody body = new MultipartBody(List.of(new Attachment("file", file, disposition)));
		return execute(url, null, false, target -> target.request(this.getAccept_format())
				.cacheControl(cacheControl).post(Entity.entity(body, MediaType.MULTIPART_FORM_DATA), responseType));
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
		return execute(url, null, false, target -> {
			try {
				return target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.json(content), responseType);
			} catch (Exception e) {
				throw new IllegalArgumentException(e);
			}
		});
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
		return execute(url, id, true, target ->
				target.request(this.getAccept_format()).cacheControl(cacheControl).post(Entity.json(content), responseType));
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
		return execute(url, null, false, target ->
				target.request(this.getAccept_format()).put(Entity.json(content), responseType));
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
		return execute(url, id, true, target ->
				target.request(this.getAccept_format()).put(Entity.json(content), responseType));
	}

	private void bufferResponseEntity(Object response) {
		if (response instanceof Response entityResponse) {
			try {
				entityResponse.bufferEntity();
			} catch (RuntimeException e) {
				entityResponse.close();
				throw e;
			}
		}
	}

	private <T> T execute(String url, Object id, boolean appendId, Function<WebTarget, T> operation) {
		Client client = this.getConfig().bluidClient();
		try {
			this.addUrl(url);
			WebTarget target = client.target(this.getConfig().getUrl());
			if (appendId) {
				target = target.path(String.valueOf(id));
			}
			T response = operation.apply(target);
			// Keep Response bodies readable after closing the per-request client.
			bufferResponseEntity(response);
			return response;
		} finally {
			client.close();
		}
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
		return execute(url, id, true, target -> target.request(this.getAccept_format()).delete(responseType));
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
		this.accept_format = accept_format;
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
