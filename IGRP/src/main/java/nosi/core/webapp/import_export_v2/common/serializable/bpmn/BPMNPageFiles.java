package nosi.core.webapp.import_export_v2.common.serializable.bpmn;

import java.io.Serializable;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class BPMNPageFiles implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileName;
	private String fileContent;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileContent() {
		return fileContent;
	}
	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}
	
	@Override
	public String toString() {
		return "BPMNPageFiles [fileName=" + fileName + ", fileContent=" + fileContent + "]";
	}
	
	
}
