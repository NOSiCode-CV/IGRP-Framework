package nosi.core.exception;

public class PermissionException  extends HttpException{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PermissionException(){
		super(501, "No Permission.");
	}
	
	public PermissionException(String msg){
		super(501, msg);
	}
	
}