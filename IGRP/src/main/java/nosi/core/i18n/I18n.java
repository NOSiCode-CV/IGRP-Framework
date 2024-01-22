package nosi.core.i18n;

/**
 * Marcel Iekiny
 * Oct 27, 2017
 */
import java.util.ResourceBundle;
import gnu.gettext.GettextResource;
import org.apache.commons.lang3.StringUtils;
import java.io.Serializable;
import java.text.MessageFormat;

public final class I18n implements Serializable {

	private static final long serialVersionUID = 1788683894002641641L;
	
	private ResourceBundle bundle;

	public I18n(ResourceBundle bundle) {
		this.bundle = bundle;
	}

	public String t(String text) {
		if (bundle == null)
			return text;
		String result = GettextResource.gettext(bundle, StringUtils.stripAccents(text));
//		If the result is the normalize text, 
//		    return the result of text with special character
		if (result.equals(StringUtils.stripAccents(text)))			
			return GettextResource.gettext(bundle, text);		
		return result;
	}

	public String t(String text, Object... objects) {
       return MessageFormat.format(this.t(text), objects);
	}

	public String t(String text, String pluralText, long n) {
		if (bundle == null)
			return text;
       return GettextResource.ngettext(bundle, text, pluralText, n);
	}

	public String t(String text, String pluralText, long n, Object... objects) {
       return MessageFormat.format(this.t(text, pluralText, n), objects);
	}

	public ResourceBundle getBundle() {
		return this.bundle;
	}

}
