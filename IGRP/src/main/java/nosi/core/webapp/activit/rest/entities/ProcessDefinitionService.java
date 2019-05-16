package nosi.core.webapp.activit.rest.entities;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class ProcessDefinitionService extends Activiti implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer version;
	private String nameLike;
	private String key;
	private Boolean suspended;
	private String description;
	private String deploymentId;
	private String deploymentUrl;
	private Boolean graphicalNotationDefined;
	private String resource;
	private String diagramResource;
	private Boolean startFormDefined;
	private String tenantId;
	

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public String getNameLike() {
		return nameLike;
	}

	public void setNameLike(String nameLike) {
		this.nameLike = nameLike;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}


	public Boolean getSuspended() {
		return suspended;
	}

	public void setSuspended(Boolean suspended) {
		this.suspended = suspended;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDeploymentId() {
		return deploymentId;
	}

	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
	}

	public String getDeploymentUrl() {
		return deploymentUrl;
	}

	public void setDeploymentUrl(String deploymentUrl) {
		this.deploymentUrl = deploymentUrl;
	}

	public Boolean getGraphicalNotationDefined() {
		return graphicalNotationDefined;
	}

	public void setGraphicalNotationDefined(Boolean graphicalNotationDefined) {
		this.graphicalNotationDefined = graphicalNotationDefined;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public String getDiagramResource() {
		return diagramResource;
	}

	public void setDiagramResource(String diagramResource) {
		this.diagramResource = diagramResource;
	}

	public Boolean getStartFormDefined() {
		return startFormDefined;
	}
	
	public void setStartFormDefined(Boolean startFormDefined) {
		this.startFormDefined = startFormDefined;
	}	

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	@Override
	public String toString() {
		return "ProcessDefinitionService [version=" + version + ", nameLike=" + nameLike + ", key=" + key
				+ ", suspended=" + suspended + ", description=" + description + ", deploymentId=" + deploymentId
				+ ", deploymentUrl=" + deploymentUrl + ", graphicalNotationDefined=" + graphicalNotationDefined
				+ ", resource=" + resource + ", diagramResource=" + diagramResource + ", startFormDefined="
				+ startFormDefined + ", tenantId=" + tenantId + "]";
	}


}
