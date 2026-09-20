package nosi.core.webapp.activit.rest.services;

import com.google.gson.reflect.TypeToken;
import jakarta.ws.rs.core.MediaType;
import nosi.core.webapp.activit.rest.entities.ResourceService;
import nosi.core.webapp.activit.rest.entities.ResourcesService;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 * Emanuel
 * 14 May 2019
 */
public class ResourceServiceRest extends GenericActivitiRest{

	public ResourceService getResource(String id_deployment, String id_resource) {
		ResourceService r = new ResourceService();
		var response = this.getRestRequest().getHttpClient("repository/deployments/" + id_deployment + "/resources",
				id_resource);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				r = ResponseConverter.convertJsonToDao(contentResp, ResourceService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return r;
	}

	public String getResourceData(String id_deployment, String id_resource) {
		RestRequest request = this.getRestRequest();
		request.userBaseUrl(false);
		request.setAccept_format(MediaType.APPLICATION_XML);
		var response = request.getHttpClient("repository/deployments/" + id_deployment + "/resourcedata/", id_resource);
		String contentResp = "";
		if (response != null) {
			if (response.statusCode() == 200) {
                contentResp = response.body();
            }
		}
		return contentResp;
	}

	public String getResourceData(String link) {
		RestRequest request = this.getRestRequest();
		return request.getString(link);
	}

	@SuppressWarnings("unchecked")
	public List<ResourceService> getResources(String id_deployment) {
		List<ResourceService> d = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("repository/deployments/" + id_deployment + "/resources");
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = (List<ResourceService>) ResponseConverter.convertJsonToListDao(contentResp,
						new TypeToken<List<ResourceService>>() {
						}.getType());
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public ResourcesService getResource(String url) {
		RestRequest req = this.getRestRequest();
		ResourcesService resource = new ResourcesService();
		String contentResp = req.getString(url);
		if (contentResp != null && !contentResp.isEmpty()) {
			resource = ResponseConverter.convertJsonToDao(contentResp, ResourcesService.class);
		}
		return resource;
	}
	
	
	public String getResourceContent(String url) {
		RestRequest req = this.getRestRequest();
		req.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		byte[] content = req.getBytes(url);
		return content != null ? Base64.getEncoder().encodeToString(content) : null;
	}

}
