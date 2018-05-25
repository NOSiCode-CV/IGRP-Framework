package nosi.core.exception;
/**
 * @author Marcel Iekiny
 * Apr 17, 2017
 */
public class ServerErrorHttpException extends HttpException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8819720701219942201L;

	public ServerErrorHttpException(){
		super(HttpException.STATUS_SERVER_ERROR, "Server Error Http Exception.");
	}
	
	public ServerErrorHttpException(String msg){
		super(HttpException.STATUS_SERVER_ERROR, msg);
	}
	
}
