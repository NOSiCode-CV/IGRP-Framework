package nosi.webapps.igrp.pages.page;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;

import javax.servlet.ServletException;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.UncheckedIOException;

/**
 * Emanuel
 * 18 Jul 2019
 */
public class PageFile {

	private String fileXml;
	private String fileJson;
	private String fileXsl;
	private String fileModel;
	private String fileView;
	private String fileController;

	public PageFile() {
		try {
			Part xmlPart = Core.getFile("p_page_xml");
			Part dataPart = Core.getFile("p_data");
			Part xslPart = Core.getFile("p_page_xsl");
			Part modelPart = Core.getFile("p_model");
			Part viewFile = Core.getFile("p_view");
			Part controllerPart = Core.getFile("p_controller");

			if(xmlPart!=null) {
				this.setFileXml(FileHelper.convertToString(xmlPart.getInputStream()));
            }
			if(dataPart!=null) {
				this.setFileJson(FileHelper.convertToString(dataPart.getInputStream()));
			}
			if(xslPart!=null) {
				this.setFileXsl(FileHelper.convertToString(xslPart.getInputStream()));
			}
			if(modelPart!=null) {
				this.setFileModel(FileHelper.convertToString(modelPart.getInputStream()));
			}
			if(viewFile!=null) {
				this.setFileView(FileHelper.convertToString(viewFile.getInputStream()));
			}
			if(controllerPart!=null) {
				this.setFileController(FileHelper.convertToString(controllerPart.getInputStream()));
			}
            if (xmlPart != null) {
                xmlPart.delete();
            }
            if (dataPart != null) {
                dataPart.delete();
            }
            if (xslPart != null) {
                xslPart.delete();
            }
            if (modelPart != null) {
                modelPart.delete();
            }
            if (viewFile != null) {
                viewFile.delete();
            }
            if (controllerPart != null) {
                controllerPart.delete();
            }
        } catch (IOException | ServletException | UncheckedIOException e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getFileXml() {
		return fileXml;
	}
	public void setFileXml(String fileXml) {
		this.fileXml = fileXml;
	}
	public String getFileJson() {
		return fileJson;
	}
	public void setFileJson(String fileJson) {
		this.fileJson = fileJson;
	}
	public String getFileXsl() {
		return fileXsl;
	}
	public void setFileXsl(String fileXsl) {
		this.fileXsl = fileXsl;
	}
	public String getFileModel() {
		return fileModel;
	}
	public void setFileModel(String fileModel) {
		this.fileModel = fileModel;
	}
	public String getFileView() {
		return fileView;
	}
	public void setFileView(String fileView) {
		this.fileView = fileView;
	}
	public String getFileController() {
		return fileController;
	}
	public void setFileController(String fileController) {
		this.fileController = fileController;
	}
	
	public boolean xslFileExists() {
		return Core.isNotNull(this.getFileXsl());
	}
	
	public boolean xmlFileExists() {
		return Core.isNotNull(this.getFileXml());
	}	
	
	public boolean jsonFileExists() {
		return Core.isNotNull(this.getFileJson());
	}
	
	public boolean modelFileExists() {
		return Core.isNotNull(this.getFileModel());
	}
	
	public boolean viewFileExists() {
		return Core.isNotNull(this.getFileView());
	}	
	
	public boolean controllerFileExists() {
		return Core.isNotNull(this.getFileController());
	}

	public boolean isAllFileExists() {
		return this.modelFileExists() && this.viewFileExists() && this.controllerFileExists()
				&& this.jsonFileExists() && this.xmlFileExists() && this.xslFileExists();
	}
}
