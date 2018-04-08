package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import javax.ws.rs.core.Response;
import com.google.gson.Gson;
import com.google.gson.annotations.Expose;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * Emanuel
 * 7 Feb 2018
 */
public class ProcessInstancesService extends Activit{

    private String businessKey;
    private String processDefinitionId;
    private String processDefinitionUrl;
	private String startTime;
	private String endTime;
	private String durationInMillis;
	private String startUserId;
	private String startActivityId;
	private String endActivityId;
	private String deleteReason;
	private String superProcessInstanceId;
	@Expose(serialize=false,deserialize=false)
	private List<TaskVariables> variables = new ArrayList<>();
	private String tenantId;
	
	public String getBusinessKey() {
		return businessKey;
	}
	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}
	public String getProcessDefinitionId() {
		return processDefinitionId;
	}
	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}
	public String getProcessDefinitionUrl() {
		return processDefinitionUrl;
	}
	public void setProcessDefinitionUrl(String processDefinitionUrl) {
		this.processDefinitionUrl = processDefinitionUrl;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartUserId() {
		return startUserId;
	}
	public void setStartUserId(String startUserId) {
		this.startUserId = startUserId;
	}
	public String getStartActivityId() {
		return startActivityId;
	}
	public void setStartActivityId(String startActivityId) {
		this.startActivityId = startActivityId;
	}
	public String getEndActivityId() {
		return endActivityId;
	}
	public void setEndActivityId(String endActivityId) {
		this.endActivityId = endActivityId;
	}
	public String getDeleteReason() {
		return deleteReason;
	}
	public void setDeleteReason(String deleteReason) {
		this.deleteReason = deleteReason;
	}
	public String getSuperProcessInstanceId() {
		return superProcessInstanceId;
	}
	public void setSuperProcessInstanceId(String superProcessInstanceId) {
		this.superProcessInstanceId = superProcessInstanceId;
	}
	public List<TaskVariables> getVariables() {
		return variables;
	}
	public void setVariables(List<TaskVariables> variables) {
		this.variables = variables;
	}

	
	public String getDurationInMillis() {
		return durationInMillis;
	}
	public void setDurationInMillis(String durationInMillis) {
		this.durationInMillis = durationInMillis;
	}
	public String getTenantId() {
		return tenantId;
	}
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
	public ProcessInstancesService historicProcess(String id){
		ProcessInstancesService d = new ProcessInstancesService();
		Response response = new RestRequest().get("history/historic-process-instances",id);
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
				d = (ProcessInstancesService) ResponseConverter.convertJsonToDao(contentResp,ProcessInstancesService.class);
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public boolean submitProcessFile(Part file, String processDefinitionId,String file_desc) throws IOException {
		try {
			Response response = new RestRequest().post("runtime/process-instances/"+processDefinitionId+"/variables?name="+file_desc+"&type=binary&scope=local", file);
			file.delete();
			return response.getStatus() == 201;
		} catch (IOException e) {
			e.printStackTrace();
		}
		file.delete();
		return false;
	}
	

	public boolean submitProcessObject(Serializable obj, String variableName,String scope){
			Gson gson = new Gson();
			List<Serializable> list = new ArrayList<>();
			list.add(obj);
			Response response = new RestRequest().post("runtime/process-instances/"+this.getId()+"/variables?name="+variableName+"&type="+obj.getClass().getTypeName()+"&scope="+scope, gson.toJson(list));
			return response.getStatus() == 201;
	}
	
	//Adiciona variaveis para completar tarefa
	public void addVariable(String name, String scope, String type, Object value, String valueUrl){
		this.variables.add(new TaskVariables(name, scope, type, value, valueUrl));
	}

	public void addVariable(String name, String scope, String type, Object value){
		this.variables.add(new TaskVariables(name, scope, type, value, ""));
	}

	public void addVariable(String name, String type, Object value){
		this.variables.add(new TaskVariables(name, "local", type, value, ""));
	}
	
	public boolean submitVariables() {
		Response response = new RestRequest().put("runtime/process-instances/"+this.getId()+"/variables", ResponseConverter.convertDaoToJson(this.variables));
		return response.getStatus() == 201;
	}
	@Override
	public String toString() {
		return "ProcessInstancesService [businessKey=" + businessKey + ", processDefinitionId=" + processDefinitionId
				+ ", processDefinitionUrl=" + processDefinitionUrl + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", durationInMillis=" + durationInMillis + ", startUserId=" + startUserId + ", startActivityId="
				+ startActivityId + ", endActivityId=" + endActivityId + ", deleteReason=" + deleteReason
				+ ", superProcessInstanceId=" + superProcessInstanceId + ", variables=" + variables + ", tenantId="
				+ tenantId + ", name=" + this.getName() + "]";
	}
	
	
}
