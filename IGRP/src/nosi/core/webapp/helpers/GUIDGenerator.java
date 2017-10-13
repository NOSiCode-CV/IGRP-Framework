package nosi.core.webapp.helpers;

import java.util.UUID;

/**
 * @author: Emanuel Pereira
 * 12 Oct 2017
 */
public class GUIDGenerator {

	public static String getGUID(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString();
	}
	
	public static String getGUIDWithBraces(){
		UUID uuid = UUID.randomUUID();
		return "{"+uuid.toString().toUpperCase()+"}";
	}
	
	public static String getGUIDUpperCase(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString().toUpperCase();
	}
	
	public static String getGUIDLowerCase(){
		UUID uuid = UUID.randomUUID();
		return uuid.toString().toLowerCase();
	}
	
	public static UUID getRandomUUID(){
		return UUID.randomUUID();
	}
}
