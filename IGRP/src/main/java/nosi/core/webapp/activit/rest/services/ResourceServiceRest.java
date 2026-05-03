package nosi.core.webapp.activit.rest.services;

import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.activit.rest.entities.ResourceService;
import nosi.core.webapp.activit.rest.entities.ResourcesService;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
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
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				r = (ResourceService) ResponseConverter.convertJsonToDao(contentResp, ResourceService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return r;
	}

	public String getResourceData(String id_deployment, String id_resource) {
		RestRequest request = this.getRestRequest();
		request.userBaseUrl(false);
		request.setAccept_format(MediaType.APPLICATION_XML);
		Response response = request.get("repository/deployments/" + id_deployment + "/resourcedata/", id_resource);
		String contentResp = "";
		if (response != null) {
			if (response.getStatus() == 200) {
				try {
					contentResp = FileHelper.convertToString((InputStream) response.getEntity());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			response.close();
		}
		return contentResp;
	}

	private static final Logger log = LogManager.getLogger(ResourceServiceRest.class);
	private static final int MAX_REDIRECTS = 5;

	public String getResourceData(String link) {
		RestRequest request = this.getRestRequest();
		request.userBaseUrl(false);
		request.setAccept_format(MediaType.APPLICATION_XML);

		String currentLink = link;
		int redirectCount = 0;

		while (redirectCount <= MAX_REDIRECTS) {
			try (Response response = request.get(currentLink)) {
				if (response == null) return "";

				int status = response.getStatus();

				if (isRedirect(status)) {
					String location = response.getHeaderString("Location");
					if (location == null) {
						log.warn("Redirect with no Location header for: {}", currentLink);
						return "";
					}
					currentLink = normalizeUrl(location);
					redirectCount++;
					continue;
				}

				if (status == 200) {
					return response.readEntity(String.class);
				}

				log.warn("Unexpected status {} for: {}", status, currentLink);
				return "";

			} catch (Exception e) {
				log.error("Failed to fetch resource data from: {}", currentLink, e);
				return "";
			}
		}

		log.error("Too many redirects ({}+) starting from: {}", MAX_REDIRECTS, link);
		return "";
	}

	private boolean isRedirect(int status) {
		return status == 301 || status == 302 || status == 303
				|| status == 307 || status == 308;
	}

	private String normalizeUrl(String url) {
		return url.startsWith("http://") ? url.replaceFirst("http://", "https://") : url;
	}


	@SuppressWarnings("unchecked")
	public List<ResourceService> getResources(String id_deployment) {
		List<ResourceService> d = new ArrayList<>();
		Response response = this.getRestRequest().get("repository/deployments/" + id_deployment + "/resources");
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
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
		req.userBaseUrl(false);
		Response response = req.get(url);
		ResourcesService resource = new ResourcesService();
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				resource = (ResourcesService) ResponseConverter.convertJsonToDao(contentResp, ResourcesService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return resource;
	}
	
	
	public String getResourceContent(String url) {
		String d = null;
		RestRequest req = this.getRestRequest();
		req.userBaseUrl(false);
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
