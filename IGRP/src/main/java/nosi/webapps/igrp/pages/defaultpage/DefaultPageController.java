package nosi.webapps.igrp.pages.defaultpage;
/*---- Import your packages here... ----*/

import java.io.IOException;

import nosi.core.webapp.Response;
import nosi.core.webapp.mvc.Controller;

/*---- End ----*/

public class DefaultPageController extends Controller{
	
	public Response actionIndex() throws IOException{
		return this.redirect("igrp", "home", "index");
	}
}
