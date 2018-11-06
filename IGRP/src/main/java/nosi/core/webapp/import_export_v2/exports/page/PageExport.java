package nosi.core.webapp.import_export_v2.exports.page;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.page.PageFilesSerializable;
import nosi.core.webapp.import_export_v2.common.serializable.page.PageSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;

/**
 * Emanuel
 * 29 Oct 2018
 */
public class PageExport implements IExport{

	private List<PageSerializable> pages;
	private Config config;
	
	public PageExport() {
		this.pages = new ArrayList<>();
		this.config = new Config();
	}
	
	@Override
	public String getFileName() {
		return OptionsImportExport.PAGE.getFileName();
	}
	
	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(this.pages);
	}

	@Override
	public void add(String id) {
		Action ac = new Action().findOne(Core.toInt(id));
		PageSerializable page = new PageSerializable();
		Core.mapper(ac,page);		
		page.setDad(ac.getApplication().getDad());
		this.addConfigFiles(page,ac);
		this.addClassFiles(page,ac);
		this.pages.add(page);
	}


	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				this.add(id);
			}
			export.add(this);
		}
	}	

	protected void addClassFiles(PageSerializable page, Action ac) {
		String basePath = Path.getPath(ac.getApplication());
		basePath += "pages" + File.separator+ac.getPage().toLowerCase();
		String model = FileHelper.readFile(basePath, ac.getPage()+".java");
		String view = FileHelper.readFile(basePath, ac.getPage()+"View.java");
		String controller = FileHelper.readFile(basePath, ac.getPage()+"Controller.java");
		PageFilesSerializable pageFiles = new PageFilesSerializable();
		pageFiles.setJsonOrView(view);
		pageFiles.setXmlOrModel(model);
		pageFiles.setXslOrController(controller);
		page.setClassFiles(pageFiles);
	}
	
	protected void addConfigFiles(PageSerializable page,Action ac) {
		//Get xml, json and xsl
		String warName = new File(Igrp.getInstance().getRequest().getServletContext().getRealPath("/")).getAbsolutePath();		
		String xslXMLJsonPath =  warName + File.separator + this.config.getImageAppPath(ac.getApplication(),"2.3") + File.separator+ac.getPage().toLowerCase();
		if(FileHelper.fileExists(xslXMLJsonPath)) {
			String json = FileHelper.readFile(xslXMLJsonPath, ac.getPage()+".json");
			String xml = FileHelper.readFile(xslXMLJsonPath, ac.getPage()+".xml");
			String xsl = FileHelper.readFile(xslXMLJsonPath, ac.getPage()+".xsl");
			PageFilesSerializable pageFiles = new PageFilesSerializable();
			pageFiles.setJsonOrView(json);
			pageFiles.setXmlOrModel(xml);
			pageFiles.setXslOrController(xsl);
			page.setPageFiles(pageFiles);
		}
	}

}
