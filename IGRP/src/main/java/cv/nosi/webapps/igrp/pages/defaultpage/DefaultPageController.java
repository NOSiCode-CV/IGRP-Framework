package cv.nosi.webapps.igrp.pages.defaultpage;
/*---- Import your packages here... ----*/

import java.io.IOException;

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;

/*---- End ----*/

public class DefaultPageController extends Controller{
	
	public Response actionIndex() throws IOException{
		return this.redirect("igrp", "home", "index");
	}
}
