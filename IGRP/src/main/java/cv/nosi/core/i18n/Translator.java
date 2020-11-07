package cv.nosi.core.i18n;

import cv.nosi.core.webapp.Igrp;
/**
 * Marcel Iekiny
 * Nov 4, 2017
 */
public final class Translator { 
	
	private Translator() {} 
	
	public static String gt(String text) {
		String r = "";
		if(text == null || text.trim().isEmpty()) 
			return r; 
		r = text;
		if(Igrp.getInstance().getI18nManager() != null) { 
			I18n coreLanguage = Igrp.getInstance().getI18nManager().getCoreLanguage(); 
			I18n appLanguage = Igrp.getInstance().getI18nManager().getAppLanguage(); 
			if(appLanguage != null) {
				r = appLanguage.t(text);  
				if(coreLanguage != null && text.equals(r)) // If none is found search in coreLanguage (parent) 
					r = coreLanguage.t(text);
			}
		}
		return r;
	}
}
