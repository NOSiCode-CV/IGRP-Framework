package nosi.core.webapp.import_export;

import nosi.webapps.igrp.dao.Application;

/**
 * @author: Emanuel Pereira
 * 5 Nov 2017
 */
public interface IFImportExport {

	public boolean importApp();
	public boolean importPage(Application app );
}
