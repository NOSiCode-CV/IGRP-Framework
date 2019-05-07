package nosi.core.webapp.import_export_v2.common;

import java.io.File;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.FileHelper;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;

/**
 * Emanuel
 * 3 Nov 2018
 */
public class Path {

	public static String getPathHibernateConfig() {
		Config config = new Config();
		String basePath = config.getPathWorkspaceResources();
		if(Core.isNull(config.getWorkspace())) {
			basePath = config.getBasePathClass();
		}
		return basePath;
	}
	public static String getPath(Application application) {
		if(application!=null)
			return getPath(application.getDad());
		return null;
	}

	
	public static String getBasePath() {
		Config config = new Config();
		String basePath = config.getWorkspace();
		if(Core.isNotNull(basePath) && FileHelper.dirExists(basePath)) {
			basePath = config.getRawBasePathClassWorkspace(); 			
		}else {
			basePath = config.getBasePathClass();
		}
		return basePath;
	}
	
	public static String getPath(String dad) {
		Config config = new Config();
		String basePath = config.getWorkspace();
		if(Core.isNotNull(basePath) && FileHelper.dirExists(basePath)) {
			basePath = config.getBasePahtClassWorkspace(dad) + File.separator; 			
		}else {
			basePath = config.getPathServerClass(dad);
		}
		return basePath;
	}

	public static String getImageWorkSpace(String nameApp) {
		Config config = new Config();
		String basePath = config.getWorkspace();
		if(Core.isNotNull(basePath) && FileHelper.dirExists(basePath)) {
			return config.getWorkspace()+File.separator+"src"+File.separator+"main"+File.separator+"webapp"+File.separator+"images"+File.separator+"IGRP"+File.separator+"IGRP2.3"+File.separator+"assets"+File.separator+"img"+File.separator+nameApp; 			
		}
		return null;
	}
	
	public static String getImageServer(String nameApp) {
		return Igrp.getInstance().getServlet().getServletContext().getRealPath("/")+"images"+File.separator+"IGRP"+File.separator+"IGRP2.3"+File.separator+"assets"+File.separator+"img"+File.separator+nameApp;
	}
	
	public static String getRootPath() {
		Config config = new Config();
		String basePath = config.getWorkspace();
		if(Core.isNotNull(basePath) && FileHelper.dirExists(basePath)) {
			basePath = config.getRawBasePathClassWorkspace()+"nosi"+File.separator+"webapps"+File.separator; 			
		}else {
			basePath = config.getBasePathClass()+"nosi"+File.separator+"webapps"+File.separator;
		}
		return basePath;
	}
	
	public static String getPathImagesServer(Action action) {
		Config config = new Config();
		return config.getCurrentBaseServerPahtXsl(action);
	}
	
	public static String getPathImagesWorkSapce(Action action) {
		Config config = new Config();
		String basePath = config.getWorkspace();
		
		if (Core.isNotNull(basePath) && FileHelper.fileExists(basePath)) {
			return config.getWorkspace()+File.separator + config.getWebapp()
					+ File.separator + "images" + File.separator + "IGRP"+File.separator+"IGRP" + action.getVersion()
					+ File.separator+"app"+File.separator + action.getApplication().getDad().toLowerCase() + File.separator + action.getPage().toLowerCase();
		}
		return null;
	}
}
