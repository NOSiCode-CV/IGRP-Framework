package nosi.core.webapp.webservices.wsdl2java;

import java.io.File;
import java.io.IOException;
import nosi.core.config.Config;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.import_export_v2.common.Path;

/**
 * Emanuel
 * 7 May 2019
 */
public class WSDL2Java {

	public static final String SERVICE_PACKAGE_NAME="services";
	
	public static void generateWsdl2Java(String urlWsdl,String dad) {
		boolean r = false;
		try {
			String destinationPath = Path.getPath(dad)+File.separator+SERVICE_PACKAGE_NAME;
			if(!FileHelper.dirExists(destinationPath)) {
				FileHelper.createDiretory(destinationPath);
			}
			String packageName = new Config().getBasePackage(dad)+"."+SERVICE_PACKAGE_NAME;
			Runtime.getRuntime().exec("wsimport -Xnocompile -p "+packageName+ " -keep -verbose "+urlWsdl+" -d "+Path.getBasePath());
			r = true;
		} catch (IOException e) {
			r = false;
			Core.setMessageError(e.getMessage());
			e.printStackTrace();
		}
		if(r)
			Core.setMessageSuccess();
	}
}
