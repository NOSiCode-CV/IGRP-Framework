package nosi.core.webapp.activit.rest.services;

import com.google.gson.reflect.TypeToken;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import nosi.core.webapp.activit.rest.entities.ResourceService;
import nosi.core.webapp.activit.rest.entities.ResourcesService;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Emanuel
 * 14 May 2019
 */
public class ResourceServiceRest extends GenericActivitiRest{

	public ResourceService getResource(String id_deployment, String id_resource) {
		ResourceService r = new ResourceService();
		Response response = this.getRestRequest().get("repository/deployments/" + id_deployment + "/resources",
				id_resource);
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = new FileHelper().convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				r = ResponseConverter.convertJsonToDao(contentResp, ResourceService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return r;
	}

	public String getResourceData(String id_deployment, String id_resource) {
		RestRequest request = this.getRestRequest();
		request.setBase_url("");
		request.setAccept_format(MediaType.APPLICATION_XML);
		Response response = request.get("repository/deployments/" + id_deployment + "/resourcedata/", id_resource);
		String contentResp = "";
		if (response != null) {
			if (response.getStatus() == 200) {
				try {
					contentResp = new FileHelper().convertToString((InputStream) response.getEntity());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			response.close();
		}
		return contentResp;
	}

	public String getResourceData(String link) {
		RestRequest request = this.getRestRequest();
//		request.setBase_url("");
//		request.setAccept_format(MediaType.APPLICATION_XML);
//		String contentResp = "";
//        try (Response response = request.get(link)) {
//			if (response != null && response.getStatus() == 200) {
//				InputStream entity = (InputStream) response.getEntity();
//                contentResp = new FileHelper().convertToString(entity);
//				//contentResp = response.readEntity(String.class);
//            }
//		} catch (Exception e) {
//			// Handle exception
//			e.printStackTrace();
//		}

		return request.getString(link);
	}

	@SuppressWarnings("unchecked")
	public List<ResourceService> getResources(String id_deployment) {
		List<ResourceService> d = new ArrayList<>();
		Response response = this.getRestRequest().get("repository/deployments/" + id_deployment + "/resources");
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = new FileHelper().convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<ResourceService>) ResponseConverter.convertJsonToListDao(contentResp,
						new TypeToken<List<ResourceService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	public ResourcesService getResource(String url) {
		RestRequest req = this.getRestRequest();
		req.setBase_url("");
		Response response = req.get(url);
		ResourcesService resource = new ResourcesService();
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = new FileHelper().convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				resource = ResponseConverter.convertJsonToDao(contentResp, ResourcesService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return resource;
	}
	
	
	public String getResourceContent(String url) {
		String d = null;
		RestRequest req = this.getRestRequest();
		req.setBase_url("");
		req.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = req.get(url);
		if (response != null) {
			if (response.getStatus() == 200) {
				try {
					d = FileHelper.convertInputStreamToBase64((InputStream) response.getEntity());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			response.close();
		}
		return d;
	}

}
