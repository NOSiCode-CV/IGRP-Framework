package nosi.core.webapp.import_export_v2.common.serializable.bpmn;

import java.io.Serializable;
import java.util.List;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class BPMNSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String key;
	private String xml;
	private String dad;
	private String fileName;
	
	private List<BPMNPageFiles> pageFiles;
	private List<BPMNPages> pages;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXml() {
		return xml;
	}
	public void setXml(String xml) {
		this.xml = xml;
	}
	public List<BPMNPageFiles> getPageFiles() {
		return pageFiles;
	}
	public void setPageFiles(List<BPMNPageFiles> pageFiles) {
		this.pageFiles = pageFiles;
	}
	public List<BPMNPages> getPages() {
		return pages;
	}
	public void setPages(List<BPMNPages> pages) {
		this.pages = pages;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	
}
