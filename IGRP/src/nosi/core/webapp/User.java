package nosi.core.webapp;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User{
	
	private Identity identity;
	private int expire;
	
	public User(){
	}
	
	public boolean login(Identity identity, int expire){ // Make login and authenticate the user ... using session and cookies
		this.identity = identity;
		this.expire = expire;
		
		// Create the session context
		Igrp.getInstance().getRequest().getSession().setAttribute("_identity", this.identity.getIdentityId());
		
		// Create the cookie context
		
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
		//Igrp.getInstance().getRequest().getSession().invalidate();
		return true;
	}
	
	public Identity getIdentity(){
		return this.identity;
	}
	
}
