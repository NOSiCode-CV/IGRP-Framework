package nosi.webapps.igrp.pages.home;
/*---- Import your packages here... ----*/

import java.io.IOException;

import nosi.core.exception.ServerErrorHttpException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Permission;

/*---- End ----*/
public class HomeController extends Controller {		

	public Response actionIndex() throws IOException{
		String destination = Igrp.getInstance().getRequest().getParameter("_url");
		if(destination != null ) {
			try {
				String []aux = destination.split("/");
				if(aux.length != 3)
					throw new ServerErrorHttpException();
				new Permission().changeOrgAndProfile(aux[0]);
			return redirect(aux[0], aux[1], aux[2]);
			}catch(Exception e) {
				
			}
		}
		new Permission().changeOrgAndProfile("igrp");
		HomeView view = new HomeView();
		view.title = "Home";
		return this.renderView(view,true);
	}
}
