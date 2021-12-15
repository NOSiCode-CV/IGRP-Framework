package nosi.core.integration.autentika.dto;
/**
 * @author Iekiny Marcel
 * Jul 26, 2021
 */
public class UpdateCredentialByAdminRequestDTO {
	
	private String userName; 
	private String newCredential; 

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNewCredential() {
		return newCredential;
	}

	public void setNewCredential(String newCredential) {
		this.newCredential = newCredential;
	}

}
