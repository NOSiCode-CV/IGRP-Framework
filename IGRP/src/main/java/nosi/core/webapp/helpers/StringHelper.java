package nosi.core.webapp.helpers;

import java.io.UnsupportedEncodingException;

/**
 * @author: Emanuel Pereira
 * 25 Oct 2017
 */
public class StringHelper {

	/*Camel Case to first letter of string
	 * 
	 * listpage => Listpage
	 */
	public static String camelCaseFirst(String string){
		return string.substring(0, 1).toUpperCase() + string.substring(1);
	}
	
	public static String camelCase(String string,String regex,String replacement) {
		return camelCase(string.replace(regex, replacement));
	}
	
	/*Removel all space of string
	 * List page => Listpage
	 */
	public static String removeSpace(String string){
		return string.replaceAll("\\s+", "");
	}
	
	/*Camel Case to string
	 * List page => List Page
	 */
	public static String camelCase(String string){
		String []strting_part = string.split("\\s+");
		String result = "";
		for(String s:strting_part)
			result += StringHelper.camelCaseFirst(s);
		return result;
	}
	
	/*Validade the className for Java Class
	 * 
	 */
	public static boolean validateClassName(String className){
		return className.matches("([a-zA-Z_$][a-zA-Z\\d_$]*\\.)*[a-zA-Z_$][a-zA-Z\\d_$]*");
	}
	
	public static String removeSpecialCharaterAndSpace(String string) {
		string = string.replaceAll("[^a-zA-Z0-9]", "_");
		string = removeSpace(string);
		return string;
	}

	public static String decode(String header_text) {
		try {
			header_text = new String(header_text.getBytes("UTF-8"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return header_text;
	}
	
}
