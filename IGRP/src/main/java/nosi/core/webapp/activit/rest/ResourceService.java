package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class ResourceService {

	private String id;
	private String url;
	private String contentUrl;
	private String mediaType;
	private String type;
	@Expose(serialize=false,deserialize=false)
	private ResponseError error;
	@Expose(serialize=false,deserialize=false)
	private RestRequest request;
	public ResourceService() {
		this.request  = new RestRequest();
	}
	

	public ResourceService getResource(String id_deployment,String id_resource){
		ResourceService r = this;
		Response response = new RestRequest().get("repository/deployments/"+id_deployment+"/resources",id_resource);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				r = (ResourceService) ResponseConverter.convertJsonToDao(contentResp,ResourceService.class);
			}else{
				r.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return r;
	}
	

	public String getResourceData(String id_deployment,String id_resource){
		this.request.setAccept_format(MediaType.APPLICATION_XML);
		Response response = this.request.get("repository/deployments/"+id_deployment+"/resourcedata/",id_resource);
		if(response!=null){
			if(response.getStatus()==200) {
				String contentResp = "";
				InputStream is = (InputStream) response.getEntity();
				try {
					contentResp = FileHelper.convertToString(is);
				} catch (IOException e) {
					e.printStackTrace();
				}
				return contentResp;
			}
		}
		return "";
	}
	
	public String getResourceData(String link){
		this.request.setBase_url(url);
		Response response = this.request.get(link);
		if(response!=null){
			if(response.getStatus()==200) {
				String contentResp = "";
				InputStream is = (InputStream) response.getEntity();
				try {
					contentResp = FileHelper.convertToString(is);
				} catch (IOException e) {
					e.printStackTrace();
				}
				return contentResp;
			}
		}
		return "";
	}
	

	@SuppressWarnings("unchecked")
	public List<ResourceService> getResources(String id_deployment){
		List<ResourceService> d = new ArrayList<>();
		Response response = new RestRequest().get("repository/deployments/"+id_deployment+"/resources");
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				d = (List<ResourceService>) ResponseConverter.convertJsonToListDao(contentResp, new TypeToken<List<ResourceService>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	
	
	public RestRequest getRequest() {
		return request;
	}


	public void setRequest(RestRequest request) {
		this.request = request;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getMediaType() {
		return mediaType;
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public ResponseError getError() {
		return error;
	}

	public void setError(ResponseError error) {
		this.error = error;
	}
	
	
}
