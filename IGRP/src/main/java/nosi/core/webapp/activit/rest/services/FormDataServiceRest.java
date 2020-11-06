package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;
import java.util.List;
import java.util.Properties;
import java.util.ArrayList;
import nosi.core.webapp.activit.rest.entities.Activiti;
import nosi.core.webapp.activit.rest.entities.FormDataService;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.entities.StartProcess;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 15 May 2019
 */
public class FormDataServiceRest extends GenericActivitiRest {

	private List<Properties> propertyFormSubmit;

	public FormDataServiceRest() {
		this.propertyFormSubmit = new ArrayList<>();
	}

	public FormDataService getFormDataByProcessDefinitionId(String processDefinitionId) {
		ProcessDefinitionService process = new ProcessDefinitionService();
		process.setId(processDefinitionId);
		return this.getFormData(process);
	}

	public FormDataService getFormDataByTaskId(String taskId) {
		TaskService task = new TaskService();
		task.setId(taskId);
		return this.getFormData(task);
	}

	private FormDataService getFormData(Activiti activiti) {
		FormDataService d = new FormDataService();
		Response response = null;
		if (activiti instanceof TaskService) {
			response = this.getRestRequest().get("form/form-data?taskId=" +activiti.getId());
		} else if (activiti instanceof ProcessDefinitionService) {
			response = this.getRestRequest().get("form/form-data?processDefinitionId=" +activiti.getId());
		}
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (FormDataService) ResponseConverter.convertJsonToDao(contentResp, FormDataService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	public void addVariable(String name, Object value) {
		Properties p = new Properties();
		p.put("id", name);
		p.put("value", value);
		this.propertyFormSubmit.add(p);
	}

	public StartProcess submitFormByTask(TaskService task) {
		return this.submitForm(task);
	}

	public StartProcess submitFormByProcessDenifition(ProcessDefinitionService processDefinition) {
		return this.submitForm(processDefinition);
	}

	private StartProcess submitForm(Activiti activiti) {
		StartProcess s = new StartProcess();
		JSONObject json = new JSONObject();
		try {
			if (activiti instanceof TaskService) {
				json.put("taskId", activiti.getId());
			} else if (activiti instanceof ProcessDefinitionService) {
				json.put("processDefinitionId", activiti.getId());
				json.put("businessKey", activiti.getBusinessKey_());
			}
			json.put("properties", this.propertyFormSubmit);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		Response response = this.getRestRequest().post("form/form-data", json.toString());
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200 || response.getStatus() == 204) {
				s = (StartProcess) ResponseConverter.convertJsonToDao(contentResp, StartProcess.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return s;
	}

}
