package nosi.core.webapp.helpers;

import javax.servlet.http.Cookie;

import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Profile;
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
				(action.equals("notFound") && app.equals("igrp") && page.equals("error-page"))  ||
				(action.equals("openApp") && app.equals("igrp") && page.equals("env")) 
			  ){
				return true;
			}
			boolean x = new Application().getPermissionApp(app);
			if(!x){
				x = new Menu().getPermissionMen(app);
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
	
	public static void changeOrgAndProfile(String dad){
		Application app = new Application();
		app.setDad(dad);
		app = (Application) app.getOne();
		if(app!=null && app.getId()!=0){
			int id_user = Igrp.getInstance().getUser().getIdentity().getIdentityId();
			int id_app = app.getId();
			if(app.getPermissionApp(dad)){
				Profile prof = (Profile) new Profile().getByUserPerfil(id_user,id_app);
				if(prof!=null){
//					Cookie aux = null;
//					Cookie aux1 = null;
//					for(Cookie c : Igrp.getInstance().getRequest().getCookies())
//						if(c.getName().equals("_perf"))
//							aux = c;
//						else if(c.getName().equals("_org"))
//							aux1 = c;					
//					if(aux != null && !aux.getValue().equals("") && new nosi.webapps.igrp.dao.Profile().getByUserAndPerfil(id_user, Integer.parseInt(aux.getValue())) != null){
//						prof.setProf_type_fk(Integer.parseInt(aux.getValue()));
//					}
//					else if(aux1 != null && !aux1.getValue().equals("") && new nosi.webapps.igrp.dao.Profile().getByUserAndPerfil(id_user, Integer.parseInt(aux.getValue())) != null){
//						prof.setOrg_fk(Integer.parseInt(aux1.getValue()));
//					}
					Igrp.getInstance().getResponse().addCookie(new Cookie("_org", ""+prof.getOrg_fk()));
					Igrp.getInstance().getResponse().addCookie(new Cookie("_perf", ""+prof.getProf_type_fk()));
				}
			}else{
				Igrp.getInstance().getResponse().addCookie(new Cookie("_org", ""));
				Igrp.getInstance().getResponse().addCookie(new Cookie("_perf", ""));
			}
		}else{
			Igrp.getInstance().getResponse().addCookie(new Cookie("_org", ""));
			Igrp.getInstance().getResponse().addCookie(new Cookie("_perf", ""));
		}
		Igrp.getInstance().getResponse().addCookie(new Cookie("_env", dad));
	}
	
	public static String getCurrentEnv() {
		Cookie aux = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_env"))
				aux = c;		
		return aux!=null?aux.getValue():"igrp";
	}
}
