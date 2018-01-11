package nosi.core.i18n;
/**
 * Marcel Iekiny
 * Oct 27, 2017
 */
import java.util.Locale;
import java.util.ResourceBundle;
import gnu.gettext.GettextResource;

import java.io.Serializable;
import java.text.MessageFormat;

public final class I18n implements Serializable{
	
	private ResourceBundle bundle;
	private Locale locale;
	
	private String name;
	private String path;
	
	public I18n(String name, ResourceBundle bundle) {
		this.name = name;
		this.bundle =  bundle;
		this.locale = bundle.getLocale();
	}
	
	public final String t(String text){
		if(bundle == null) return text;
		String result = GettextResource.gettext(bundle, text);
		return result;
	}
	
	public final String t(String text, Object... objects) {
		String result = MessageFormat.format(this.t(text), objects);
		return result;
	}
	
	public final String t(String text, String pluralText, long n) {
		if(bundle == null) return text;
		String result = GettextResource.ngettext(bundle, text, pluralText, n);
		return result;
	}
	
	public final String t(String text, String pluralText, long n, Object... objects) {
		String result = MessageFormat.format(this.t(text, pluralText, n), objects);
		return result;
	}

	public Locale getLocale() {
		return locale;
	}

	public String getName() {
		return this.name;
	}
}
