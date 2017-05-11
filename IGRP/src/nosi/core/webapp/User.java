package nosi.core.webapp;

import java.io.IOException;

import javax.servlet.http.Cookie;

/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User implements Component{
	
	private Identity identity;
	private int expire;
	
	public User(){
	}
	
	public boolean login(Identity identity, int expire, int currentPerfilId, int currentOrgId){ // Make login and authenticate the user ... using session and cookies
		this.identity = identity;
		this.expire = expire;
		
		// Create the session context
		Igrp.getInstance().getRequest().getSession().setAttribute("_identity", this.identity.getIdentityId() + "" /* convert it to string*/);
		int perf = currentPerfilId;
		int org = currentOrgId;
		// Create the cookie context (Begin)
		/* For perfil information */
		Cookie aux = null;
		Cookie aux1 = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_perf"))
				aux = c;
			else if(c.getName().equals("_org"))
				aux1 = c;
		
		if(aux != null && new nosi.webapps.igrp.dao.Profile().getByUserAndPerfil(this.identity.getIdentityId(), Integer.parseInt(aux.getValue())) != null){
			perf = Integer.parseInt(aux.getValue());
		}
		else if(aux1 != null && new nosi.webapps.igrp.dao.Profile().getByUserAndPerfil(this.identity.getIdentityId(), Integer.parseInt(aux.getValue())) != null){
			org = Integer.parseInt(aux1.getValue());
		}
		Igrp.getInstance().getResponse().addCookie(new Cookie("_org", ""+org));
		Igrp.getInstance().getResponse().addCookie(new Cookie("_perf", ""+perf));
		return true;
	}
	
	private boolean checkSessionContext(){
		String aux = (String) Igrp.getInstance().getRequest().getSession().getAttribute("_identity");
		int identityId = Integer.parseInt(aux != null && !aux.equals("") ? aux : "0");
		this.identity = (Identity) new nosi.webapps.igrp.dao.User().findIdentityById(identityId);
		return this.identity != null;
	}
	
	public boolean isAuthenticated(){
		return this.identity != null;
	}
	
	public boolean logout(){ // Reset all login session/cookies information
		Igrp.getInstance().getRequest().getSession().invalidate();
		return true;
	}
	
	public Identity getIdentity(){
		return this.identity;
	}

	@Override
	public void init() {
		boolean isLoginPage = false;
		String aux = Igrp.getInstance().getRequest().getParameter("r");
		if(aux != null) /* test the login page (TOO_MANY_REQUEST purpose)*/
			isLoginPage = aux.contains("login"); // bug ... Perhaps
		try{
			if(!this.checkSessionContext() && !isLoginPage){
				Igrp.getInstance().getResponse().sendRedirect("webapps?r=igrp/login/login"); // go to login page "again"
			}
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		// not set yet
	}
	
	public static int getCurrentPerfilId() {
		Cookie aux = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_perf"))
				aux = c;		
		return aux!=null?Integer.parseInt(aux.getValue()):0;
	}

	public static int getCurrentOrganization() {
		Cookie aux = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_org"))
				aux = c;		
		return aux!=null?Integer.parseInt(aux.getValue()):0;
	}
	
}
