package nosi.core.webapp.import_export_v2.exports.application;

import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.core.webapp.import_export_v2.common.serializable.application.ApplicationSerializable;
import nosi.core.webapp.import_export_v2.exports.Export;
import nosi.core.webapp.import_export_v2.exports.IExport;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ApplicationExport implements IExport{

	private Application application;
	private ApplicationSerializable applicationSerializable;
	
	public ApplicationExport(Application application) {
		super();
		this.application = application;
		this.applicationSerializable = new ApplicationSerializable();
	}

	@Override
	public String getFileName() {
		return OptionsImportExport.APP.getFileName();
	}

	@Override
	public String serialization() {
		Core.mapper(this.application, this.applicationSerializable);
		this.applicationSerializable.setVersion(new Config().VERSION);
		return Core.toJsonWithJsonBuilder(this.applicationSerializable);
	}

	@Override
	public void export(Export export, String[] ids) {
		export.add(this);
	}

	@Override
	public void add(String id) {
		
	}

}
