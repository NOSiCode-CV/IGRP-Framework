package nosi.core.integration.autentika.dto;
/**
 * @author Iekiny Marcel
 * Jul 26, 2021
 */
public class UserClaimValuesRequestDTO {
	
	private String userName; 
	private String profileName;
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getProfileName() {
		return profileName;
	}
	
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	
}
