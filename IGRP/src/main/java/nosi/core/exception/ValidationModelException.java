package nosi.core.exception;
/**
 * Emanuel
 * 25 May 2018
 */
public class ValidationModelException extends HttpException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ValidationModelException() {
		super(HttpException.STATUS_VALIDATION_MODEL, "Invalid Data");
	}
	
	public ValidationModelException(String statusText) {
		super(HttpException.STATUS_VALIDATION_MODEL, statusText);
	}

}
