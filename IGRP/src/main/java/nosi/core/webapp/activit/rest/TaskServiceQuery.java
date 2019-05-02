package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import nosi.webapps.igrp.dao.ActivityExecute;

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
	
	@SuppressWarnings("unchecked")
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
				d = d.stream().filter(p->this.myproccessId.contains(p.getProcessInstanceId())).collect(Collectors.toList());			    
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	@SuppressWarnings("unchecked")
	public List<TaskServiceQuery> queryHistoryTaskWithCustomFilter(){		
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
				if(Core.isNotNull(this.getFilterCustom())) {
					ActivityExecute ae = new ActivityExecute().find().where("customPermission","=",this.getFilterCustom()).one();
					if(ae!=null)
						this.myproccessId =  Arrays.asList(new String[] {ae.getProcessid()});
					else
						this.myproccessId = Arrays.asList(new String[] {});
				}
				d = d.stream().filter(p->this.myproccessId.contains(p.getProcessInstanceId())).collect(Collectors.toList());	
		    
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	@SuppressWarnings("unchecked")
	public List<TaskVariables.TaskVariableDetails> queryHistoryTaskVariables(String taskId){		
		List<TaskVariables.TaskVariableDetails> d = new ArrayList<>();
		Response response = new RestRequest().get("history/historic-detail?size=100000000&selectOnlyFormProperties=true&taskId="+taskId);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				d = (List<TaskVariables.TaskVariableDetails>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<TaskVariables.TaskVariableDetails>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	@SuppressWarnings("unchecked")
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
	

	public String getStatusTask() {
		if(Core.isNotNull(this.getEndTime()))
			return "Terminado";
		if(Core.isNotNull(this.getAssignee()))
			return "Não Iniciado";
		return "Não Atribuido";
	}
	
	public int getStatusTaskValue() {
		if(Core.isNotNull(this.getEndTime()))
			return 1;//Terminado
		if(Core.isNotNull(this.getAssignee()))
			return 2;//Não iniciado
		return 3;//"Não Atribuido"
	}
	
	public Map<String,String> getStatus() {
		Map<String,String> status = new HashMap<String,String>();
		status.put(null, "--- Selecionar Estado ---");
        status.put("false","Ativo");
        status.put("true","Terminado");
		return status;
	}

	@Override
	public String toString() {
		return "TaskServiceQuery [startTime=" + startTime + ", endTime=" + endTime + ", claimTime=" + claimTime
				+ ", paramsQuery=" + paramsQuery + ", json_Variables=" + json_Variables + ", id=" + id + "]";
	}
	
	


	
	
}
