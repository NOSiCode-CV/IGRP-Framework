package cv.nosi.core.webapp.ie.import_export;

import cv.nosi.webapps.igrp.dao.Action;
import cv.nosi.webapps.igrp.dao.Application;

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
