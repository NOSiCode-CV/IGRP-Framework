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
	
	public boolean login(Identity identity, int expire, int currentPerfilId){ // Make login and authenticate the user ... using session and cookies
		this.identity = identity;
		this.expire = expire;
		
		// Create the session context
		Igrp.getInstance().getRequest().getSession().setAttribute("_identity", this.identity.getIdentityId() + "" /* convert it to string*/);
		
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
				System.out.println("Entrado");
			}
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		// not set yet
	}
	
}
