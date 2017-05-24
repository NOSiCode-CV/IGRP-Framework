package nosi.core.webapp.helpers;

import nosi.core.dao.IgrpDb;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;

public class Permission {

	public static boolean isPermition(String app,String page,String action){//check permission on app		
		if(Igrp.getInstance().getUser()!=null && Igrp.getInstance().getUser().isAuthenticated()){
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
			IgrpDb igrpDb = new IgrpDb();
			boolean x = false;
			if(igrpDb.unwrap("db1")==null){
				igrpDb.init();
				x = new Application().getPermissionApp(app);
				igrpDb.destroy();
			}else if(igrpDb.unwrap("db1")!=null){
				x = new Application().getPermissionApp(app);
			}
			return x;
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
