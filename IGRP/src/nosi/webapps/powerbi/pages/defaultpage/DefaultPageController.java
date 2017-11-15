package nosi.webapps.powerbi.pages.defaultpage;

import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;

public class DefaultPageController extends Controller {	
	
	public Response actionIndex() throws IOException{
		String credentials = "iekini.fernandes:paswss@";
		String url = "http://" + credentials + "rai-bi-lab-01/pbiResport/browse/";
	return this.redirectToUrl(url); 
	}

}