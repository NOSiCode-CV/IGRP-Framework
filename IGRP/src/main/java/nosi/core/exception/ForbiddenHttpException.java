package nosi.core.exception;
/**
 * @author Marcel Iekiny
 * Apr 17, 2017
 */
public class ForbiddenHttpException extends HttpException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6333395527444064579L;

	public ForbiddenHttpException() {
		super(403, "Forbidden Http Exception");
	}
	
	public ForbiddenHttpException(String msg){
		super(403, msg);
	}
	
}
