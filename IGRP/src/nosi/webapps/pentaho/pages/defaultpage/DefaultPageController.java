package nosi.webapps.pentaho.pages.defaultpage;

import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import java.net.MalformedURLException;

import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;

public class DefaultPageController extends Controller {	
	
	public Response actionIndex() throws IOException{
		String credentials = "Sam%20Pentaho:password@";
		String url = "http://" + credentials + "10.73.96.59:8180/pentaho/api/repos/%3Apublic%3Ademo%3ADash_Epidemias_geoRef.wcdf/generatedContent";
		return this.redirectToUrl(url);
	}	
}
