package cv.nosi.core.webapp.ie.import_export_v2.exports.bpmn;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cv.nosi.core.webapp.ie.import_export_v2.common.OptionsImportExport;
import cv.nosi.core.webapp.ie.import_export_v2.common.Path;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.bpmn.BPMNPageFiles;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.bpmn.BPMNPages;
import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.bpmn.BPMNSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.exports.Export;
import cv.nosi.core.webapp.ie.import_export_v2.exports.IExport;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.file.FileHelper;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessDefinitionService;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessDefinitionServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.ResourceServiceRest;
import cv.nosi.webapps.igrp.dao.Action;
import cv.nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 29 Oct 2018
 */
public class BPMNExport implements IExport{

	private List<BPMNSerializable> bpmns;
	private Application application; 
	
	@Override
	public String getFileName() {
		return OptionsImportExport.BPMN.getFileName();
	}
	
	public BPMNExport(Application application) {
		this.bpmns = new ArrayList<>();
		this.application = application;
	}
	
	@Override
	public String serialization() {
		return Core.toJsonWithJsonBuilder(bpmns);
	}

	@Override
	public void add(String id) {
		ProcessDefinitionService process = new ProcessDefinitionServiceRest().getProcessDefinition(id);
		if(process!=null) {
			String link = process.getResource().replace("/resources/", "/resourcedata/");
			String xml = new ResourceServiceRest().getResourceData(link);
			BPMNSerializable bpmn = new BPMNSerializable();
			bpmn.setId(id);
			bpmn.setXml(xml);
			bpmn.setDad(this.application.getDad());
			bpmn.setFileName(process.getKey()+"_"+this.application.getDad()+".bpmn20.xml");
			bpmn.setKey(process.getKey());
			this.addClassesBPMN(bpmn,process.getKey());
			this.addPages(bpmn,process.getKey());
			this.bpmns.add(bpmn);
		}
	}

	private void addPages(BPMNSerializable bpmn, String processKey) {	
		List<Action> actions = new Action().find().where("application.dad","=",this.application.getDad()).andWhere("processKey","=",processKey.toLowerCase()).all();
		if(actions!=null) {
			List<BPMNPages> pages = new ArrayList<>();
			actions.stream().forEach(ac->{
				BPMNPages p = new BPMNPages();
				Core.mapper(ac,p);		
				p.setDad(ac.getApplication().getDad());
				p.setProcessKey(processKey);
				pages.add(p);
			});
			bpmn.setPages(pages);
		}
	}

	private void addClassesBPMN(BPMNSerializable bpmn,String processKey) {
		String basePath = Path.getPath(this.application);
		basePath += "process" + File.separator + processKey + File.separator;
		Map<String, String> files = new FileHelper().readAllFileDirectory(basePath);
		if(files!=null) {
			List<BPMNPageFiles> pageFiles = new ArrayList<>();
			files.entrySet().stream().forEach(file->{
				if(file.getValue().endsWith(".java")) {
					BPMNPageFiles p = new BPMNPageFiles();
					p.setFileContent(FileHelper.readFile(file.getValue(),""));
					p.setFileName(file.getKey());
					pageFiles.add(p);
				}
			});
			bpmn.setPageFiles(pageFiles);
		}
	}

	@Override
	public void export(Export export, String[] ids) {
		if(ids!=null) {
			for(String id:ids) {
				if(Core.isNotNull(id))
					this.add(id);
			}
			export.add(this);	
		}
	}

}