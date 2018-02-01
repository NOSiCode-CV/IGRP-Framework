package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * Emanuel 1 Feb 2018
 */
public class QueryHistoricDetail extends Activit {

	private String processInstanceId;
	private String processInstanceUrl;
	private String executionId;
	private String activityInstanceId;
	private String taskId;
	private String taskUrl;
	private String time;
	private String detailType;
	private String revision;
	private TaskVariables variable;
	private String propertyId;
	private Object propertyValue;

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getProcessInstanceUrl() {
		return processInstanceUrl;
	}

	public void setProcessInstanceUrl(String processInstanceUrl) {
		this.processInstanceUrl = processInstanceUrl;
	}

	public String getExecutionId() {
		return executionId;
	}

	public void setExecutionId(String executionId) {
		this.executionId = executionId;
	}

	public String getActivityInstanceId() {
		return activityInstanceId;
	}

	public void setActivityInstanceId(String activityInstanceId) {
		this.activityInstanceId = activityInstanceId;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskUrl() {
		return taskUrl;
	}

	public void setTaskUrl(String taskUrl) {
		this.taskUrl = taskUrl;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDetailType() {
		return detailType;
	}

	public void setDetailType(String detailType) {
		this.detailType = detailType;
	}

	public String getRevision() {
		return revision;
	}

	public void setRevision(String revision) {
		this.revision = revision;
	}

	public TaskVariables getVariable() {
		return variable;
	}

	public void setVariable(TaskVariables variable) {
		this.variable = variable;
	}

	public String getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}

	public Object getPropertyValue() {
		return propertyValue;
	}

	public void setPropertyValue(Object propertyValue) {
		this.propertyValue = propertyValue;
	}
	
	public List<QueryHistoricDetail> queryHistoricDetail(String taskId){
		JSONObject json = new JSONObject();
		try {
			json.put("taskId",taskId);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		List<QueryHistoricDetail> d = new ArrayList<>();
		Response response = new RestRequest().post("query/historic-detail",json.toString());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(Response.Status.OK.getStatusCode() == response.getStatus()){		
				QueryHistoricDetail dep = (QueryHistoricDetail) ResponseConverter.convertJsonToDao(contentResp,QueryHistoricDetail.class);
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<QueryHistoricDetail>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<QueryHistoricDetail>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
}
