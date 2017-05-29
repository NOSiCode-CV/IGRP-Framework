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
	
	private void checkAndLoadPerfilOrganization(int currentPerfilId, int currentOrgId){
//		int perf = currentPerfilId;
//		int org = currentOrgId;
//		// Create the cookie context (Begin)
//		/* For perfil information */
//		Cookie _p = null;
//		Cookie _org = null;
//		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
//			if(c.getName().equals("_perf"))
//				_p = c;
//			else if(c.getName().equals("_org"))
//				_org = c;
//		
//		if(_p != null && new Profile().getByUserAndPerfil(this.identity.getIdentityId(), Integer.parseInt(_p.getValue())) != null){
//			perf = Integer.parseInt(_p.getValue());
//		}
//		else if(_org != null && new Profile().getByUserAndOrganization(this.identity.getIdentityId(), Integer.parseInt(_org.getValue())) != null){
//			org = Integer.parseInt(_org.getValue());
//		}
//		Igrp.getInstance().getResponse().addCookie(new Cookie("_org", "" + org));
//		Igrp.getInstance().getResponse().addCookie(new Cookie("_perf", "" + perf));

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
