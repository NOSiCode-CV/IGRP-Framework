package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXB;
import javax.xml.bind.Unmarshaller;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.activit.rest.binding.tasks_process.TaskOfProcess;
import nosi.core.webapp.activit.rest.binding.tasks_process.UserTask;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;
import nosi.core.xml.XMLApplicationReader;
import nosi.webapps.igrp.dao.Application;

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
	private String diagramResource;
	private Boolean startFormDefined;
	@Expose(serialize=false,deserialize=false)
	private List<TaskVariables> variables = new ArrayList<>();


	public ProcessDefinitionService getProcessDefinition(String id){
		Response response = new RestRequest().get("repository/process-definitions/",id);
		ProcessDefinitionService process = new ProcessDefinitionService();
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				process = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,ProcessDefinitionService.class);
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return process;
	}
	
	public String getDiagram(String url){
		String d = null;
		new RestRequest().setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = new RestRequest().get(url);		
		if(response!=null){
			if(response.getStatus()==200) {
				InputStream finput =(InputStream) response.getEntity();
				try {
					byte[] imageBytes = new byte[response.getLength()];
					finput.read(imageBytes, 0, imageBytes.length);
					finput.close();
					return Base64.getEncoder().encodeToString(imageBytes);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return d;
	}
	
	@SuppressWarnings("unchecked")
	public List<ProcessDefinitionService> getProcessDefinitions(){
		List<ProcessDefinitionService> d = new ArrayList<>();
		Response response = new RestRequest().get("repository/process-definitions"+this.getFilter());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(Response.Status.OK.getStatusCode() == response.getStatus()){				
				ProcessDefinitionService dep = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp, ProcessDefinitionService.class);
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<ProcessDefinitionService>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<ProcessDefinitionService>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public List<ProcessDefinitionService> getProcessDefinitionsAtivos(Integer idApp){
		this.setFilter("?suspended=false&latest=true&size=1000000000&tenantId="+idApp);
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
		Response response = new RestRequest().put("repository/process-definitions",jobj.toString(),id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			return response.getStatus()==200;
		}
		return false;
	}
	public ProcessDefinitionService create(ProcessDefinitionService p){
		ProcessDefinitionService d = new ProcessDefinitionService();
		Response response = new RestRequest().post("repository/process-definitions",ResponseConverter.convertDaoToJson(p));
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==201){
				d = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp, ProcessDefinitionService.class);
			}else{
				d.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public ProcessDefinitionService update(ProcessDefinitionService p){
		ProcessDefinitionService d = new ProcessDefinitionService();
		Response response = new RestRequest().put("repository/process-definitions",ResponseConverter.convertDaoToJson(p),p.getId());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				d = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp, ProcessDefinitionService.class);
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public boolean delete(String id){
		Response response = new RestRequest().delete("repository/process-definitions",id);
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
	
	

	@Override
	public String toString() {
		return "ProcessDefinitionService [version=" + version + ", nameLike=" + nameLike + ", key=" + key
				+ ", suspended=" + suspended + ", description=" + description + ", deploymentId=" + deploymentId
				+ ", deploymentUrl=" + deploymentUrl + ", graphicalNotationDefined=" + graphicalNotationDefined
				+ ", resource=" + resource + ", diagramaResource=" + diagramResource + ", startFormDefined="
				+ startFormDefined + "]";
	}

	public Map<String,String> mapToComboBox(Integer idApp) {
		List<ProcessDefinitionService> list = this.getProcessDefinitionsAtivos(idApp);
		Map<String,String> map = new HashMap<>();
		map.put(null, "--- Selecionar Processo ----");
		map.putAll(list.stream().collect(Collectors.toMap(ProcessDefinitionService::getId, ProcessDefinitionService::getName)));
		return map;
	}
	
	public List<TaskService> getTasks(String processId){
		List<TaskService> list = new ArrayList<>();
		RestRequest req=new RestRequest();
		req.setAccept_format(MediaType.APPLICATION_XML);
		Response response = req.get("repository/process-definitions/"+processId+"/resourcedata");
		if(response!=null){
			InputStream is = (InputStream) response.getEntity();
			try {
				String xml = FileHelper.convertToString(is);
				 xml = xml.replace("xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"", "");
				StringReader r = new StringReader(xml);
				TaskOfProcess listTasks = JAXB.unmarshal(r, TaskOfProcess.class);
				if(listTasks!=null && listTasks.getProcess()!=null) {
					for(UserTask task:listTasks.getProcess().get(0).getUserTask()) {
						TaskService t = new TaskService();
						t.setId(listTasks.getProcess().get(0).getId()+"_"+task.getId());
						t.setName(task.getName());
						list.add(t);
					}
					if(listTasks.getProcess().get(0).getSubProcess()!=null) {
						for(UserTask task:listTasks.getProcess().get(0).getSubProcess().getUserTask()) {
							TaskService t = new TaskService();
							t.setId(listTasks.getProcess().get(0).getSubProcess().getId()+"_"+task.getId());
							t.setName(task.getName());
							list.add(t);
						}
					}
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return list;
	}

}
