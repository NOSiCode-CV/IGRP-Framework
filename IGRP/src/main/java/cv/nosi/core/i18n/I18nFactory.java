package cv.nosi.core.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * Marcel Iekiny
 * Oct 27, 2017
 */
public final class I18nFactory {

	private I18nFactory() {}
	
	public static I18n createI18n(String name, Locale locale) {  
		I18n i18n = null; 
		try {	
			i18n = new I18n(ResourceBundle.getBundle(name, locale)); 
		}catch(Exception e) { 
			try {
				i18n = new I18n(ResourceBundle.getBundle(I18nManager.DEFAULT_CORE_BUNDLE_NAME, locale)); 
			} catch (Exception e2) {
				// e.printStackTrace(); 
			}
		}
		return i18n;
	}
}
