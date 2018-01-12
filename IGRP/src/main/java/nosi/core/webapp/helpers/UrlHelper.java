package nosi.core.webapp.helpers;
/**
 * @author: Emanuel Pereira
 * 29 Aug 2017
 */
public class UrlHelper {

	public static String urlEncoding(String url){
		return url.replaceAll("\\s+", "%20").replaceAll("\'", "%27");
	}
}
