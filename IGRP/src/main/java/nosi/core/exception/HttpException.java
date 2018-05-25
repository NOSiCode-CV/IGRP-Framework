package nosi.core.exception;
/**
 * @author Marcel Iekiny
 * Apr 17, 2017
 */
public class HttpException extends RuntimeException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7177517652723189397L;
	private int statusCode = 402;
	private String statusText;
	public static final int STATUS_VALIDATION_MODEL = 401;
	public static final int STATUS_FORBIDDEN = 403;
	public static final int STATUS_NOT_FOUND = 404;
	public static final int STATUS_PERMISSION = 501;
	public static final int STATUS_SERVER_ERROR = 500;
	
	public HttpException(int statusCode, String statusText){
		super("(" + statusCode + "): " + statusText);
		this.statusCode = statusCode;
		this.statusText = "(" + statusCode + ") - " + statusText;
	}
	
	public int getStatusCode(){
		return this.statusCode;
	}
	
	public String getStatusText(){
		return this.statusText;
	}

}
