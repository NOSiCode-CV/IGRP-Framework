package nosi.core.i18n;

import nosi.core.webapp.Igrp;
/**
 * Marcel Iekiny
 * Nov 4, 2017
 */
public final class Translator { // Not extends  
	
	private Translator() {} // 
	
	public static String gt(String text) { // call the GNU Gettext for IGRP-core 
		return gt("igrp", text);
	}
	
	public static String gt(String name, String text) { // call the GNU Gettext for IGRP-apps  
		I18n language = Igrp.getInstance().getI18nManager().getIgrpCore(name);
		if(language == null)
			return text;
		String r = language.t(text);
	return r;
	}
}
