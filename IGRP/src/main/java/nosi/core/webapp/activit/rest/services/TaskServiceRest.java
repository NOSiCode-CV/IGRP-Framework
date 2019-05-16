package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXB;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.binding.tasks_process.TaskOfProcess;
import nosi.core.webapp.activit.rest.binding.tasks_process.UserTask;
import nosi.core.webapp.activit.rest.entities.HistoricTaskService;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.entities.TaskVariableDetails;
import nosi.core.webapp.activit.rest.entities.TaskVariables;
import nosi.core.webapp.activit.rest.helpers.ActivitiConstants;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * @author: Emanuel Pereira 27 Sep 2017
 */
public class TaskServiceRest extends GenericActivitiRest {



	public TaskService getTaskByExecutionId(String id) {
		this.clearFilterUrl();
		this.addFilterUrl("executionId", id);
		List<TaskService> tasks = this.getTasks();
		return tasks != null ? tasks.get(0) : null;
	}

	public TaskService getTask(String id) {
		TaskService t = new TaskService();
		Response response = this.getRestRequest().get("runtime/tasks", id);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				t = (TaskService) ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
				ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
						.getProccessDescription(t.getProcessDefinitionUrl());
				t.setProcessName(proc.getName());
				t.setProcessDefinifionKey(proc.getKey());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return t;
	}

	public TaskService update(TaskService task) {
		TaskService t = new TaskService();
		Response response = new RestRequest().put("runtime/tasks", ResponseConverter.convertDaoToJson(task),
				task.getId());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				t = (TaskService) ResponseConverter.convertJsonToDao(contentResp, TaskService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
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
				return f;
			}
		}
		return f;
	}

	@SuppressWarnings("unchecked")
	public List<TaskService> getTasks() {
		List<TaskService> d = new ArrayList<>();
		Response response = this.getRestRequest()
				.get("runtime/tasks?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<TaskService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<TaskService>>() {
						}.getType());

				if (d != null && !d.isEmpty()) {
					ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
							.getProccessDescription(d.get(0).getProcessDefinitionUrl());
					String processName = proc.getName();
					String processDefinitionKey = proc.getKey();
					d.stream().forEach(t -> {
						t.setProcessName(processName);
						t.setProcessDefinifionKey(processDefinitionKey);
					});
				}
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public List<HistoricTaskService> getHistoryOfProccessInstanceId(String processInstanceId) {
		this.clearFilterUrl();
		this.addFilterUrl("processInstanceId", processInstanceId);
		this.addFilterUrl("finished", "true");
		return this.getHistory();
	}

	public List<HistoricTaskService> getHistory(String taskId) {
		this.clearFilterUrl();
		this.addFilterUrl("taskId", taskId);
		this.addFilterUrl("includeTaskLocalVariables", "true");
		this.addFilterUrl("includeProcessVariables", "true");
		this.addFilterUrl("finished", "true");
		return this.getHistory();
	}

	public List<HistoricTaskService> getHistory(String taskDefinitionKey, String executionId) {
		this.clearFilterUrl();
		this.addFilterUrl("taskDefinitionKey", taskDefinitionKey);
		this.addFilterUrl("executionId", executionId);
		this.addFilterUrl("includeTaskLocalVariables", "true");
		this.addFilterUrl("includeProcessVariables", "true");
		this.addFilterUrl("finished", "true");
		return this.getHistory();
	}

	@SuppressWarnings("unchecked")
	public List<HistoricTaskService> getHistory() {
		List<HistoricTaskService> d = new ArrayList<>();
		Response response = this.getRestRequest()
				.get("history/historic-task-instances?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
				d = (List<HistoricTaskService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<HistoricTaskService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public List<TaskServiceQuery> queryHistoryTask() {
		List<TaskServiceQuery> d = new ArrayList<>();
		Response response = this.getRestRequest().post("query/historic-task-instances?size=100000000",
				this.filterBody.toString());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<TaskServiceQuery>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<TaskServiceQuery>>() {
						}.getType());
				if (d != null && !d.isEmpty()) {
					ProcessDefinitionService proc = new ProcessDefinitionServiceRest()
							.getProccessDescription(d.get(0).getProcessDefinitionUrl());
					String processName = proc.getName();
					String processDefinitionKey = proc.getKey();
					d.stream().forEach(t -> {
						t.setProcessName(processName);
						t.setProcessDefinifionKey(processDefinitionKey);
					});
				}
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
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
		try {
			Response response = this.getRestRequest().post(
					"runtime/tasks/" + taskId + "/variables?name=" + file_desc + "&type=binary&scope=local", file);
			file.delete();
			return response.getStatus() == 201;
		} catch (IOException e) {
			e.printStackTrace();
		}
		file.delete();
		return false;
	}

	public boolean delete(String taskId) {
		Response response = this.getRestRequest().delete("runtime/tasks", taskId);
		return response.getStatus() == 204;
	}

	// Assumir tarefa
	public boolean claimTask(String taskId, String assignee) {
		return this.taskAction(taskId, "claim", assignee);
	}

	// Transferir Tarefa
	public boolean delegateTask(String taskId, String assignee) {
		return this.taskAction(taskId, "delegate", assignee);
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
		Response response = this.getRestRequest().post("runtime/tasks", jobj.toString(), taskId);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.setError(response.getStatus() != 200
					? (ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class)
					: null);
			return response.getStatus() == 200;
		}
		return false;
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
		Response response = this.getRestRequest().post("runtime/tasks", jobj.toString(), taskId);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.setError(response.getStatus() != 200
					? (ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class)
					: null);
			return response.getStatus() == 200;
		}
		return false;
	}

	// Adiciona variaveis para completar tarefa
	public void addVariable(String name, String scope, String type, Object value, String valueUrl) {
		this.variables.add(new TaskVariables(name, scope, type, value, null));
	}

	public void addVariable(String name, String scope, String type, Object value) {
		if (type.equals("integer") && value != null)
			this.variables.add(new TaskVariables(name, scope, type, Core.toInt(value.toString()), null));
		else
			this.variables.add(new TaskVariables(name, scope, type, value, null));
	}

	public void addVariable(String name, String type, Object value) {
		this.variables.add(new TaskVariables(name, "local", type, value, null));
	}

	public boolean submitVariables(String taskId) {
		Response response = this.getRestRequest().post("runtime/tasks/" + taskId + "/variables",
				ResponseConverter.convertDaoToJson(this.variables));
		return response.getStatus() == 201;
	}


	public List<TaskService> getTasksByProcessDefinitionId(String processDefinitionId) {
		List<TaskService> list = new ArrayList<>();
		RestRequest req = this.getRestRequest();
		req.setAccept_format(MediaType.APPLICATION_XML);
		Response response = req.get("repository/process-definitions/" + processDefinitionId + "/resourcedata");
		if (response != null) {
			InputStream is = (InputStream) response.getEntity();
			try {
				String xml = FileHelper.convertToString(is);
				list = this.extractTasks(xml, false);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
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
			Response response = req.get("repository/process-definitions/" + processD.getId() + "/resourcedata");
			if (response != null) {
				InputStream is = (InputStream) response.getEntity();
				try {
					String xml = FileHelper.convertToString(is);
					list = this.extractTasks(xml, false);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
		return list;
	}

	public List<TaskService> extractTasks(String xml, boolean includeStartProcess) {
		List<TaskService> list = new ArrayList<>();
		xml = xml.replace("xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\"", "").replaceAll("activiti:formKey",
				"formKey");
		if (Core.isNotNull(xml)) {
			StringReader r = new StringReader(xml);
			TaskOfProcess listTasks = JAXB.unmarshal(r, TaskOfProcess.class);
			if (listTasks != null && listTasks.getProcess() != null) {
				if (includeStartProcess && listTasks.getProcess().get(0) != null
						&& listTasks.getProcess().get(0).getStartEventObject() != null
						&& listTasks.getProcess().get(0).getStartEventObject().get(0) != null) {
					TaskService t = new TaskService();
					t.setProcessDefinitionId(listTasks.getProcess().get(0).getId());
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
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<TaskVariableDetails> queryHistoryTaskVariables(String taskId) {
		List<TaskVariableDetails> d = new ArrayList<>();
		Response response = this.getRestRequest().get("history/historic-detail?size=" + ActivitiConstants.SIZE_QUERY
				+ "&selectOnlyFormProperties=true&taskId=" + taskId);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<TaskVariableDetails>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<TaskVariableDetails>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

}
