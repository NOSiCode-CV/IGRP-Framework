package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;

import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class ProcessDefinitionService extends Activit{

	private Integer version;
	private String nameLike;
	private String key;
	private Boolean suspended;
	private String description;
	private String deploymentId;
	private String deploymentUrl;
	private Boolean graphicalNotationDefined;
	private String resource;
	private String diagramaResource;
	private Boolean startFormDefined;

	
	public ProcessDefinitionService() {
		// TODO Auto-generated constructor stub
	}

	public ProcessDefinitionService getProcessDefinition(String id){
		ProcessDefinitionService d = new ProcessDefinitionService();
		ClientResponse response = new RestRequest().get("repository/process-definitions/",id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (ProcessDefinitionService) new RestRequest().convertJsonToDao(contentResp, ProcessDefinitionService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	@SuppressWarnings("unchecked")
	public List<ProcessDefinitionService> getProcessDefinitions(){
		List<ProcessDefinitionService> d = new ArrayList<>();
		ClientResponse response = new RestRequest().get("repository/process-definitions"+this.getFilter());
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				ProcessDefinitionService dep = (ProcessDefinitionService) new RestRequest().convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<ProcessDefinitionService>) new RestRequest().convertJsonToListDao(contentResp,"data", new TypeToken<List<ProcessDefinitionService>>(){}.getType());
			}else{
				this.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public List<ProcessDefinitionService> getProcessDefinitionsAtivos(){
		this.setFilter("?suspended=false");
		return this.getProcessDefinitions();
	}
	
	public boolean activateProcessDefinition(String id){
		return this.statusProcessDefinition(id,  "activate");
	}
	public boolean suspendProcessDefinition(String id){
		return this.statusProcessDefinition(id,  "suspend");
	}
	private boolean statusProcessDefinition(String id,String status){
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("action" ,status);
			jobj.put( "includeProcessInstances" , "true");
			jobj.put( "date" , new Date(System.currentTimeMillis()));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		ClientResponse response = new RestRequest().put("repository/process-definitions",jobj.toString(),id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			this.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			return response.getStatus()==200;
		}
		return false;
	}
	public ProcessDefinitionService create(ProcessDefinitionService deploy){
		ProcessDefinitionService d = new ProcessDefinitionService();
		ClientResponse response = new RestRequest().post("repository/process-definitions",new RestRequest().convertDaoToJson(deploy));
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==201){
				d = (ProcessDefinitionService) new RestRequest().convertJsonToDao(contentResp, ProcessDefinitionService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public ProcessDefinitionService update(ProcessDefinitionService deploy){
		ProcessDefinitionService d = new ProcessDefinitionService();
		ClientResponse response = new RestRequest().put("repository/process-definitions",new RestRequest().convertDaoToJson(deploy),deploy.getId());
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (ProcessDefinitionService) new RestRequest().convertJsonToDao(contentResp, ProcessDefinitionService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public boolean delete(String id){
		ClientResponse response = new RestRequest().delete("repository/process-definitions",id);
		return response!=null && response.getStatus()==204;
	}
	

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

	public String getDiagramaResource() {
		return diagramaResource;
	}

	public void setDiagramaResource(String diagramaResource) {
		this.diagramaResource = diagramaResource;
	}

	public Boolean getStartFormDefined() {
		return startFormDefined;
	}

	public void setStartFormDefined(Boolean startFormDefined) {
		this.startFormDefined = startFormDefined;
	}

}
