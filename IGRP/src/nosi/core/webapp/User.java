package nosi.core.webapp;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import nosi.core.webapp.helpers.Permission;
import nosi.webapps.igrp.pages.login.LoginController;
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
	
	public boolean login(Identity identity, int expire){ // Make login and authenticate the user ... using session and cookies
		this.identity = identity;
		this.expire = expire;
		Permission.changeOrgAndProfile("igrp");
		// Create the session context
		Igrp.getInstance().getRequest().getSession(false).setAttribute("_identity", this.identity.getIdentityId() + "");
		return true;
	}
	
	private boolean checkSessionContext(){
		String aux = (String) Igrp.getInstance().getRequest().getSession(false).getAttribute("_identity");
		int identityId = Integer.parseInt(aux != null && !aux.equals("") ? aux : "0");
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User();
		user = user.findIdentityById(identityId);
		try{
			if(user!=null && user.getId()!=0){
				this.identity = (Identity) user;
				return true;
			}
		}catch(NullPointerException e){}
		return false;
	}
	
	public boolean isAuthenticated(){
		return this.identity != null;
	}
	
	public boolean logout(){ // Reset all login session/cookies information
		Igrp.getInstance().getRequest().getSession(false).invalidate();
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
				//Route.remember(); // remember the url that was requested by the client ...
				//Igrp.getInstance().getResponse().sendRedirect("webapps?r=" + User.loginUrl);
				LoginController controller = new LoginController();
				Response response = controller.actionGoToLogin();
				controller.setResponseWrapper(response);
				Igrp.getInstance().setCurrentController(controller);
				Igrp.getInstance().die();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void destroy() {
		// not set yet
	}
	
	public static String encryptToHash(String target, String algorithm/* MD5 or SHA1 */){
		String result = "";
		try {
			result = new BigInteger(1, MessageDigest.getInstance(algorithm).digest(target.getBytes())).toString(16/*Hexadecimal codification*/);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
