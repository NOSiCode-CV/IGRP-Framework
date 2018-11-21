package nosi.core.webapp.import_export_v2.imports.bpmn;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.DeploymentService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.CompilerFile;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.webapp.import_export_v2.common.serializable.bpmn.BPMNSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import java.io.File;
import java.io.IOException;
import java.util.List;
import com.google.gson.reflect.TypeToken;

/**
 * Emanuel
 * 2 Nov 2018
 */
public class BpmnImport implements IImport {
	
	private List<BPMNSerializable> bpmns;
	private String error = "";
	private Application application;	
	private CompilerFile compiler;
	
	public BpmnImport(Application application) {
		super();
		this.application = application;
		this.compiler = new CompilerFile();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.bpmns = (List<BPMNSerializable>) Core.fromJson(jsonContent, new TypeToken<List<BPMNSerializable>>() {}.getType());
		}
	}

	@Override
	public void execute() {
		if(this.bpmns!=null) {
			this.bpmns.stream().forEach(bpmn->{
				if(this.application==null) {
					 this.application = new Application().findByDad(bpmn.getDad());
				}
				this.saveBPMN(bpmn);
				this.savePagesBPMN(bpmn);
				this.savePagesFile(bpmn);
			});
			this.compiler.compile();
			this.addError(this.compiler.getError());
		}
	}

	private void savePagesFile(BPMNSerializable bpmn) {
		if(bpmn.getPageFiles()!=null) {
			bpmn.getPageFiles().stream().forEach(page->{
				String basePath = Path.getPath(this.application);
				basePath += "process" + File.separator + bpmn.getKey() + File.separator;
				try {
					FileHelper.save(basePath, page.getFileName(), page.getFileContent());
					this.compiler.addFileName(basePath+page.getFileName());
				} catch (IOException e) {
					this.addError(e.getMessage());
				}
			});
		}
	}

	private void savePagesBPMN(BPMNSerializable bpmn) {
		if(bpmn.getPages()!=null) {
			bpmn.getPages().stream().forEach(page->{
				Action ac = new Action();
				Core.mapper(page, ac);
				ac.setApplication(this.application);
				ac = ac.insert();
				this.addError(ac.hasError()?ac.getError().get(0):null);
			});
		}
	}

	private void saveBPMN(BPMNSerializable bpmn) {
		DeploymentService deploy = new DeploymentService();
		try {
			deploy = deploy.create(FileHelper.convertStringToInputStream(bpmn.getXml()),this.application.getDad(), bpmn.getFileName(),Core.MimeType.APPLICATION_BIN);
			if(deploy!=null && deploy.hashError())
				this.addError(deploy.getError().getMessage());
		} catch (IOException e) {
			this.addError(e.getMessage());
		}
	}

	@Override
	public void addError(String error) {
		if(Core.isNotNull(error))
			this.error += error+"\n";
	}

	@Override
	public String getError() {
		return this.error;
	}

}
