package nosi.core.exception;

public class PermissionException  extends HttpException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PermissionException(){
		super(HttpException.STATUS_PERMISSION, "No Permission.");
	}
	
	public PermissionException(String msg){
		super(HttpException.STATUS_PERMISSION, msg);
	}
	
}