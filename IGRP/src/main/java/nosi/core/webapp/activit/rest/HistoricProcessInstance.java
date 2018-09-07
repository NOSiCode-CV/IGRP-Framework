package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Response;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * Emanuel
 * 12 Jun 2018
 */
public class HistoricProcessInstance extends Activit{

	private String processDefinitionId;
	private String processDefinitionUrl;
	private String businessKey;
	private String startTime;
	private String endTime;
	private String durationInMillis;
	private String startUserId;
	private String startActivityId;
	private String endActivityId;
	private String deleteReason;
	private Integer superProcessInstanceId;
    private List<TaskVariables> variables;
    private String tenantId;
       
    @SuppressWarnings("unchecked")
   	public List<HistoricProcessInstance> getHistoryOfProccessInstanceId(String processDefinitionKey){
   		List<HistoricProcessInstance> d = new ArrayList<>();
   		RestRequest request = new RestRequest();
   		Response response = request.get("history/historic-process-instances?processDefinitionKey="+processDefinitionKey+"&includeProcessVariables=true");
   		if(response!=null){
   			String contentResp = "";
   			InputStream is = (InputStream) response.getEntity();
   			try {
   				contentResp = FileHelper.convertToString(is);
   			} catch (IOException e) {
   				e.printStackTrace();
   			}
   			if(Response.Status.OK.getStatusCode() == response.getStatus()){		
   				HistoricProcessInstance dep = (HistoricProcessInstance) ResponseConverter.convertJsonToDao(contentResp,HistoricProcessInstance.class);
   				this.setTotal(dep.getTotal());
   				this.setSize(dep.getSize());
   				this.setSort(dep.getSort());
   				this.setOrder(dep.getOrder());
   				this.setStart(dep.getStart());
   				d = (List<HistoricProcessInstance>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<HistoricProcessInstance>>(){}.getType());
   			}else{
   				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
   			}
   		}
   		return d;
   	}
    
    @SuppressWarnings("unchecked")
   	public List<HistoricProcessInstance> getHistoryOfProccessInstanceIdFinished(String processDefinitionKey){
   		List<HistoricProcessInstance> d = new ArrayList<>();
   		RestRequest request = new RestRequest();
   		Response response = request.get("history/historic-process-instances?processDefinitionKey="+processDefinitionKey+"&finished=true&includeProcessVariables=true");
   		if(response!=null){
   			String contentResp = "";
   			InputStream is = (InputStream) response.getEntity();
   			try {
   				contentResp = FileHelper.convertToString(is);
   			} catch (IOException e) {
   				e.printStackTrace();
   			}
   			if(Response.Status.OK.getStatusCode() == response.getStatus()){		
   				HistoricProcessInstance dep = (HistoricProcessInstance) ResponseConverter.convertJsonToDao(contentResp,HistoricProcessInstance.class);
   				this.setTotal(dep.getTotal());
   				this.setSize(dep.getSize());
   				this.setSort(dep.getSort());
   				this.setOrder(dep.getOrder());
   				this.setStart(dep.getStart());
   				d = (List<HistoricProcessInstance>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<HistoricProcessInstance>>(){}.getType());
   			}else{
   				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
   			}
   		}
   		return d;
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
	public String getBusinessKey() {
		return businessKey;
	}
	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
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
	public String getDurationInMillis() {
		return durationInMillis;
	}
	public void setDurationInMillis(String durationInMillis) {
		this.durationInMillis = durationInMillis;
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
	public Integer getSuperProcessInstanceId() {
		return superProcessInstanceId;
	}
	public void setSuperProcessInstanceId(Integer superProcessInstanceId) {
		this.superProcessInstanceId = superProcessInstanceId;
	}
	public List<TaskVariables> getVariables() {
		return variables;
	}
	public void setVariables(List<TaskVariables> variables) {
		this.variables = variables;
	}
	public String getTenantId() {
		return tenantId;
	}
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}
    
}
