package nosi.core.webapp;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;

import nosi.core.webapp.security.Permission;
import nosi.core.webapp.security.SecurtyCallPage;
import nosi.webapps.igrp.pages.login.LoginController;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User implements Component{
	
	private Identity identity;
	private int expire; // for authentication via cookie  
	public static final String LOGIN_ROUTE = "igrp/login/login"; 
	public static final String IDENTITY_PARAM_NAME = "_identity-igrp";
	
	public User(){}
	
	public boolean login(Identity identity, int expire){ // Make login and authenticate the user ... using session and cookies(remenberMe implementation purpose) 
		if(identity == null || identity.getAuthenticationKey() == null || identity.getAuthenticationKey().isEmpty())
			return false;
		try {
			this.identity = identity;
			//new Permission().changeOrgAndProfile("tutorial");
			// Create the session context
			JSONArray json =  new JSONArray();
			json.put(this.identity.getIdentityId());
			json.put(this.identity.getAuthenticationKey() + "");
			Igrp.getInstance().getRequest().getSession().setAttribute(IDENTITY_PARAM_NAME, json.toString()); 
			if(expire > 0) { 
				this.expire = expire;
				this.sendCookie(Base64.getEncoder().encodeToString(json.toString().getBytes())); //  send a cookie to the end user 
			}
		return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private boolean checkSessionContext(){
		HttpSession session = Igrp.getInstance().getRequest().getSession(false);
		if(session == null)
			return false;
		try {
			String sessionData = (String) session.getAttribute(IDENTITY_PARAM_NAME);
			if(sessionData == null || sessionData.isEmpty())
				return false;
			JSONArray json = new JSONArray(sessionData);
			int identityId = json.getInt(0);
			String authenticationKey = json.getString(1);
			nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User().findIdentityById(identityId);
			if(user!=null && authenticationKey.equals(user.getAuth_key())) {
				this.identity = (Identity) user;
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	private void checkCookieContext() {
		Cookie aux = null;
		Cookie []allCookies = Igrp.getInstance().getRequest().getCookies();
		if(allCookies != null)
			for(Cookie obj : allCookies)
				if(obj.getName().equals(IDENTITY_PARAM_NAME))
					aux = obj;
		if(aux == null || aux.getValue().isEmpty()) return;
		String value = new String(Base64.getDecoder().decode(aux.getValue()));
		try {
			JSONArray json = new JSONArray(value);
			int identityId = json.getInt(0);
			String authenticationKey = json.getString(1);
			nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User();
			user = user.findIdentityById(identityId);
			if(user!=null && user.getId()!=0 && authenticationKey.equals(user.getAuth_key())) {
				// create the session context here
				Igrp.getInstance().getRequest().getSession(true).setAttribute(IDENTITY_PARAM_NAME, json.toString());
				this.identity = (Identity) user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void sendCookie(String value) { 
		Cookie aux = new Cookie(IDENTITY_PARAM_NAME, value);
		aux.setMaxAge(this.expire);
		aux.setHttpOnly(true);
		Igrp.getInstance().getResponse().addCookie(aux);
	}
	
	public boolean isAuthenticated(){
		return this.identity != null;
	}
	
	public boolean logout(){ // Reset all login session/cookies information
		try {
			HttpSession theSession = Igrp.getInstance().getRequest().getSession(false);
		    if( theSession != null )
		    	theSession.invalidate();
			// destroy the cookie
			sendCookie("");
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Identity getIdentity(){
		return this.identity;
	}

	@Override
	public void init(HttpServletRequest request) {
		String aux = request.getParameter("r") != null ? request.getParameter("r").toString() : LOGIN_ROUTE; 
		boolean isLoginPage = aux.equals(LOGIN_ROUTE);
		if(SecurtyCallPage.isPublic(aux) && !isLoginPage ) { 
			this.checkSessionContext();
			return; 
		}
		if(!this.checkSessionContext() && !isLoginPage ){
			try {
				//nosi.core.webapp.helpers.Route.remember(); // remember the url that was requested by the client ... 
				this.checkCookieContext();
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
		throw new UnsupportedOperationException();
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
	
	public static String generateAuthenticationKey() {
		return java.util.UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public static String generateActivationKey() {
		return Base64.getUrlEncoder().encodeToString(((System.currentTimeMillis() + 1000*7*24*3600) + "").getBytes()); // 7 days 
	}
	
	public static String generatePasswordResetToken() {
		return Base64.getUrlEncoder().encodeToString(((java.util.UUID.randomUUID().toString().replaceAll("-", "") + "_" + (System.currentTimeMillis() + 1000*10*60)) + "").getBytes()); // 10 min.  
	}
	
}
