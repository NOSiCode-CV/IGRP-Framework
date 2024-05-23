package nosi.core.webapp.security;

import jakarta.servlet.http.Cookie;

import nosi.core.exception.NotFoundHttpException;
import nosi.core.i18n.I18nManager;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.pages.settings.SettingsController;

/**
 * Emanuel
 * 5 Apr 2019
 */
public class SecurtyCallPage {

	public static String resolvePage(String route) {
		String r = route;
		final boolean checkIsPublic = isPublic(r);
		int isPublic = Core.getParamInt("isPublic");
		if(!PagesScapePermission.getPagesScapeEncrypt().contains(r.toLowerCase()) && !checkIsPublic) {
			r = Core.decrypt(r);	
		}
		if(checkIsPublic && isPublic==2) {
			r = Core.decryptPublicPage(r);
		}
		return r;
	}

	
	/**
	 * Change language
	 */
	private static void changeLanguage() {
		String lang = Core.getParam("lang");
		if(Core.isNotNull(lang) &&  (new SettingsController().getIdiomaMap().containsKey(lang))) { 			
				Cookie cookie = new Cookie("igrp_lang", lang);
				cookie.setMaxAge(I18nManager.COOKIE_EXPIRE);			
				Igrp.getInstance().getResponse().addCookie(cookie);		
			
		}
	}
	
	/**
	 * Check if page is public
	 * @param route
	 * @return
	 */
	public static boolean isPublic(String route) {
		final boolean withoutLogin = PagesScapePermission.getPagesWithoutLogin().contains(route.toLowerCase());
		if(withoutLogin) {		
			return withoutLogin;
		}		
		int isPublic = Core.getParamInt("isPublic");
		if(isPublic ==1 || isPublic==2) {
			String r = route;
			if(isPublic==2) {
				r = Core.decryptPublicPage(route);
			}
			if(Core.isNotNull(r)) {
				String[] c = r.split("/");
				if(Core.isNotNull(c) && c.length > 1 && Core.isNotNullMultiple(c[0],c[1])) {
					final boolean isPublicPage = new Action().isPublicPage(c[0], c[1]);
					if (!isPublicPage)
						throw new NotFoundHttpException("Page not public! Página não é pública! - ("+r+")");
					changeLanguage();//Change language in case page is public
					return isPublicPage;
				}
			}
		}
		return withoutLogin;
	}

}
