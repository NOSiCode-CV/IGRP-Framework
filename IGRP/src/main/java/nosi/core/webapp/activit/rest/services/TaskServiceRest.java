package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import jakarta.servlet.http.Part;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.xml.bind.JAXB;
import nosi.core.webapp.activit.rest.entities.*;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.binding.tasks_process.TaskOfProcess;
import nosi.core.webapp.activit.rest.binding.tasks_process.UserTask;
import nosi.core.webapp.activit.rest.helpers.ActivitiConstants;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * @author: Emanuel Pereira 27 Sep 2017
 */
public class TaskServiceRest extends GenericActivitiRest {

	public TaskService getTaskByExecutionId(String executionId) {
		this.clearFilterUrl();
		this.addFilterUrl("executionId", executionId);
		List<TaskService> tasks = this.getTasks();
		return tasks != null ? tasks.get(0) : null;
	}

	public TaskService getTask(String id) {
		TaskService t = new TaskService();
		var response = this.getRestRequest().getHttpClient("runtime/tasks", id);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				t = ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
				ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
						.getProccessDescription(t.getProcessDefinitionUrl());
				t.setProcessName(proc.getName());
				t.setProcessDefinifionKey(proc.getKey());
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}

	public TaskService update(TaskService task) {
		TaskService t = new TaskService();
		var response = new RestRequest().putHttpClient("runtime/tasks", ResponseConverter.convertDaoToJson(task),
				task.getId());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				t = ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}
	
	public TaskService changePriority(TaskService task) {
		JSONObject json = new JSONObject();
		json.put("priority", task.getPriority()); 
		TaskService t = new TaskService();
		var response = new RestRequest().putHttpClient("runtime/tasks", json.toString(), task.getId());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				t = ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}

	public FileRest getFile(String taskId, String fileName) {
		String url = "history/historic-task-instances/" + taskId + "/variables/" + fileName + "/data";
		RestRequest request = this.getRestRequest();
		FileRest f = new FileRest();
		request.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = request.get(url);
		if (response != null) {
			if (response.getStatus() == 200) {
				f.setContent((InputStream) response.getEntity());
				f.setSize(response.getLength());
				f.setContentType(response.getMediaType().toString());
			}
			response.close();
		}
		return f;
	}

	public List<TaskService> getTasks() {
		List<TaskService> d = new ArrayList<>();
		var response = this.getRestRequest()
				.getHttpClient("runtime/tasks?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = ResponseConverter
						.convertJsonToListDao(contentResp, "data", new TypeToken<List<TaskService>>() {
						}.getType()).stream().map(TaskService.class::cast).collect(Collectors.toList());

				setProcNDescTaskServ(d);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public List<TaskService> queryTasks() {
		List<TaskService> d = new ArrayList<>();
		
		var response = this.getRestRequest().postHttpClient("query/tasks?size=" + ActivitiConstants.SIZE_QUERY,this.filterBody.toString());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				
				d = ResponseConverter
						.convertJsonToListDao(contentResp, "data", new TypeToken<List<TaskService>>() {
						}.getType()).stream().map(TaskService.class::cast).toList();
				
				setProcNDescTaskServ(d);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	/**
	 * @param d
	 */
	private void setProcNDescTaskServ(List<TaskService> d) {
		if (d != null && !d.isEmpty()) {
			HashMap<String,ProcessDefinitionService> mProc = new HashMap<>();
			d.forEach(t -> {
				String processName;
				String processDefinitionKey;
				if(mProc.containsKey(t.getProcessDefinitionUrl())) {
					processName=mProc.get(t.getProcessDefinitionUrl()).getName();
					processDefinitionKey = mProc.get(t.getProcessDefinitionUrl()).getKey();
				}
				else {
					ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
							.getProccessDescription(t.getProcessDefinitionUrl());
					processName = proc.getName();
					processDefinitionKey = proc.getKey();
					mProc.put(t.getProcessDefinitionUrl(), proc);
				}
				
				t.setProcessName(processName);
				t.setProcessDefinifionKey(processDefinitionKey);
			});
		}
	}

	public List<HistoricTaskService> getHistoryOfProccessInstanceId(String processInstanceId) {
		this.clearFilterUrl();
		this.addFilterUrl("processInstanceId", processInstanceId);
		this.addFilterUrl("finished", "true");
		return this.getHistory();
	}

	public List<HistoricTaskService> getHistory(String taskId) {
		return getHistory(taskId, true);
	}

	public List<HistoricTaskService> getHistory(String taskId, boolean includeVar) {
		this.clearFilterUrl();
		this.addFilterUrl("taskId", taskId);
		this.addFilterUrl("includeTaskLocalVariables", String.valueOf(includeVar));
		this.addFilterUrl("includeProcessVariables", String.valueOf(includeVar));
		this.addFilterUrl("finished", "true");
		return this.getHistory();
	}

	public List<HistoricTaskService> getHistory(String taskId, String executionId) {
		return getHistory(taskId, executionId,false);
	}

	public List<HistoricTaskService> getHistory(String taskDefinitionKey, String executionId, boolean includeVar) {
		this.clearFilterUrl();
		this.addFilterUrl("taskDefinitionKey", taskDefinitionKey);
		this.addFilterUrl("executionId", executionId);
		this.addFilterUrl("includeTaskLocalVariables", String.valueOf(includeVar));
		this.addFilterUrl("includeProcessVariables", String.valueOf(includeVar));
		this.addFilterUrl("finished", "true");
		return this.getHistory();
	}

	@SuppressWarnings("unchecked")
	public List<HistoricTaskService> getHistory() {
		List<HistoricTaskService> d = new ArrayList<>();
		var response = this.getRestRequest()
				.getHttpClient("history/historic-task-instances?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = response.body();
			if (Response.Status.OK.getStatusCode() == response.statusCode()) {
				d = (List<HistoricTaskService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<HistoricTaskService>>() {
						}.getType());
				
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public List<TaskServiceQuery> queryHistoryTask() {
		List<TaskServiceQuery> d = new ArrayList<>();
		var response = this.getRestRequest().postHttpClient("query/historic-task-instances?size=100000000",
				this.filterBody.toString());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = ResponseConverter
						.convertJsonToListDao(contentResp, "data", new TypeToken<List<TaskServiceQuery>>() {
						}.getType()).stream().map(TaskServiceQuery.class::cast).collect(Collectors.toList());
			
				if (!d.isEmpty()) {
					HashMap<String,ProcessDefinitionService> mProc = new HashMap<>();
					d.forEach(t -> {
						String processName;
						String processDefinitionKey;
						if(mProc.containsKey(t.getProcessDefinitionUrl())) {
							processName=mProc.get(t.getProcessDefinitionUrl()).getName();
							processDefinitionKey = mProc.get(t.getProcessDefinitionUrl()).getKey();
						}
						else {
							ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
								.getProccessDescription(t.getProcessDefinitionUrl());
							processName = proc.getName();
							processDefinitionKey = proc.getKey();
							mProc.put(t.getProcessDefinitionUrl(), proc);
						}
						t.setProcessName(processName);
						t.setProcessDefinifionKey(processDefinitionKey);
					});
				}
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public List<TaskService> getMyTasks() {
		this.addFilterUrl("assignee", Core.getCurrentUser().getUser_name());
		this.addFilterUrl("tenantId", Core.getCurrentDad());
		return this.getTasks();
	}

	public List<TaskService> getAvailableTasks() {
		this.addFilterUrl("unassigned", "true");
		return this.getTasks();
	}

	public boolean submitTaskFile(Part file, String taskId, String file_desc) throws IOException {
		boolean r = false;
        try (Response response = this.getRestRequest().post(
                "runtime/tasks/" + taskId + "/variables?name=" + file_desc + "&type=binary&scope=local", file)) {
			file.delete();
			r = response!=null && response.getStatus() == 201;
		} catch (IOException e) {
			e.printStackTrace();
		}
		file.delete();
		return r;
	}

	public boolean delete(String taskId) {
		Response response = this.getRestRequest().delete("runtime/tasks", taskId);
		boolean r = response!=null && response.getStatus() == 204;
		if(response!=null) {
			response.close();
		}
		return r;
	}

	// Assumir tarefa
	public boolean claimTask(String taskId, String assignee) {
		return this.taskAction(taskId, "claim", assignee);
	}

	// Transferir Tarefa
	public boolean delegateTask(String taskId, String assignee) {
		//return this.taskAction(taskId, "delegate", assignee); // Does not work when the new assignee executes the task
		return this.freeTask(taskId) && this.claimTask(taskId, assignee);
	}

	// Devolve a tarefa de volta para o proprietario, se houver
	public boolean resolveTask(String taskId, String assignee) {
		return this.taskAction(taskId, "resolve", assignee);
	}

	// Libera a tarefa
	public boolean freeTask(String taskId) {
		return this.taskAction(taskId, "claim", null);
	}

	// Completar Tarefa
	public boolean completeTask(String taskId, List<TaskVariables> variables) {
		this.variables = variables;
		return this.completeTask(taskId);
	}

	public boolean completeTask(String taskId) {
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("action", "complete");
			jobj.put("variables", this.variables);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		boolean r = false;
		var response = this.getRestRequest().postHttpClient("runtime/tasks", jobj.toString(), taskId);
		if (response != null) {
			String contentResp = response.body();
			this.setError(response.statusCode() != 200
					? ResponseConverter.convertJsonToDao(contentResp, ResponseError.class)
					: null);
			r = response.statusCode() == 200;
		}
		return r;
	}

	private boolean taskAction(String taskId, String action, String assignee) {
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("action", action);
			if (!action.equalsIgnoreCase("resolve"))
				jobj.put("assignee", assignee);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		boolean r =false;
		var response = this.getRestRequest().postHttpClient("runtime/tasks", jobj.toString(), taskId);
		if (response != null) {
			String contentResp = response.body();
			this.setError(response.statusCode() != 200
					? ResponseConverter.convertJsonToDao(contentResp, ResponseError.class)
					: null);
			r = response.statusCode() == 200;
		}
		return r;
	}

	// Adiciona variaveis para completar tarefa
	
	public void addVariable(String name, String scope, String type, Object value, String valueUrl) {
		this.variables.add(new TaskVariables(name, scope, type,  ((type.equals("integer") && value != null) ?Core.toInt(value.toString()): value), null));
	}

	public void addVariable(String name, String scope, String type, Object value) {
		if (type.equals("integer") && value != null)
			this.variables.add(new TaskVariables(name, scope, type, Core.toInt(value.toString()), null));
		else
			this.variables.add(new TaskVariables(name, scope, type, value, null));
	}

	public void addVariable(String name, String type, Object value) {
		this.variables.add(new TaskVariables(name, "local", type, ((type.equals("integer") && value != null) ?Core.toInt(value.toString()): value), null));
	}

	public boolean submitVariables(String taskId) {		
		var response = this.getRestRequest().postHttpClient("runtime/tasks/" + taskId + "/variables",
				ResponseConverter.convertDaoToJson(this.variables)); 
		return response != null && response.statusCode() == 201;
	}

	public boolean updateVariables(String taskId,String variableName, TaskVariables variable) {
		this.variables.add(variable);
		var response = this.getRestRequest().postHttpClient("runtime/tasks/" + taskId + "/variables",
				ResponseConverter.convertDaoToJson(this.variables));
		//If confliting must try to update with put
		if (response != null && response.statusCode() == 409) {
			response = this.getRestRequest().putHttpClient("runtime/tasks/" + taskId + "/variables/" + variableName,
					ResponseConverter.convertDaoToJson(variable));
		}

        return response != null && (response.statusCode() == 200 || response.statusCode() == 201);
	}

	public List<TaskService> getTasksByProcessDefinitionIdds(String processDefinitionId) {
		List<TaskService> list = new ArrayList<>();
		RestRequest req = this.getRestRequest();
		req.setAccept_format(MediaType.APPLICATION_XML);

		var response = req.getHttpClient("repository/process-definitions/" + processDefinitionId + "/resourcedata");

		if (response != null) {
            String xml = response.body();
            list = this.extractTasks(xml, false);
		}
		return list;
	}

	public List<TaskService> getTasksByProcessKey(String processKey, String tenantId) {
		List<TaskService> list = new ArrayList<>();
		ProcessDefinitionService processD = new ProcessDefinitionServiceRest()
				.getLatestProcessDefinitionByKey(processKey, tenantId);
		if (processD != null && processD.getId() != null) {
			RestRequest req = this.getRestRequest();
			req.setAccept_format(MediaType.APPLICATION_XML);
			var response = req.getHttpClient("repository/process-definitions/" + processD.getId() + "/resourcedata");
			if (response != null) {
                String xml = response.body();
                list = this.extractTasks(xml, false);
			}
		}
		return list;
	}

	public List<TaskService> extractTasks(String xml, boolean includeStartProcess) { 
		List<TaskService> list = new ArrayList<>();
		if(Core.isNotNull(xml)) {
			String xml_ = xml.replace("xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"", "").replace("activiti:formKey",
					"formKey");

			if (Core.isNotNull(xml_)) {
				StringReader r = new StringReader(xml_);
				TaskOfProcess listTasks = JAXB.unmarshal(r, TaskOfProcess.class);
				if (listTasks != null && listTasks.getProcess() != null) {
					if (includeStartProcess && listTasks.getProcess().get(0) != null
							&& listTasks.getProcess().get(0).getStartEventObject() != null
							&& listTasks.getProcess().get(0).getStartEventObject().get(0) != null) {
						TaskService t = new TaskService();
						t.setProcessDefinitionId(listTasks.getProcess().get(0).getId());
						if(Core.isNotNull(listTasks.getProcess().get(0).getName()))
							t.setProcessDefinifionKey(listTasks.getProcess().get(0).getName());
						t.setId("Start" + t.getProcessDefinitionId());
						t.setTaskDefinitionKey("Start" + t.getProcessDefinitionId());
						t.setName("Start");
						t.setFormKey(listTasks.getProcess().get(0).getStartEventObject().get(0).getFormKey());
						list.add(t);
					}
					if (listTasks.getProcess().get(0) != null && listTasks.getProcess().get(0).getUserTask() != null) {
						for (UserTask task : listTasks.getProcess().get(0).getUserTask()) {
							TaskService t = new TaskService();
							t.setId(task.getId());
							t.setTaskDefinitionKey(task.getId());
							t.setName(task.getName());
							t.setFormKey(task.getFormKey());
							t.setProcessDefinitionId(listTasks.getProcess().get(0).getId());
							if(Core.isNotNull(listTasks.getProcess().get(0).getName()))
								t.setProcessDefinifionKey(listTasks.getProcess().get(0).getName());
							list.add(t);
						}
					}
					if (listTasks.getProcess().get(0).getSubProcess() != null) {
						for (UserTask task : listTasks.getProcess().get(0).getSubProcess().getUserTask()) {
							TaskService t = new TaskService();
							t.setId(task.getId());
							t.setName(task.getName());
							t.setTaskDefinitionKey(task.getId());
							t.setFormKey(task.getFormKey());
							t.setProcessDefinitionId(listTasks.getProcess().get(0).getSubProcess().getId());
							list.add(t);
						}
					}
				}
			}
		}
		return list;
	}

	public List<TaskVariableDetails> queryHistoryTaskVariables(String taskId) {
		List<TaskVariableDetails> d = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("history/historic-detail?size=" + ActivitiConstants.SIZE_QUERY
				+ "&selectOnlyFormProperties=true&taskId=" + taskId);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = Objects.requireNonNull(ResponseConverter
                        .convertJsonToListDao(contentResp, "data", new TypeToken<List<TaskVariableDetails>>() {
                        }.getType())).stream().map(TaskVariableDetails.class::cast).collect(Collectors.toList());
				
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public TaskService getCurrentTaskByProcessNr(String processNr) {
		List<TaskService> t = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("runtime/tasks?processInstanceId=" + processNr);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200)
				 t = Objects.requireNonNull(ResponseConverter
                         .convertJsonToListDao(contentResp, "data", new TypeToken<List<TaskService>>() {
                         }.getType())).stream().map(TaskService.class::cast).toList();
			
			 else this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
		}
		return !t.isEmpty() ? t.get(0) : null;
	}

	public TaskVariables getVariableByExecId(String executionId, String variableName) {
		TaskVariables t = new TaskVariables();
		var response = this.getRestRequest().getHttpClient("runtime/executions/"+executionId+"/variables/",variableName);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				t = ResponseConverter.convertJsonToDao(contentResp, TaskVariables.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}

		}
		return t;
	}

	public List<TaskVariables> getListVarByExecId(String executionId) {
		List<TaskVariables> t = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("runtime/executions/"+executionId+"/variables");
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				t = Objects.requireNonNull(ResponseConverter
                        .convertJsonToListDao(contentResp, "data", new TypeToken<List<TaskVariables>>() {
                        }.getType())).stream().map(TaskVariables.class::cast).toList();

			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}

		}
		return t;
	}

	public HistoricVariablesService getVarByProcId(String procId, String variableName) {
		this.clearFilterUrl();
		this.setFilterUrl("processInstanceId="+procId);
		this.addFilterUrl("variableName", variableName);
		List<HistoricVariablesService> tasks = this.getListVarByProcId();
		return (tasks != null && !tasks.isEmpty()) ? tasks.get(0) : null;
	}

	public List<HistoricVariablesService> getListVarByProcId() {
		List<HistoricVariablesService> t = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("history/historic-variable-instances?"+this.getFilterUrl());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				t = Objects.requireNonNull(ResponseConverter
                        .convertJsonToListDao(contentResp, "data", new TypeToken<List<HistoricVariablesService>>() {
                        }.getType())).stream().map(HistoricVariablesService.class::cast).toList();

			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}

		}
		return t;
	}


}
