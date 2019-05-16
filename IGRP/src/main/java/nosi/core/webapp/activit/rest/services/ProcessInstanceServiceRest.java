package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import javax.ws.rs.core.Response;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.activit.rest.entities.HistoricProcessInstance;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.ProcessInstancesService;
import nosi.core.webapp.activit.rest.entities.TaskVariables;
import nosi.core.webapp.activit.rest.helpers.ActivitiConstants;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 14 May 2019
 */
public class ProcessInstanceServiceRest extends GenericActivitiRest {

	private ProcessDefinitionServiceRest processDefinition;

	public ProcessInstanceServiceRest() {
		this.processDefinition = new ProcessDefinitionServiceRest();
	}
	
	@SuppressWarnings("unchecked")
	public List<ProcessInstancesService> queryHistoryProcessk(){		
		List<ProcessInstancesService> d = new ArrayList<>();
		Response response = this.getRestRequest().post("query/historic-process-instances?size=100000000",this.filterBody.toString());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				d = (List<ProcessInstancesService>) ResponseConverter.convertJsonToListDao(contentResp,"data", 
						new TypeToken<List<ProcessInstancesService>>(){}.getType());
				if (d != null && !d.isEmpty()) {
					ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
							.getProccessDescription(d.get(0).getProcessDefinitionUrl());
					String processName = proc.getName();
					d.stream().forEach(t -> {
						t.setProcessName(processName);
					});
				}
			}else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public ProcessInstancesService historicProcess(String id) {
		ProcessInstancesService d = new ProcessInstancesService();
		Response response = this.getRestRequest().get("history/historic-process-instances", id);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
				d = (ProcessInstancesService) ResponseConverter.convertJsonToDao(contentResp,
						ProcessInstancesService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public Integer totalProcces(String processKey) {
		this.addFilterUrl("processDefinitionKey", processKey);
		Response response = this.getRestRequest()
				.get("history/historic-process-instances?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
				return this.processDefinition.getTotal(contentResp);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return 0;
	}

	public List<HistoricProcessInstance> getHistoryOfProccessInstanceIdFinished(String processDefinitionKey) {
		return this.getHistoryOfProccessInstanceId(processDefinitionKey, true);
	}

	public List<HistoricProcessInstance> getHistoryOfProccessInstanceId(String processDefinitionKey) {
		return this.getHistoryOfProccessInstanceId(processDefinitionKey, false);
	}


	@SuppressWarnings("unchecked")
	public List<HistoricProcessInstance> getHistoryOfProccessInstanceId(String processDefinitionKey,
			boolean isFinished) {
		List<HistoricProcessInstance> d = new ArrayList<>();
		this.addFilterUrl("processDefinitionKey", processDefinitionKey);
		this.addFilterUrl("includeProcessVariables", "true");
		if (isFinished) {
			this.addFilterUrl("finished", "true");
		}
		Response response = this.getRestRequest()
				.get("history/historic-process-instances?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
				d = (List<HistoricProcessInstance>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<HistoricProcessInstance>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public Integer totalProccesTerminados(String processKey) {
		this.clearFilterUrl();
		this.addFilterUrl("finished", "true");
		return this.totalProcces(processKey);
	}

	public Integer totalProccesAtivos(String processKey) {
		this.clearFilterUrl();
		this.addFilterUrl("suspended", "false");
		this.addFilterUrl("finished", "false");
		return this.totalProcces(processKey);
	}

	@SuppressWarnings("unchecked")
	public List<ProcessInstancesService> getRuntimeProcessIntances(String processKey) {
		List<ProcessInstancesService> list = new ArrayList<>();
		Response response = this.getRestRequest()
				.get("runtime/process-instances?processDefinitionKey=" + processKey + "&suspended=false");
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
				list = (List<ProcessInstancesService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<ProcessInstancesService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return list;
	}

	public boolean submitProcessFile(Part file, String processDefinitionId, String file_desc) throws IOException {
		try {
			Response response = this.getRestRequest().post("runtime/process-instances/" + processDefinitionId
					+ "/variables?name=" + file_desc + "&type=binary&scope=local", file);
			file.delete();
			return response.getStatus() == 201;
		} catch (IOException e) {
			e.printStackTrace();
		}
		file.delete();
		return false;
	}

	public boolean submitProcessObject(String processInstanceId, Serializable obj, String variableName, String scope) {
		Gson gson = new Gson();
		List<Serializable> list = new ArrayList<>();
		list.add(obj);
		Response response = this.getRestRequest().post("runtime/process-instances/" + processInstanceId
				+ "/variables?name=" + variableName + "&type=" + obj.getClass().getTypeName() + "&scope=" + scope,
				gson.toJson(list));
		return response.getStatus() == 201;
	}

	// Adiciona variaveis para completar tarefa
	public void addVariable(String name, String scope, String type, Object value, String valueUrl) {
		this.variables.add(new TaskVariables(name, scope, type, value, valueUrl));
	}

	public void addVariable(String name, String scope, String type, Object value) {
		this.addVariable(name, scope, type, value, "");
	}

	public void addVariable(String name, String type, Object value) {
		this.addVariable(name, "local", type, value, "");
	}

	public boolean submitVariables(String processInstanceId) {
		Response response = this.getRestRequest().put("runtime/process-instances/" + processInstanceId + "/variables",
				ResponseConverter.convertDaoToJson(this.variables));
		return response.getStatus() == 201;
	}

	public boolean suspend(String processInstanceId) {
		Response response = this.getRestRequest().put("runtime/process-instances/", "{\"action\":\"suspend\"}",
				processInstanceId);
		return response.getStatus() == 200;
	}

	public boolean delete(String processInstanceId) {
		Response response = this.getRestRequest().delete("runtime/process-instances/", processInstanceId);
		return response.getStatus() == 204;
	}

	public boolean deleteVariable(String processInstanceId, String variableName) {
		Response response = this.getRestRequest()
				.delete("runtime/process-instances/" + processInstanceId + "/variables", variableName);
		return response.getStatus() == 201;
	}
}
