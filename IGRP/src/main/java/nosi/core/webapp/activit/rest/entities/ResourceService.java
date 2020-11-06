package nosi.core.webapp.activit.rest.entities;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class ResourceService  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String url;
	private String contentUrl;
	private String mediaType;
	private String type;


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

	@Override
	public String toString() {
		return "ResourceService [id=" + id + ", url=" + url + ", contentUrl=" + contentUrl + ", mediaType=" + mediaType
				+ ", type=" + type + "]";
	}


	
}
