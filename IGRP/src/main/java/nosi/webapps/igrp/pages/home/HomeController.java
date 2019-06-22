package nosi.webapps.igrp.pages.home;
/*---- Import your packages here... ----*/

import java.io.IOException;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.security.Permission;

/*---- End ----*/
public class HomeController extends Controller {		

	public Response actionIndex() throws IOException{
		
		String dad = null; 
		
		String _appHomeUrl = (String) Core.getFromSession("_appHomeUrl", true);
		if(_appHomeUrl != null && !_appHomeUrl.isEmpty()) 
			dad = _appHomeUrl; 
		else 
			dad = Core.getParam("dad"); 
		
		
		String destination = (String) Core.getFromSession("_url", true); 
		if(destination == null || destination.isEmpty()) destination = Core.getParam("_url");
		if(destination != null && !destination.isEmpty()) {
			try {
				String []aux = destination.split("/");
				if(aux.length != 3)
					throw new ServerErrorHttpException(); 
				new Permission().changeOrgAndProfile(aux[0]);
			return redirect(aux[0], aux[1], aux[2]);
			}catch(Exception e) {
			}
		}
		
		if(Core.isNotNull(dad) && !dad.equals("igrp")) {
			nosi.webapps.igrp.dao.Action ac = Core.findApplicationByDad(dad).getAction();
			String page = "tutorial/DefaultPage/index&title=";
			if(ac!=null) {
				page = ac.getPage();
				/**
				 * Go to home page of application or go to default page in case not exists home page associate to application
				 */
				page = (ac.getApplication()!=null)?(ac.getApplication().getDad().toLowerCase() + "/" + page):page+"/DefaultPage";
				page +="/index&title="+ac.getAction_descr();
			}
			this.addQueryString("app", dad);
			this.addQueryString("page", page);
			return redirect("igrp_studio", "env", "openApp",this.queryString());
		}		
		
		try { // Eliminar 
			new Permission().changeOrgAndProfile("igrp");
		}catch(Exception e) {
			
		}
		
		HomeView view = new HomeView();
		view.title = "Home";
		return this.renderView(view,true);
	}
}
