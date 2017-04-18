package nosi.core.exception;
/**
 * @author Marcel Iekiny
 * Apr 17, 2017
 */
public class NotFoundHttpException extends HttpException{

	public NotFoundHttpException(){
		super(404, "Not Found Http Exception");
	}
	
	public NotFoundHttpException(String msg){
		super(404, msg);
	}
	
}
