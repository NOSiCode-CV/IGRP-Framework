package nosi.core.webapp.import_export_v2.common.serializable.page;

import java.io.Serializable;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class PageFilesSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String xmlOrModel;
	private String jsonOrView;
	private String xslOrController;
	
	public String getXmlOrModel() {
		return xmlOrModel;
	}
	public void setXmlOrModel(String xmlOrModel) {
		this.xmlOrModel = xmlOrModel;
	}
	public String getJsonOrView() {
		return jsonOrView;
	}
	public void setJsonOrView(String jsonOrView) {
		this.jsonOrView = jsonOrView;
	}
	public String getXslOrController() {
		return xslOrController;
	}
	public void setXslOrController(String xslOrController) {
		this.xslOrController = xslOrController;
	}
	
	
}
