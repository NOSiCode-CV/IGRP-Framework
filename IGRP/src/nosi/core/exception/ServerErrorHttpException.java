package nosi.core.exception;
/**
 * @author Marcel Iekiny
 * Apr 17, 2017
 */
public class ServerErrorHttpException extends HttpException{
	
	public ServerErrorHttpException(){
		super(500, "Server Error Http Exception.");
	}
	
	public ServerErrorHttpException(String msg){
		super(500, msg);
	}
	
}
