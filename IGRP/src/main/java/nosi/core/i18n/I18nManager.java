package nosi.core.i18n;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

import nosi.core.webapp.Component;
import nosi.core.webapp.Core;

/**
 * Marcel Iekiny
 * Oct 29, 2017
 */
public final class I18nManager implements Component{
	
	public static final String DEFAULT_CORE_BUNDLE_NAME = "nosi.core.i18n.igrp";
	public static final String DEFAULT_APP_BUNDLE_NAME = "nosi.webapps.dad.i18n.Resources"; 
	
	protected static final List<String> SKIP_DADS = new ArrayList<>(Arrays.asList("igrp", "igrp_studio", "tutorial")); 
	
	public static final int COOKIE_EXPIRE = 60*60*24*30; // 1 months 
	
	private I18n coreLanguage; // igrp language 
	private I18n appLanguage; 
	
	HttpServletRequest request; 
	
	private void newConfiguration() {
		String v = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null)
			for(Cookie cookie : cookies)
				if(cookie!=null && cookie.getName()!=null && cookie.getName().equals("igrp_lang")) {
					v = cookie.getValue();
					break;
				}
		String currentApp = Core.getCurrentDad(); 
		String defaultAppBundleName = DEFAULT_APP_BUNDLE_NAME.replace("dad", currentApp); 
		String[] aux;
		if(v != null && !v.isEmpty() && (aux = v.split("_")).length == 2) {// cookie ok 
			this.coreLanguage = I18nFactory.createI18n(DEFAULT_CORE_BUNDLE_NAME, new Locale(aux[0], aux[1])); 
			this.appLanguage = !SKIP_DADS.contains(currentApp) ? I18nFactory.createI18n(defaultAppBundleName, new Locale(aux[0], aux[1])) : this.coreLanguage; 
		}else {
			this.coreLanguage = I18nFactory.createI18n(DEFAULT_CORE_BUNDLE_NAME, new Locale("pt","PT"));  //request.getLocale()
			this.appLanguage = !SKIP_DADS.contains(currentApp) ? I18nFactory.createI18n(defaultAppBundleName,  new Locale("pt","PT")) : this.coreLanguage;  //request.getLocale()
		}
	}
	
	public I18n getAppLanguage() {
		return appLanguage; 
	}
	
	public I18n getCoreLanguage() {
		return coreLanguage;
	}

	@Override
	public void init(HttpServletRequest request) { 
		this.request = request; 
		this.newConfiguration();
	}

	@Override
	public void destroy() {
	}
}
