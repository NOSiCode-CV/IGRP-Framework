package nosi.webapps.igrp.pages.home;
/*---- Import your packages here... ----*/

import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Permission;

/*---- End ----*/
public class HomeController extends Controller {		

	public Response actionIndex() throws IOException{
		Permission.changeOrgAndProfile("igrp");
		HomeView view = new HomeView();
		view.title = "Home";
		return this.renderView(view,true);
	}
}
