package nosi.core.webapp.import_export_v2.imports.application;

import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.serializable.application.ApplicationSerializable;
import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.webapps.igrp.dao.Application;
import nosi.core.webapp.import_export_v2.imports.AbstractImport;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ApplicationImport extends AbstractImport implements IImport{

	private ApplicationSerializable appSerializable;
	private Application application;
	
	public ApplicationImport(Application application) {
		super();
		this.application = application;
	}

	@Override
	public void deserialization(String jsonContent) {
		if(Core.isNotNull(jsonContent)) {
			this.appSerializable = (ApplicationSerializable) Core.fromJson(jsonContent, ApplicationSerializable.class);	
		}
	}

	@Override
	public void execute() {
		if(this.application==null) {//Caso import não for associado a uma aplicacao
			if(this.appSerializable!=null) {
				Application application = new Application().findByDad(this.appSerializable.getDad());
				if(application==null) {
					application = new Application();
					application.setDad(this.appSerializable.getDad());
					application.setDescription(this.appSerializable.getDescription());
					application.setExternal(this.appSerializable.getExterno());
					application.setImg_src(this.appSerializable.getImg_src());
					application.setName(this.appSerializable.getName());
					application.setStatus(this.appSerializable.getStatus());
					application.setUrl(this.appSerializable.getUrl());
					application.setTemplate(this.appSerializable.getTemplate());
					application = application.insert();
					this.addError(application.hasError()?application.getError().get(0):null);
				}
				this.application = application;
			}
		}
	}


	public Application getApplication() {
		if(this.application==null) {
			this.execute();
		}
		return this.application;
	}
}
