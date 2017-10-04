package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;
import nosi.core.webapp.helpers.ResponseError;
import nosi.core.webapp.helpers.RestRequestHelper;

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
	
	public ResourceService() {
		// TODO Auto-generated constructor stub
	}
	

	public ResourceService getResource(String id_deployment,String id_resource){
		ResourceService d = new ResourceService();
		ClientResponse response = RestRequestHelper.get("repository/deployments/"+id_deployment+"/resources",id_resource);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (ResourceService) RestRequestHelper.convertJsonToDao(contentResp, ResourceService.class);
			}else{
				d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public ResourceService getResourceData(String id_deployment,String id_resource){
		ResourceService d = new ResourceService();
		ClientResponse response = RestRequestHelper.get("repository/deployments/"+id_deployment+"/resourcedata/",id_resource);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (ResourceService) RestRequestHelper.convertJsonToDao(contentResp, ResourceService.class);
			}else{
				d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	@SuppressWarnings("unchecked")
	public List<ResourceService> getResources(String id_deployment){
		List<ResourceService> d = new ArrayList<>();
		ClientResponse response = RestRequestHelper.get("repository/deployments/"+id_deployment+"/resources");
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (List<ResourceService>) RestRequestHelper.convertJsonToListDao(contentResp, new TypeToken<List<ResourceService>>(){}.getType());
			}else{
				this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
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
