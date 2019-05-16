package nosi.core.webapp.activit.rest.entities;
/**
 * Emanuel
 * 14 May 2019
 */
public class TaskVariableDetails  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String propertyId;
    private String propertyValue;
    
	public String getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}
	public String getPropertyValue() {
		return propertyValue;
	}
	public void setPropertyValue(String propertyValue) {
		this.propertyValue = propertyValue;
	}
	
	@Override
	public String toString() {
		return "TaskVariableDetails [propertyId=" + propertyId + ", propertyValue=" + propertyValue + "]";
	}
    
	
}
