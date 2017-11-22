package nosi.core.i18n;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 * Marcel Iekiny
 * Oct 27, 2017
 */
public final class I18nFactory {

	private I18nFactory() {}
	
	public static I18n createI18n(String name, String l) { //  
		try {
			String []aux = l.split("_");
			Locale locale = new Locale(aux[0], aux[1]);
			ResourceBundle bundle = ResourceBundle.getBundle(I18nManager.defaultPath, locale);			
			I18n i18n = new I18n(name, bundle);
			
			return i18n;
			
		}catch(Exception e) { // MissingResourceException 
			e.printStackTrace();
		}
		return null;
	}
	
	public static void main(String ...args) {
		// create a new ResourceBundle with specified locale
	   ResourceBundle bundle =
	   ResourceBundle.getBundle(I18nManager.defaultPath, new Locale("en", "us"));

	   // print the text assigned to key "hello"
	   System.out.println("" + bundle.getString("Data Fim"));

	   // get the locale
	   System.out.println("" + bundle.getLocale());
		/*Locale locale = new Locale("en", "us");
		ResourceBundle bundle = ResourceBundle.getBundle("nosi.core.i18n.pt_pt", locale);
		System.out.println(locale);*/
	}
}
