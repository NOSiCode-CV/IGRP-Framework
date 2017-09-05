package nosi.webapps.agenda.pages.defaultpage;
/*---- Import your packages here... ----*/

import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;

/*---- End ----*/
public class DefaultPageController extends Controller {	
	public Response actionIndex() throws IOException{
		HomeAppView view = new HomeAppView();
		view.title = "Agenda Eletronica";
		return this.renderView(view,true);
	}
}