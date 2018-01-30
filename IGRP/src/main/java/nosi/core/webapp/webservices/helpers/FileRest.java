package nosi.core.webapp.webservices.helpers;
/**
 * Emanuel
 * 29 Jan 2018
 */

import java.io.InputStream;

public class FileRest {

	private Integer size;
	private InputStream content;
	private String contentType;
	
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public InputStream getContent() {
		return content;
	}
	public void setContent(InputStream content) {
		this.content = content;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
}
