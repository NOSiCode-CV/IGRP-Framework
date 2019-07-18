package nosi.core.webapp.security;

import javax.servlet.http.Cookie;
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
		int isPublic = Core.getParamInt("isPublic").intValue();
		if(!PagesScapePermission.PAGES_SCAPE_ENCRYPT.contains(r.toLowerCase()) && !checkIsPublic) {
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
		if(Core.isNotNull(lang)) {
			if (new SettingsController().getIdiomaMap().containsKey(lang)) {			
				Igrp.getInstance().getI18nManager().newIgrpCoreLanguage(lang);				
				Cookie cookie = new Cookie("igrp_lang", lang);
				cookie.setMaxAge(I18nManager.cookieExpire);			
				Igrp.getInstance().getResponse().addCookie(cookie);		
			}
		}
	}
	
	/**
	 * Check if page is public
	 * @param route
	 * @return
	 */
	public static boolean isPublic(String route) {
		final boolean withoutLogin = PagesScapePermission.PAGES_WIDTHOUT_LOGIN.contains(route.toLowerCase());
		int isPublic = Core.getParamInt("isPublic").intValue();
		if(isPublic ==1 || isPublic==2) {
			String r = route;
			if(isPublic==2) {
				r = Core.decryptPublicPage(route);
			}
			if(Core.isNotNull(r)) {
				String[] c = r.split("/");
				if(Core.isNotNull(c) && Core.isNotNullMultiple(c[0],c[1])) {
					final boolean isPublicPage = new Action().isPublicPage(c[0], c[1]);
					if (!isPublicPage)
						throw new NotFoundHttpException();
					changeLanguage();//Change language in case page is public
					return isPublicPage;
				}
			}
		}
		return withoutLogin;
	}

}
