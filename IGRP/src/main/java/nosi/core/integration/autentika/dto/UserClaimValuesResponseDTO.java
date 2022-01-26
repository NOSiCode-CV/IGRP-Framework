package nosi.core.integration.autentika.dto;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Iekiny Marcel
 * Jul 26, 2021
 */
public class UserClaimValuesResponseDTO {
	
	private List<ClaimDTO> claimDTOs; 
	
	public UserClaimValuesResponseDTO() {
		super();
		claimDTOs = new ArrayList<>(); 
	}

	public List<ClaimDTO> getClaimDTOs() {
		return claimDTOs;
	}

	public void setClaimDTOs(List<ClaimDTO> claimDTOs) {
		this.claimDTOs = claimDTOs;
	}
	
}
