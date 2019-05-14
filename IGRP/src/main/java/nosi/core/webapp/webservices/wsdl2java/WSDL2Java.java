package nosi.core.webapp.webservices.wsdl2java;

import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
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
	
	public static void generateWsdl2Java(String urlWsdl,String dad,String packageName) {
		boolean r = false;
		try {
			if(!WSDL2Java.isValidUrl(urlWsdl)) {
				r = false;
				return;
			}
			String destinationPath = Path.getPath(dad)+File.separator+SERVICE_PACKAGE_NAME+File.separator+packageName.replace(".", File.separator);
			if(!FileHelper.dirExists(destinationPath)) {
				FileHelper.createDiretory(destinationPath);
			}
			packageName = new Config().getBasePackage(dad)+"."+SERVICE_PACKAGE_NAME+"."+packageName;
			Runtime.getRuntime().exec("wsimport -Xnocompile -p "+packageName+ " -keep -verbose "+urlWsdl+" -d "+Path.getBasePath());
			r = true;
		} catch (IOException e) {
			r = false;
			Core.setMessageError(e.getMessage());
		}
		if(r)
			Core.setMessageSuccess();
	}

	private static boolean isValidUrl(String urlWsdl) {
		URL url;
		try {
			url = new URL(urlWsdl);
			HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
			urlConn.connect();
			return urlConn.getResponseCode()==HttpURLConnection.HTTP_OK;
		} catch (IOException e) {
			Core.setMessageError(Core.gt("Problema na conexão com: ")+e.getMessage());
		}
		return false;
	}
	
	
}
