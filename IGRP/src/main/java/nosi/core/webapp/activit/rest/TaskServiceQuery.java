package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * Emanuel
 * 10 Jan 2018
 */
public class TaskServiceQuery extends TaskService {

	private String startTime;
	private String endTime;
	private String claimTime;
	private List<TaskVariablesQuery> paramsQuery;
	private JSONObject json_Variables = new JSONObject();
	
	public TaskServiceQuery() {
		super();
		this.paramsQuery = new ArrayList<>();
	}

	public TaskServiceQuery(String startTime, String endTime, String claimTime) {
		this();
		this.startTime = startTime;
		this.endTime = endTime;
		this.claimTime = claimTime;
	}
	
	public void addFilter(String filterName,String value) {
		if(Core.isNotNull(filterName)) {
			try {
				json_Variables.put(filterName, value);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addFilter(String name,String value,String type,String operation) {
		TaskVariablesQuery p = new TaskVariablesQuery();
		p.setName(name);
		p.setValue(value);
		p.setType(type);
		p.setOperation(operation);
		this.paramsQuery.add(p);
	}
	
	public List<TaskServiceQuery> queryHistoryTask(){		
		List<TaskServiceQuery> d = new ArrayList<>();
		
		if(paramsQuery!=null && paramsQuery.size() > 0) {
			try {
				json_Variables.put("processVariables", paramsQuery);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		Response response = new RestRequest().post("query/historic-task-instances?size=100000000",json_Variables.toString());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				TaskService dep = (TaskService) ResponseConverter.convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<TaskServiceQuery>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<TaskServiceQuery>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public List<TaskServiceQuery> queryHistoryProcessInstance(){		
		List<TaskServiceQuery> d = new ArrayList<>();
		
		if(paramsQuery!=null && paramsQuery.size() > 0) {
			try {
				json_Variables.put("processVariables", paramsQuery);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		Response response = new RestRequest().post("historic-process-instances?size=100000000",json_Variables.toString());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				TaskService dep = (TaskService)ResponseConverter.convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<TaskServiceQuery>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<TaskServiceQuery>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public boolean hasCustomForm(){
		List<TaskVariables> tv = this.getVariables().stream()
		 				   .filter(v->v.getName().equalsIgnoreCase("CustomVariableIGRP"))
		 				   .collect(Collectors.toList());
		return !tv.isEmpty();
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
	public String getClaimTime() {
		return claimTime;
	}
	public void setClaimTime(String claimTime) {
		this.claimTime = claimTime;
	}
}
