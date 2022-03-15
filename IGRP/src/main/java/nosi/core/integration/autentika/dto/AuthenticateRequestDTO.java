package nosi.core.integration.autentika.dto;
/**
 * @author Iekiny Marcel
 * Jul 26, 2021
 */
public class AuthenticateRequestDTO {
	
	private String userName;
	private String credential;
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getCredential() {
		return credential;
	}
	
	public void setCredential(String credential) {
		this.credential = credential;
	}
	
}
