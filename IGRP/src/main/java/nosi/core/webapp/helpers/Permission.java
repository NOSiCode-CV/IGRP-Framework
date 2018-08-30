package nosi.core.webapp.helpers;
/**
 * @author Emanuel Pereira
 * May 29, 2017
 */

import java.util.Arrays;
import java.util.Optional;
import javax.servlet.http.Cookie;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;

public class Permission {

	public boolean isPermition(String app,String page,String action){//check permission on app		
		if(Igrp.getInstance().getUser()!=null && Igrp.getInstance().getUser().isAuthenticated()){
			if(!new EncrypDecrypt().getWakandaList(app+"/"+page+"/"+action) ||
					(action.equalsIgnoreCase("index") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("home")) || 			
					(action.equalsIgnoreCase("myMenu") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("pesquisar-menu"))|| 
					(action.equalsIgnoreCase("myApps") && app.equalsIgnoreCase("igrp_studio") && page.equalsIgnoreCase("env")) ||				
					(action.equalsIgnoreCase("permission") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")) ||				
					(action.equalsIgnoreCase("notFound") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page"))  ||
					(action.equalsIgnoreCase("openApp") && app.equalsIgnoreCase("igrp_studio") && page.equalsIgnoreCase("env"))
				  ){
				return true;
			}
			boolean x = new Application().getPermissionApp(app);
			if(!x){
				x = new Menu().getPermissionMen(app);
			}
			return x;
		}else if(
					(action.equalsIgnoreCase("login") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("login")) ||
					(action.equalsIgnoreCase("permission") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")) ||
					(action.equalsIgnoreCase("exception") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")) ||
					(action.equalsIgnoreCase("notFound") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")))
		{
			return true;
		}
		return false;
	}
	
	public  boolean isPermission(String transaction){
		return new Transaction().getPermission(transaction);
	}

	public  void changeOrgAndProfile(String dad){
		Optional<Cookie> cookies = Igrp.getInstance().getRequest().getCookies()!=null?Arrays.asList(Igrp.getInstance().getRequest().getCookies()).stream().filter(c -> c.getName().equalsIgnoreCase(dad)).findFirst():null;
		String c = (cookies!=null && cookies.isPresent())?cookies.get().getValue():null;
		if(Core.isNotNull(c)) {
			try {
				String []aux = c.split("-");
				String orgID = aux[0];
				String perfilID = aux[1];
				Organization org = new Organization().findOne(orgID);
				ProfileType prof = new ProfileType().findOne(perfilID);
				if(org != null && prof != null) {
					Igrp.getInstance().getRequest().getSession().setAttribute("igrp.org", org.getId());
					Igrp.getInstance().getRequest().getSession().setAttribute("igrp.prof",prof.getId());
					Igrp.getInstance().getRequest().getSession().setAttribute("igrp.env", dad);
					return; // end of methods 
				}
			}catch(Exception e) {}
		}
		Application app = new Application().find().andWhere("dad", "=", dad).one();
		ProfileType profType = new ProfileType();
		Organization org = new Organization();
		Profile prof = new Profile();
		if(app!=null){			
			int id_user = Igrp.getInstance()
					.getUser().
					getIdentity().
					getIdentityId();
			
			if(app.getPermissionApp(dad)){
				prof = (Profile) prof.getByUserPerfil(id_user,app.getId());
				if(prof!=null){
					 org.setId(prof.getOrganization().getId());
					 profType.setId(prof.getProfileType().getId());
					 Igrp.getInstance().getRequest().getSession().setAttribute("igrp.org", prof.getOrganization().getId());
					 Igrp.getInstance().getRequest().getSession().setAttribute("igrp.prof",prof.getProfileType().getId());
					 Igrp.getInstance().getRequest().getSession().setAttribute("igrp.env", app.getDad());
				}
			}
		}		
		((User)Igrp.getInstance().getUser().getIdentity()).setAplicacao(app);
		((User)Igrp.getInstance().getUser().getIdentity()).setProfile(profType);
		((User)Igrp.getInstance().getUser().getIdentity()).setOrganica(org);
		if(Igrp.getInstance().getRequest().getSession()!=null && app!=null) {
			Igrp.getInstance().getRequest().getSession().setAttribute("igrp.env", app.getDad());
			Igrp.getInstance().getRequest().getSession().setAttribute("igrp.prof", profType.getId());
			Igrp.getInstance().getRequest().getSession().setAttribute("igrp.org", org.getId());
		}
	}
	
	public  String getCurrentEnv() {
		String env = (String) Igrp.getInstance().getRequest().getSession().getAttribute("igrp.env");
		return env!=null && !env.equals("")?env:"igrp";
	}
	
	public  Integer getCurrentPerfilId() {
		Integer prof = (Integer) Igrp.getInstance().getRequest().getSession().getAttribute("igrp.prof");
		return prof!=null?prof:-1;
	}

	public  Integer getCurrentOrganization() {
		Integer org = (Integer) Igrp.getInstance().getRequest().getSession().getAttribute("igrp.org");
		return org!=null?org:-1;
	}
}