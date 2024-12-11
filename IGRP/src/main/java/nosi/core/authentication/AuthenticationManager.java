package nosi.core.authentication;


import java.util.Arrays;
import java.util.Base64;
import java.util.Optional;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.ThreadContext;
import org.json.JSONArray;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.webapp.Identity;
import nosi.core.webapp.User;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Session;


public final class AuthenticationManager {
	
	private static final Logger LOGGER = LogManager.getLogger(AuthenticationManager.class);
	
	private AuthenticationManager() {}
	
	public static boolean isSessionExists(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null)
			return false;
		ThreadContext.put("sessionId", request.getSession().getId());
		Object sessionData = session.getAttribute(User.IDENTITY_PARAM_NAME);
		if(sessionData != null) {
			Optional<Identity> optIdentity = getIdentityFromToken(sessionData.toString());
			if(optIdentity.isPresent()) {
				request.setAttribute(User.IDENTITY_PARAM_NAME, optIdentity.get());
				return true;
			}else {
				// Trying to restore session from cookie if exists
				optIdentity = getIdentityFromCookie(request);
				if(optIdentity.isPresent()) {
					AuthenticationManager.createSecurityContext(optIdentity.get(), session);
					request.setAttribute(User.IDENTITY_PARAM_NAME, optIdentity.get());
					return true;
				}
			}
		}
		return false;
	}
	
	public static Optional<Identity> getIdentityFromCookie(HttpServletRequest request){
		Cookie []allCookies = request.getCookies();
		if(allCookies != null) {
			Optional<Cookie> optCookie = Arrays.stream(allCookies).filter(cookie -> cookie.getName().equals(User.IDENTITY_PARAM_NAME)).findFirst();
			try {
				if(optCookie.isPresent()) {
					Cookie identityCookie = optCookie.get();
					return getIdentityFromToken(identityCookie.getValue());
				}
			} catch (Exception ex) {
				LOGGER.error(ex.getMessage(), ex);
			}
		}
		return Optional.empty();
	}
	
	private static Optional<Identity> getIdentityFromToken(String token){
		token = new String(Base64.getDecoder().decode(token));
		JSONArray json = new JSONArray(token);
		int identityId = json.getInt(0);
		String authenticationKey = json.getString(1);
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User().findIdentityById(identityId);
		if(user != null && authenticationKey.equals(user.getAuth_key()) && user.getStatus() == 1) {
			String uid = user.getUser_name();
			uid = encryptUid(uid);
			ThreadContext.put("userId", uid);
			return Optional.of(user);
		}
		return Optional.empty();
	}
	
	public static boolean createPerfilWhenAutoInvite(nosi.webapps.igrp.dao.User user) { 
		Profile p1 = new Profile(); 
		p1.setUser(user);
		p1.setOrganization(new Organization().findOne(3));
		p1.setProfileType(new ProfileType().findOne(4));
		p1.setType("PROF");
		p1.setType_fk(4);

		Profile p2 = new Profile();
		p2.setUser(user);
		p2.setOrganization(new Organization().findOne(3));
		p2.setProfileType(new ProfileType().findOne(4));
		p2.setType("ENV");
		p2.setType_fk(3);

		Profile tutorialApp = new Profile();
		tutorialApp.setUser(user);
		tutorialApp.setOrganization(new Organization().findOne(2));
		tutorialApp.setProfileType(new ProfileType().findOne(3));
		tutorialApp.setType("ENV");
		tutorialApp.setType_fk(2);

		return p1.insert() != null && p2.insert() != null && tutorialApp.insert() != null;
	}
	
	public static void createSecurityContext(Identity user, HttpSession httpSession) {
		JSONArray json =  new JSONArray();
		json.put(user.getIdentityId());
		json.put(user.getAuthenticationKey());
		String token = Base64.getEncoder().encodeToString(json.toString().getBytes());
		httpSession.setAttribute(User.IDENTITY_PARAM_NAME, token);
	}
	
	public static void createSecurityContext(Identity user, HttpSession httpSession, HttpServletResponse response, int expire) {
		createSecurityContext(user, httpSession);
		if(expire > 0) {
			String token = (String) httpSession.getAttribute(User.IDENTITY_PARAM_NAME);
			token = Base64.getEncoder().encodeToString(token.getBytes());
			Cookie cookie = new Cookie(User.IDENTITY_PARAM_NAME, token);
			cookie.setMaxAge(expire);
			cookie.setHttpOnly(true);
			response.addCookie(cookie);
		}
	}
	
	public static void destroySecurityContext(HttpSession userSesion, HttpServletResponse response) {
		userSesion.invalidate();
		Cookie cookie = new Cookie(User.IDENTITY_PARAM_NAME, "");
		cookie.setMaxAge(0);
		cookie.setHttpOnly(true);
		response.addCookie(cookie);
	}
	
	public static void clearAllCookieExceptLocale(HttpServletRequest request, HttpServletResponse response) {
		for (Cookie c : request.getCookies()) {
			if (!c.getName().equals("igrp_lang")) {
				c.setMaxAge(0);
				c.setValue(null);
				response.addCookie(c);
			}
		}
	}
	
	public static boolean afterLogin(Profile profile, Identity identity, HttpServletRequest request) {
		Session currentSession = new Session();
		currentSession.setUser(new nosi.webapps.igrp.dao.User().findOne(identity.getIdentityId()));
		nosi.webapps.igrp.dao.User user = (nosi.webapps.igrp.dao.User) identity;
		user.setIsAuthenticated(1);
		currentSession.setOrganization(profile.getOrganization());
		currentSession.setProfileType(profile.getProfileType());
		try {
			currentSession.setApplication(new Application().findOne(user.getAplicacao().getId()));
		}catch(Exception e) {
			currentSession.setApplication(profile.getOrganization().getApplication());
		}
		currentSession.setIpAddress(getClientIpAddr(request));
		currentSession.setSessionId(request.getSession(false).getId());
		currentSession.setUserName(user.getUser_name());
		currentSession.setHttps(request.isSecure() ? 1 : 0);
		currentSession.setHost(request.getRemoteHost());
		currentSession.setHostName(request.getRemoteHost());
		currentSession.setSessionOldId(request.getSession(false).getId());
		currentSession.setMediaType("WEB");
		currentSession.setTarget("_blank");
		long time = System.currentTimeMillis();
		currentSession.setStartTime(time);
		currentSession.setEndTime(time + 30*60); // add 30 min. 
		currentSession.setUrl(request.getRequestURL().toString());
		user = user.update();
		currentSession = currentSession.insert();
		return currentSession != null;
	}

	public static boolean afterLogout(String currentSessionId) {
		Session session = new Session().find().andWhere("sessionId", "=", currentSessionId).one();
		if(session!=null){session.setEndTime(System.currentTimeMillis());}
		return session!=null && session.getApplication()!=null && session.update()!=null;
	}
	
	public static boolean accountActivation(String activationKey) {
		nosi.webapps.igrp.dao.User user = new nosi.webapps.igrp.dao.User().find().andWhere("activation_key", "=", activationKey).one();
		activationKey = new String(Base64.getUrlDecoder().decode(activationKey));
		if (user != null && activationKey.compareTo(System.currentTimeMillis() + "") > 0 && user.getStatus() == 0) {
			user.setStatus(1);
			user = user.update();
			return user != null && !user.hasError();
		}
		return false;
	}
	
	private static String getClientIpAddr(HttpServletRequest request) {  // For HProxy server purpose ... 
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("Proxy-Client-IP");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("WL-Proxy-Client-IP");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("HTTP_CLIENT_IP");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip))
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        if (ip == null || ip.isEmpty() || "unknown".equalsIgnoreCase(ip))
            ip = request.getRemoteAddr();
        return ip;  
	}
	
	private static String encryptUid(String uid) {
		Properties config = ConfigApp.getInstance().getMainSettings();
		final String secretKey = config.getProperty(ConfigCommonMainConstants.IGRP_SECRET_KEY.value(), EncrypDecrypt.SECRET_KEY_PUBLIC_PAGE);
		return EncrypDecrypt.encrypt(uid, secretKey);
	}
	
}
