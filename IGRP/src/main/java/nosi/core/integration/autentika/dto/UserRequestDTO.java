package nosi.core.integration.autentika.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Iekiny Marcel
 * Jul 27, 2021
 */
public class UserRequestDTO {
	
	private String userName; 
	private String credential; 
	private List<String> roleList; 
	private List<ClaimDTO> claims;
	private String profileName; 
	private boolean requirePasswordChange;
	
	public UserRequestDTO() {
		super();
		this.claims = new ArrayList<>();
		this.roleList = new ArrayList<>();
	}

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

	public List<String> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<String> roleList) {
		this.roleList = roleList;
	}

	public List<ClaimDTO> getClaims() {
		return claims;
	}

	public void setClaims(List<ClaimDTO> claims) {
		this.claims = claims;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public boolean isRequirePasswordChange() {
		return requirePasswordChange;
	}

	public void setRequirePasswordChange(boolean requirePasswordChange) {
		this.requirePasswordChange = requirePasswordChange;
	}

}
