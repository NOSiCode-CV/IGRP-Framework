package nosi.core.webapp.helpers;

import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;

public class Permission {

	public static boolean isPermition(String app,String page,String action){//check permission on app		
		if(Igrp.getInstance().getUser().isAuthenticated()){
			if(
				(action.equals("index") && app.equals("igrp") && page.equals("home")) || 
				(action.equals("logout") && app.equals("igrp") && page.equals("login"))|| 
				(action.equals("myMenu") && app.equals("igrp") && page.equals("pesquisar-menu"))|| 
				(action.equals("myApps") && app.equals("igrp") && page.equals("env")) ||
				(action.equals("login") && app.equals("igrp") && page.equals("login")) ||
				(action.equals("permission") && app.equals("igrp") && page.equals("error-page")) ||
				(action.equals("exception") && app.equals("igrp") && page.equals("error-page")) ||
				(action.equals("notFound") && app.equals("igrp") && page.equals("error-page")) 
			  ){
				return true;
			}
			return new Application().getPermissionApp(app);
		}else if(
					(action.equals("login") && app.equals("igrp") && page.equals("login")) ||
					(action.equals("permission") && app.equals("igrp") && page.equals("error-page")) ||
					(action.equals("exception") && app.equals("igrp") && page.equals("error-page")) ||
					(action.equals("notFound") && app.equals("igrp") && page.equals("error-page")) 
				){
			return true;
		}
		return false;
	}
	
	public static boolean isPermission(String transaction){
		return new Transaction().getPermission(transaction);
	}
}
