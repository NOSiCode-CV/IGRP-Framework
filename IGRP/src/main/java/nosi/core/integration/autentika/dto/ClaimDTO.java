package nosi.core.integration.autentika.dto;
/**
 * @author Iekiny Marcel
 * Jul 26, 2021
 */
public class ClaimDTO { 
	
	 private String claimUri; 
	 private String description; 
	 private String dialectURI; 
	 private int displayOrder; 
	 private String displayTag; 
	 private String regEx;
	 private boolean required; 
	 private boolean supportedByDefault; 
	 private String value;
	 
	public String getClaimUri() {
		return claimUri;
	}
	
	public void setClaimUri(String claimUri) {
		this.claimUri = claimUri;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getDialectURI() {
		return dialectURI;
	}
	
	public void setDialectURI(String dialectURI) {
		this.dialectURI = dialectURI;
	}
	
	public int getDisplayOrder() {
		return displayOrder;
	}
	
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	
	public String getDisplayTag() {
		return displayTag;
	}
	
	public void setDisplayTag(String displayTag) {
		this.displayTag = displayTag;
	}
	
	public String getRegEx() {
		return regEx;
	}
	
	public void setRegEx(String regEx) {
		this.regEx = regEx;
	}
	
	public boolean isRequired() {
		return required;
	}
	
	public void setRequired(boolean required) {
		this.required = required;
	}
	
	public boolean isSupportedByDefault() {
		return supportedByDefault;
	}
	
	public void setSupportedByDefault(boolean supportedByDefault) {
		this.supportedByDefault = supportedByDefault;
	}
	
	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	}

}
