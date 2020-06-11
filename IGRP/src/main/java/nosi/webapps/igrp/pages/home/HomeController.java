package nosi.webapps.igrp.pages.home;
/*---- Import your packages here... ----*/

import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.core.webapp.security.Permission;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.ProfileType;

/*---- End ----*/
public class HomeController extends Controller {		

	public Response actionIndex() throws IOException{ 
		String dad = Core.getParam("dad"); 
		if(dad != null) {
			String []aux = dad.split("/"); 
			if(aux != null) { 
				if(aux.length >= 4) {
					String app = aux[0]; 
					String page = aux[1]; 
					String action = aux[2]; 
					dad = aux[3]; 
					page = app + "/" + page + "/" + action; 
					this.addQueryString("app", dad); 
					this.addQueryString("page", page); 
					if(aux.length == 6) {
						String orgCode = aux[4]; 
						String profCode = aux[5]; 
						// inject session and cookie 
					}
					return redirect("igrp_studio", "Env", "openApp", this.queryString()); 
				}
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
			
			return redirect("igrp_studio", "Env", "openApp", this.queryString()); 
		}else {
			try { // Eliminar 
				new Permission().changeOrgAndProfile("igrp"); 
			}catch(Exception e) { 
			}			
		}
		
		HomeView view = new HomeView(); 
		view.title = "Home"; 
		return this.renderView(view,true); 
	} 
	
	private void injectOrgNProf(String orgCode, String profCode) {
		Organization org = new Organization().find().where("code", "=", orgCode).orWhere("plsql_code", "=", orgCode).one();
		ProfileType prof = new ProfileType().find().where("code", "=", profCode).orWhere("plsql_code", "=", profCode).one();
		ApplicationPermition appP = new ApplicationPermition(prof.getOrganization().getApplication().getId(),
				prof.getOrganization().getApplication().getDad(), prof.getOrganization().getId(), prof.getId(),
				prof.getOrganization().getCode(),prof.getCode());
		Core.addToSession(appP.getDad(), appP); 
		new Permission().setCookie(appP); 
	}
	
}
