package nosi.core.webapp.activit.rest.services;

import nosi.core.webapp.activit.rest.entities.ResourceService;
import nosi.core.webapp.activit.rest.entities.ResourcesService;
import nosi.core.webapp.activit.rest.request.Credentials;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import com.google.common.reflect.TypeToken;

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
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				r = (ResourceService) ResponseConverter.convertJsonToDao(contentResp, ResourceService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return r;
	}

	public String getResourceData(String id_deployment, String id_resource) {
		RestRequest request = this.getRestRequest();
		request.setAccept_format(MediaType.APPLICATION_XML);
		Response response = request.get("repository/deployments/" + id_deployment + "/resourcedata/", id_resource);
		if (response != null) {
			if (response.getStatus() == 200) {
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

	public String getResourceData(String link) {
		RestRequest request = this.getRestRequest();
		String url = Credentials.getInstance().getUrl();
		link = url.contains("https") ? link.replace("http", "https") : link;
		request.setBase_url("");
		Response response = request.get(link);
		if (response != null) {
			if (response.getStatus() == 200) {
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
	public List<ResourceService> getResources(String id_deployment) {
		List<ResourceService> d = new ArrayList<>();
		Response response = this.getRestRequest().get("repository/deployments/" + id_deployment + "/resources");
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<ResourceService>) ResponseConverter.convertJsonToListDao(contentResp,
						new TypeToken<List<ResourceService>>() {
							private static final long serialVersionUID = 1L;
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
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
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				resource = (ResourcesService) ResponseConverter.convertJsonToDao(contentResp, ResourcesService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
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
				InputStream finput = (InputStream) response.getEntity();
				try {
					return FileHelper.convertInputStreamToBase64(finput);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return d;
	}

}
