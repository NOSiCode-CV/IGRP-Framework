package cv.nosi.core.webapp.ie.import_export_v2.imports.application;

import java.util.List;
import java.util.stream.Collectors;

import cv.nosi.core.webapp.ie.import_export_v2.common.serializable.application.ApplicationSerializable;
import cv.nosi.core.webapp.ie.import_export_v2.imports.AbstractImport;
import cv.nosi.core.webapp.ie.import_export_v2.imports.IImport;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ApplicationImport extends AbstractImport implements IImport{

	private ApplicationSerializable appSerializable;
	private Application application;
	private boolean allowPermission = false;
	
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
					this.allowPermission = true;
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
				}else {
					this.allowImport(application);
					this.application = application;
				}
			}
		}
	}


	public Application getApplication() {
		if(this.application==null) {
			this.execute();
		}
		return this.application;
	}
	

	private void allowImport(Application application) {
		List<Application> myApp = application.getListMyApp(Core.getCurrentUser().getId());
		this.allowPermission = myApp.stream().map(Application::getDad).collect(Collectors.toList()).contains(application.getDad());
	}

	public boolean allowPermissionImport() {		
		return allowPermission;
	}
}
