package nosi.core.webapp.security;
/**
 * @author Emanuel Pereira
 * May 29, 2017
 */

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Optional;
import javax.servlet.http.Cookie;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.ApplicationPermition;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Share;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;

public class Permission {
	
	public static final String ENCODE = "UTF-8"; 
	public static final int MAX_AGE = 60*60*24;//24h 
	
	private ApplicationPermition applicationPermition; 
	
	public boolean isPermition(String app, String appP, String page, String action){ // check permission on app 
		if(Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated()){ 
			if(PagesScapePermission.PAGES_SHAREDS.contains((appP + "/" + page + "/" + action).toLowerCase())) 
				return true; 
			if(app.equals(appP) || appP.equals("igrp") || appP.equals("igrp_studio")) 
				return (new Application().getPermissionApp(app) && new Menu().getPermissionMen(appP, page)); 
			else { 
				if(appP.equals("tutorial")) // default page purpose 
					return true; 
				return new Share().getPermissionPage(app,appP,new Action().findByPage(page, appP).getId()); 
			}
		}
		return PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains((appP+"/"+page+"/"+action).toLowerCase());
	}
	
	public  boolean isPermission(String transaction){
		return new Transaction().getPermission(transaction);
	}

	public  void changeOrgAndProfile(String dad){
        final User currentUser = Core.getCurrentUser();
        if(Core.isNull(dad) || currentUser ==null)
			return;
		Application app = Core.findApplicationByDad(dad);
		ProfileType profType = new ProfileType();
		Organization org = new Organization();
		Profile prof = new Profile();
		if(app!=null && Igrp.getInstance().getRequest().getSession()!=null){			
			int id_user = 0;
            id_user = currentUser.getIdentityId();
			if(app.getPermissionApp(app.getId())){
				prof = prof.getByUserPerfil(id_user,app.getId());
				ApplicationPermition appP = this.getApplicationPermition(dad);
				if(prof!=null){
					 org.setId(prof.getOrganization().getId());
					 profType.setId(prof.getProfileType().getId());
					if(appP==null) {
						appP = new ApplicationPermition(app.getId(),dad,  org.getId(),profType.getId(), prof.getOrganization() != null ? prof.getOrganization().getCode():null, prof.getProfileType() != null ?prof.getProfileType().getCode():null);
					}
					this.setCookie(appP);
				}
				this.applicationPermition = appP;
			}
		}
		((User)Igrp.getInstance().getUser().getIdentity()).setAplicacao(app);
		((User)Igrp.getInstance().getUser().getIdentity()).setProfile(profType);
		((User)Igrp.getInstance().getUser().getIdentity()).setOrganica(org);
	}
	
	public void setCookie(ApplicationPermition appP) {
		try {
			String json = Core.toJson(appP);
			Cookie cookie = new Cookie(appP.getDad(), URLEncoder.encode( json,ENCODE));
			cookie.setMaxAge(MAX_AGE);
			Igrp.getInstance().getResponse().addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public  String getCurrentEnv() {
		ApplicationPermition appP = this.getApplicationPermition();
		return appP!=null && !appP.getDad().isEmpty() ?appP.getDad():Core.getCurrentDadParam();
	}
	
	public  Integer getCurrentPerfilId() {
		ApplicationPermition appP = this.getApplicationPermition();
		if(appP!=null && appP.getProfId()!=null)
			return appP.getProfId();
		return -1;
	}

	public  Integer getCurrentOrganization() {
		ApplicationPermition appP = this.getApplicationPermition();
		if(appP!=null && appP.getOgrId()!=null)
			return appP.getOgrId();
		return -1;
	}
	
	public  Integer getCurrentEnvId() {
		ApplicationPermition appP = this.getApplicationPermition();
		return appP!=null?appP.getAppId():-1;
	}
	
	public  String getCurrentPerfilCode() {
		ApplicationPermition appP = this.getApplicationPermition();
		if(appP!=null)
			return appP.getCode_profile();
		return "";
	}

	public  String getCurrentOrganizationCode() {
		ApplicationPermition appP = this.getApplicationPermition();
		if(appP!=null)
			return appP.getCode_organization();
		return "";
	}
	
	public ApplicationPermition getApplicationPermition() {
		String dad = Core.getParam("dad");
        if(Core.isNull(dad))
            return null;
		return this.getApplicationPermition(dad);
	}
	
	public ApplicationPermition getApplicationPermition(String dad) {
		Optional<Cookie> cookies = Igrp.getInstance()!= null && Igrp.getInstance().getRequest().getCookies()!=null ?
				Arrays.stream(Igrp.getInstance().getRequest().getCookies()).filter(c -> c.getName().equalsIgnoreCase(dad)).findFirst(): Optional.empty();
		String json = cookies.map(Cookie::getValue).orElse(null);
		if(json!=null) {
			try {
				json = URLDecoder.decode(json,ENCODE);
				if(Core.isNotNull(json)) {
					ApplicationPermition appP = (ApplicationPermition) Core.fromJson(json, ApplicationPermition.class);
					return appP;
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public ApplicationPermition getApplicationPermitionBeforeCookie() {
		return applicationPermition;
	}
	
}