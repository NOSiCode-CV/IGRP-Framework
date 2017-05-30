package nosi.core.webapp.helpers;
/**
 * @author Emanuel Pereira
 * May 29, 2017
 */

import javax.servlet.http.Cookie;

import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;

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
		ProfileType profType = new ProfileType();
		Organization org = new Organization();
		if(app!=null && app.getId()!=0){
			int id_user = Igrp.getInstance().getUser().getIdentity().getIdentityId();
			int id_app = app.getId();
			if(app.getPermissionApp(dad)){
				Profile prof = (Profile) new Profile().getByUserPerfil(id_user,id_app);
				if(prof!=null){          
					org.setId(prof.getOrg_fk());
					profType.setId(prof.getProf_type_fk());
					String data_cache = getDataCache(dad);
					if(data_cache==null || data_cache.equals("")){
						String data = prof.getOrg_fk()+"-"+prof.getProf_type_fk();
						Igrp.getInstance().getResponse().addCookie(new Cookie(dad,data));
					}
				}
			}else{
				Igrp.getInstance().getResponse().addCookie(new Cookie(dad, ""));
			}
		}else{
			Igrp.getInstance().getResponse().addCookie(new Cookie(dad, ""));
		}
		Igrp.getInstance().getResponse().addCookie(new Cookie("_env", dad));
		
		((User)Igrp.getInstance().getUser().getIdentity()).setAplicacao(app);
		((User)Igrp.getInstance().getUser().getIdentity()).setProfile(profType);
		((User)Igrp.getInstance().getUser().getIdentity()).setOrganica(org);
	}
	
	public static String getCurrentEnv() {
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_env"))
				return c.getValue();		
		return "igrp";
	}
	
	private static String getDataCache(String dad){
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals(dad)){
				return c.getValue();
			}
		return null;
	}
	
	public static int getCurrentPerfilId() {
		String dad = getCurrentEnv();
		String data_cache = getDataCache(dad);
		if(data_cache!=null && !data_cache.equals("")){
			String[] parts = data_cache.split("-");
			return Integer.parseInt(parts[1]);
		}
		return -1;
	}

	public static int getCurrentOrganization() {
		String dad = getCurrentEnv();
		String data_cache = getDataCache(dad);
		if(data_cache!=null && !data_cache.equals("")){
			String[] parts = data_cache.split("-");
			return Integer.parseInt(parts[0]);
		}
		return -1;
	}
}
