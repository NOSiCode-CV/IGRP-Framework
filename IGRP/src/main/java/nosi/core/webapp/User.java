package nosi.core.webapp;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import jakarta.servlet.http.HttpServletRequest;

/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User implements Component{
	
	private Identity identity;
	public static final String LOGIN_ROUTE = "igrp/login/login"; 
	public static final String IDENTITY_PARAM_NAME = "_identity-igrp";
	
	public boolean isAuthenticated(){
		return this.identity != null;
	}
	
	public Identity getIdentity(){
		return this.identity;
	}

	@Override
	public void init(HttpServletRequest request) {
		Object currentUser = request.getAttribute(User.IDENTITY_PARAM_NAME);
		if(currentUser instanceof Identity)
			this.identity = (Identity) currentUser;
	}

	@Override
	public void destroy() {
		throw new UnsupportedOperationException();
	}
	
	public static String encryptToHash(String target, String algorithm){
		String result = "";
		try {
			result = new BigInteger(1, MessageDigest.getInstance(algorithm).digest(target.getBytes())).toString(16);
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
