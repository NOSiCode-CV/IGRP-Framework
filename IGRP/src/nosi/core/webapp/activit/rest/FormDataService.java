package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.annotations.Expose;
import com.sun.jersey.api.client.ClientResponse;
import nosi.core.webapp.helpers.ResponseError;
import nosi.core.webapp.helpers.RestRequestHelper;

/**
 * @author: Emanuel Pereira
 * 2 Oct 2017
 */
public class FormDataService {
	private String formKey;
	private String deploymentId;
	private String processDefinitionId;
	private String processDefinitionUrl;
	private String taskId;
	private String taskUrl;
	private List<FormProperties> formProperties;
	@Expose(serialize=false,deserialize=false)
	private List<Properties> propertyFormSubmit;
	@Expose(serialize=false,deserialize=false)
	private String businessKey;
	@Expose(serialize=false,deserialize=false)
	private ResponseError error;
	
	public FormDataService() {
		this.propertyFormSubmit = new ArrayList<>();
	}

	public FormDataService getFormDataByProcessDefinitionId(String processDefinitionId){
		return this.getFormData(processDefinitionId,"processId");
	}
	

	public FormDataService getFormDataByTaskId(String taskId){
		return this.getFormData(taskId,"taskId");
	}
	
	private FormDataService getFormData(String id, String type) {
		FormDataService d = new FormDataService();
		ClientResponse response = RestRequestHelper.get(type.equalsIgnoreCase("taskId")?"form/form-data?taskId="+id:"form/form-data?processDefinitionId="+id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (FormDataService) RestRequestHelper.convertJsonToDao(contentResp,FormDataService.class);
			}else{
				this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public void addVariable(String name,Object value){
		Properties p = new Properties();
		p.put("id",name);
		p.put("value",value);
		this.propertyFormSubmit.add(p );
	}
	
	public boolean submitFormByTask(){
		return this.submitForm("task");
	}

	public boolean submitFormByProcessDenifition(){
		return this.submitForm("process");
	}
	
	private boolean submitForm(String type){
		JSONObject json = new JSONObject();
		try {
			if(type.equalsIgnoreCase("task")){
				json.put("taskId", this.getTaskId());
			}
			else if(type.equalsIgnoreCase("process")){
				json.put("processDefinitionId", this.getProcessDefinitionId());
				json.put("businessKey", this.getBusinessKey());
			}
			json.put("properties", this.propertyFormSubmit);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		ClientResponse response = RestRequestHelper.post("form/form-data", json.toString());
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				return true;
			}else{
				this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return false;
	}
	
	public ResponseError getError() {
		return error;
	}

	public void setError(ResponseError error) {
		this.error = error;
	}

	public String getFormKey() {
		return formKey;
	}


	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}


	public String getDeploymentId() {
		return deploymentId;
	}


	public void setDeploymentId(String deploymentId) {
		this.deploymentId = deploymentId;
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


	public List<FormProperties> getFormProperties() {
		return formProperties;
	}


	public void setFormProperties(List<FormProperties> formProperties) {
		this.formProperties = formProperties;
	}

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	@Override
	public String toString() {
		return "FormData [formKey=" + formKey + ", deploymentId=" + deploymentId + ", processDefinitionId="
				+ processDefinitionId + ", processDefinitionUrl=" + processDefinitionUrl + ", taskId=" + taskId
				+ ", taskUrl=" + taskUrl + ", formProperties=" + formProperties + "]";
	}


	public class FormProperties{
		private String id;
		private String name;
		private String type;
		private String value;
		private Boolean readable;
		private Boolean writable;
		private Boolean required;
		private String datePattern;
		private List<Values> enumValues;
		
		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getType() {
			return type;
		}

		public void setType(String type) {
			this.type = type;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public Boolean getReadable() {
			return readable;
		}

		public void setReadable(Boolean readable) {
			this.readable = readable;
		}

		public Boolean getWritable() {
			return writable;
		}

		public void setWritable(Boolean writable) {
			this.writable = writable;
		}

		public Boolean getRequired() {
			return required;
		}

		public void setRequired(Boolean required) {
			this.required = required;
		}

		public String getDatePattern() {
			return datePattern;
		}

		public void setDatePattern(String datePattern) {
			this.datePattern = datePattern;
		}

		public List<Values> getEnumValues() {
			return enumValues;
		}

		public void setEnumValues(List<Values> enumValues) {
			this.enumValues = enumValues;
		}

		@Override
		public String toString() {
			return "FormProperties [id=" + id + ", name=" + name + ", type=" + type + ", value=" + value + ", readable="
					+ readable + ", writable=" + writable + ", required=" + required + ", datePattern=" + datePattern
					+ ", enumValues=" + enumValues + "]";
		}

		public class Values{
			private String id;
			private String name;
			public String getId() {
				return id;
			}
			public void setId(String id) {
				this.id = id;
			}
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			@Override
			public String toString() {
				return "Values [id=" + id + ", name=" + name + "]";
			}
			
		}
	}

}
