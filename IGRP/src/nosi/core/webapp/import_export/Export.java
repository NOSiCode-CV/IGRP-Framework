package nosi.core.webapp.import_export;

import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * @author: Emanuel Pereira
 * 5 Nov 2017
 */
public class Export {

	public boolean exportApp(Application app) {
		return true;
	}

	public boolean exportPage(Action page) {
		return false;
	}
}
