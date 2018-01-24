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
	private int statusCode;
	private String statusText;
	
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
