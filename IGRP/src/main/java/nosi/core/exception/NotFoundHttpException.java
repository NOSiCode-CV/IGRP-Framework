package nosi.core.exception;
/**
 * @author Marcel Iekiny
 * Apr 17, 2017
 */
public class NotFoundHttpException extends HttpException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9019701727400672895L;

	public NotFoundHttpException(){
		super(HttpException.STATUS_NOT_FOUND, "Not Found Http Exception");
	}
	
	public NotFoundHttpException(String msg){
		super(HttpException.STATUS_NOT_FOUND, msg);
	}
	
}
