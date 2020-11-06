package nosi.core.webapp.import_export_v2.imports.dao;

import nosi.core.webapp.import_export_v2.imports.IImport;
import nosi.core.webapp.import_export_v2.imports.others_class.OthersClassImport;
import nosi.webapps.igrp.dao.Application;
/**
 * Emanuel
 * 2 Nov 2018
 */
public class DaoImport  extends OthersClassImport implements IImport{

	public DaoImport(Application application) {
		super(application);
	}
}
