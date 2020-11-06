package nosi.webapps.igrp.pages.defaultpage;
/*---- Import your packages here... ----*/

import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;

/*---- End ----*/

public class DefaultPageController extends Controller{
	
	public Response actionIndex() throws IOException{
		return this.redirect("igrp", "home", "index");
	}
}
