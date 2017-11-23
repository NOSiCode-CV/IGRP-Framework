package nosi.core.i18n;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;

import nosi.core.webapp.Component;
import nosi.core.webapp.Igrp;

/**
 * Marcel Iekiny
 * Oct 29, 2017
 */
public final class I18nManager implements Component{
	
	public static final String defaultPath = "nosi.core.i18n.igrp";
	
	public static final int cookieExpire = 60*60*24*30; // 1 months 
	
	private Map<String, I18n> laguages;
	
	
	public I18nManager() {}
	
	@Override
	public void init() {
		if(Igrp.getInstance().getRequest().getSession().getAttribute("i18n") == null) {
			this.newConfiguration();
		}else {
			try {
				this.laguages = (Map<String, I18n>) Igrp.getInstance().getRequest().getSession().getAttribute("i18n");
			}catch(Exception e) {
				this.newConfiguration();
			}
		}
	}
	
	private void newConfiguration() {
		boolean isCookieOk = false;
		String v = "";
		Cookie cookies[] = Igrp.getInstance().getRequest().getCookies();
		if(cookies != null)
			for(Cookie cookie : cookies)
				if(cookie.getName().equals("igrp_lang")) {
					v = cookie.getValue();
					break;
				}
		if(v != null && !v.isEmpty()) {// cookie ok 
			this.laguages = new HashMap<String, I18n>();
			//String aux =  I18nManager.defaultPath.replaceAll("en_us", v);	
			I18n igrpCore = I18nFactory.createI18n("igrp", v);
			try {
				this.laguages.put(igrpCore.getName(), igrpCore);
			}catch(Exception e) {}
			Igrp.getInstance().getRequest().getSession().setAttribute("i18n", this.laguages);
		}else {
			this.laguages = new HashMap<String, I18n>();
			String aux = Igrp.getInstance().getServlet().getInitParameter("default_language");
			I18n igrpCore = I18nFactory.createI18n("igrp", (aux == null || aux.isEmpty() ? "en_US" : aux)); // default locale
			try {
				this.laguages.put(igrpCore.getName(), igrpCore);
			}catch(Exception e) {}
			Igrp.getInstance().getRequest().getSession().setAttribute("i18n", this.laguages);
		}
	}
	
	public void newIgrpCoreLanguage(String path) {
		newLanguageForApp("igrp", path);
	}
	
	public void newLanguageForApp(String name, String path) {
		I18n i18n = I18nFactory.createI18n(name, path);
		this.laguages.replace(name, i18n);
	}
	
	public I18n getAppLanguage(String name) {
		return this.laguages.get(name);
	}
	
	public I18n getIgrpCore(String name) {
		I18n igrpCore = this.laguages.get(name);
		return igrpCore;
	}
	
	public Locale getCurrentLocale() {
		return this.getAppLanguage("igrp").getLocale();
	}
	
	@Override
	public void destroy() {
	}
}
