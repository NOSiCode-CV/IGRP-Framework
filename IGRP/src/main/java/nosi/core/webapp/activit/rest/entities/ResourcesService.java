package nosi.core.webapp.activit.rest.entities;

/**
 * Emanuel
 * 6 Feb 2018
 */
public class ResourcesService extends Activiti implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	
	@Override
	public String toString() {
		return "ResourcesService [contentUrl=" + contentUrl + ", mediaType=" + mediaType + ", type=" + type
				+ ", getId()=" + getId() + ", getUrl()=" + getUrl() + "]";
	}
	
	
}
