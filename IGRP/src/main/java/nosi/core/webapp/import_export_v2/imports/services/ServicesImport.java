package nosi.core.webapp.import_export_v2.imports.services;

import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.core.webapp.import_export_v2.imports.others_class.OthersClassImport;
import nosi.webapps.igrp.dao.Application;
/**
 * Emanuel
 * 2 Nov 2018
 */
public class ServicesImport extends OthersClassImport implements IImport{

	public ServicesImport(Application application) {
		super(application);
	}
}
