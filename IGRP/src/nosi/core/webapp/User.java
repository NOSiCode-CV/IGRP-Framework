package nosi.core.webapp;

import javax.servlet.http.Cookie;

/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User{
	
	private Identity identity;
	private int expire;
	
	public User(){
	}
	
	public boolean login(Identity identity, int expire, int currentPerfilId){ // Make login and authenticate the user ... using session and cookies
		this.identity = identity;
		this.expire = expire;
		
		// Create the session context
		Igrp.getInstance().getRequest().getSession().setAttribute("_identity", this.identity.getIdentityId());
		
		// Create the cookie context (Begin)
		/* For perfil information */
		Cookie aux = null;
		for(Cookie c : Igrp.getInstance().getRequest().getCookies())
			if(c.getName().equals("_p"))
				aux = c;
		if(aux != null && new nosi.webapps.igrp.dao.Profile().getByUserAndPerfil(this.identity.getIdentityId(), currentPerfilId) != null)
			((nosi.webapps.igrp.dao.User)this.identity).setCurrentPerfilId(Integer.parseInt(aux.getValue()));
		else{
			Igrp.getInstance().getResponse().addCookie(new Cookie("_p", ""+currentPerfilId));
			((nosi.webapps.igrp.dao.User)this.identity).setCurrentPerfilId(currentPerfilId);
		}
		// (END)
		
		return true;
	}
	
	private boolean checkSessionContext(){
		String aux = (String) Igrp.getInstance().getRequest().getAttribute("_identity");
		int identityId = Integer.parseInt(aux != null && !aux.equals("") ? aux : "0");
		this.identity = (Identity) new nosi.webapps.igrp.dao.User().findIdentityById(identityId);
		if(this.identity == null){
			System.out.println("Need to login ... Redirect to login page");
		}
		return this.identity != null;
	}
	
	public boolean logout(){ // Reset all login session/cookies information
		Igrp.getInstance().getRequest().getSession().invalidate();
		return true;
	}
	
	public Identity getIdentity(){
		return this.identity;
	}
	
}
