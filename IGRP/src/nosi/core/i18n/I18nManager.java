package nosi.core.i18n;

import java.util.HashMap;
import java.util.Map;

import nosi.core.webapp.Component;
import nosi.core.webapp.Igrp;

/**
 * Marcel Iekiny
 * Oct 29, 2017
 */
public final class I18nManager implements Component{
	
	public static final String defaultPath = "nosi.core.i18n.pt_pt";
	
	private Map<String, I18n> laguages;
	
	private boolean loadDefaultConfig;
	
	public I18nManager() {}
	
	@Override
	public void init() {
		if(!this.loadDefaultConfig) {
			this.laguages = new HashMap<String, I18n>();
			String aux = Igrp.getInstance().getServlet().getInitParameter("default_language");
			I18n igrpCore = I18nFactory.createI18n("igrp", (aux == null || aux.isEmpty() ? I18nManager.defaultPath : aux));
			this.laguages.put(igrpCore.getName(), igrpCore);
			Igrp.getInstance().getRequest().getSession().setAttribute("i18n", this.laguages);
			this.loadDefaultConfig = true;
		}
	}
	
	public void newIgrpCoreLanguage(String path) {
		newLanguageForApp("igrp", path);
	}
	
	public void newLanguageForApp(String name, String path) {
		I18n igrpCore = this.laguages.get(name);
		this.laguages.replace(name, igrpCore);
	}
	
	public I18n getAppLanguage(String name) {
		return this.laguages.get(name);
	}
	
	public I18n getIgrpCore(String name) {
		I18n igrpCore = this.laguages.get(name);
		return igrpCore;
	}
	
	@Override
	public void destroy() {
	}
}
