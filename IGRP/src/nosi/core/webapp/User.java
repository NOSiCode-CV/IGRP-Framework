package nosi.core.webapp;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public class User{
	
	private Object identity;
	
	public User(){
		
	}
	
	public boolean login(){ // Make login and authenticate the user ... using session and cookies
		return true;
	}
	
	private boolean authenticate(){
		return true;
	}
	
	public boolean logout(){ // Reset all login session/cookies information
		return true;
	}
	
	public Object getIdentity(){
		return this.identity;
	}
	
}
