package nosi.core.webapp;
/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public interface Identity {
	
	Object findIdentityById(int identityId);
	int getIdentityId();
	Object findIdentityByUsername(String username);
	boolean validate(String inputPassword);
	String getAuthenticationKey();
}
