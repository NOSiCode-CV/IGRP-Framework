package nosi.core.authentication;

import java.util.Locale;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.User;

public final class DBAuthenticationManager {
	
	private DBAuthenticationManager() {}
	
	public static boolean authenticate(String username, String password, HttpServletRequest request) {
		if(Core.isNullMultiple(username,password))
			return false;
					
		User user = new User().findIdentityByUsername(username);
		if (user == null) {
			user = new User().findIdentityByEmail(username);
			if (user != null)
				username=user.getUser_name();
		}
		if (user != null && user.validate(nosi.core.webapp.User.encryptToHash(username.toLowerCase(Locale.ROOT).trim() + password, "SHA-256"))) {
			if(user.getStatus() == 1) {
				Profile profile = new Profile().getByUser(user.getId());
				if(profile == null)
					throw new IllegalStateException("Nenhum perfil foi encontrado para o utilizador.");
				AuthenticationManager.createSecurityContext(user, request.getSession(false));
				AuthenticationManager.afterLogin(profile, user, request);
				return true;
			}else
				throw new IllegalStateException("Utilizador desativado. Por favor contacte o Administrador.");
		}else
			throw new IllegalStateException("A sua conta ou palavra-passe está incorreta. Se não se lembra da sua palavra-passe, contacte o Administrador.");
	}
	
	public static void signOut(User currentUser, HttpServletRequest request, HttpServletResponse response) {
		currentUser.setIsAuthenticated(0); 
		currentUser.update();
		AuthenticationManager.destroySecurityContext(request.getSession(false), response);
		AuthenticationManager.afterLogout(request.getSession(false).getId());
		AuthenticationManager.clearAllCookieExceptLocale(request, response);
	}

}
