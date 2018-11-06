package nosi.core.webapp.import_export_v2.common;

import java.io.File;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 3 Nov 2018
 */
public class Path {

	public static String getPath(Application application) {
		Config config = new Config();
		String basePath = config.getWorkspace();
		if(Core.isNotNull(basePath) && FileHelper.dirExists(basePath)) {
			basePath = config.getBasePahtClassWorkspace(application.getDad()) + File.separator; 			
		}else {
			basePath = config.getPathServerClass(application.getDad());
		}
		return basePath;
	}

	public static String getPathImages(Action action) {
		Config config = new Config();
		String basePath = config.getWorkspace();
		
		if (Core.isNotNull(basePath) && FileHelper.fileExists(basePath)) {
			basePath +=  File.separator + config.getWebapp()
					+ File.separator + "images" + File.separator + "IGRP"+File.separator+"IGRP" + action.getVersion()
					+ File.separator+"app"+File.separator + action.getApplication().getDad().toLowerCase() + File.separator + action.getPage().toLowerCase();
		}else {
			basePath = config.getCurrentBaseServerPahtXsl(action);
		}
		return basePath;
	}
}
