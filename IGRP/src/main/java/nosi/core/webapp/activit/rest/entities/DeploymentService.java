package nosi.core.webapp.activit.rest.entities;



/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */

public class DeploymentService extends Activiti implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String deploymentTime;
	private String tenantId;
	
	public String getDeploymentTime() {
		return deploymentTime;
	}

	public void setDeploymentTime(String deploymentTime) {
		this.deploymentTime = deploymentTime;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	@Override
	public String toString() {
		return "DeploymentService [deploymentTime=" + deploymentTime + ", tenantId=" + tenantId + "]";
	}


}
