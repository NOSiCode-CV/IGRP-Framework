package nosi.core.webapp.import_export;

import nosi.webapps.igrp.dao.Application;

/**
 * @author: Emanuel Pereira
 * 5 Nov 2017
 */
public interface IFImportExport {

	boolean importApp();
	boolean importPage(Application app);
}
