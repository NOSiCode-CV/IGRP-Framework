package nosi.core.webapp.import_export_v2.common.serializable.dao;

import java.io.Serializable;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class DAOSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String path;
	private String fileName;
	private String content;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
}
