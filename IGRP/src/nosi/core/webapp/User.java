package nosi.core.webapp;

import java.io.IOException;

import nosi.core.webapp.helpers.Permission;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User implements Component{
	
	private Identity identity;
	private int expire;
	
	public static final String loginUrl = "igrp/login/login";
	
	public User(){
	}
	
	public boolean login(Identity identity, int expire, int currentPerfilId, int currentOrgId){ // Make login and authenticate the user ... using session and cookies
		this.identity = identity;
		this.expire = expire;
		Permission.changeOrgAndProfile("igrp");
		// Create the session context
		Igrp.getInstance().getRequest().getSession().setAttribute("_identity", this.identity.getIdentityId() + "");
		return true;
	}
	
	private boolean checkSessionContext(){
		String aux = (String) Igrp.getInstance().getRequest().getSession().getAttribute("_identity");
		int identityId = Integer.parseInt(aux != null && !aux.equals("") ? aux : "0");
		this.identity = (Identity) new nosi.webapps.igrp.dao.User().findIdentityById(identityId);
		return this.identity != null;// && this.checkPerfilOrganizationContext();
	}
//	
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
		/* test the login page (TOO_MANY_REQUEST purpose)*/
		if(aux != null){ 
			isLoginPage = aux.equals(User.loginUrl); // bug ... Perhaps
		}
			if(!this.checkSessionContext() && !isLoginPage){
				try {
					Igrp.getInstance().getResponse().sendRedirect("webapps?r=" + User.loginUrl);
					Igrp.getInstance().die();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}

	@Override
	public void destroy() {
		// not set yet
	}
	
	
	
}
