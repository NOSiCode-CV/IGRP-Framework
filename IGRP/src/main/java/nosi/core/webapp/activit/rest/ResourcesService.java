package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * Emanuel
 * 6 Feb 2018
 */
public class ResourcesService extends Activit{

	private String contentUrl;
	private String mediaType;
	private String type;

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
	
	public ResourcesService getResource(String url){
		RestRequest req = new RestRequest();
		req.setBase_url("");
		Response response = req.get(url);
		ResourcesService resource = new ResourcesService();
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				resource = (ResourcesService) ResponseConverter.convertJsonToDao(contentResp,ResourcesService.class);
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return resource;
	}
	
	
	public String getResourceContent(String url){
		String d = null;
		RestRequest req = new RestRequest();
		req.setBase_url("");
		req.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = req.get(url);		
		if(response!=null){
			if(response.getStatus()==200) {
				InputStream finput =(InputStream) response.getEntity();
				try {
					 return FileHelper.convertInputStreamToBase64(finput);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return d;
	}
	@Override
	public String toString() {
		return "ResourcesService [contentUrl=" + contentUrl + ", mediaType=" + mediaType + ", type=" + type
				+ ", getId()=" + getId() + ", getUrl()=" + getUrl() + "]";
	}
	
	
}
