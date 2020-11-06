package nosi.core.webapp.webservices.helpers;


/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class ResponseError{
	
	private int statusCode;
	private String message;
	private String exception;
	
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getException() {
		return exception;
	}
	public void setException(String exception) {
		this.exception = exception;
	}
	@Override
	public String toString() {
		return "Response [statusCode=" + statusCode + ", message=" + message + ", exception=" + exception + "]";
	}
}
