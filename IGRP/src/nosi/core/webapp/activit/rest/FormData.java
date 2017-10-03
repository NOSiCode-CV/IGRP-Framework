package nosi.core.webapp.activit.rest;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.sun.jersey.api.client.ClientResponse;
import nosi.core.webapp.helpers.ResponseError;
import nosi.core.webapp.helpers.RestRequestHelper;

/**
 * @author: Emanuel Pereira
 * 2 Oct 2017
 */
public class FormData {
	private String formKey;
	private String deploymentId;
	private String processDefinitionId;
	private String processDefinitionUrl;
	private String taskId;
	private String taskUrl;
	private List<FormProperties> formProperties;
	@Expose(serialize=false,deserialize=false)
	private ResponseError error;
	
	public FormData() {
		// TODO Auto-generated constructor stub
	}

	public FormData getFormDataByProcessDefinitionId(String processDefinitionId){
		return this.getFormData(processDefinitionId,"processId");
	}
	

	public FormData getFormDataByTaskId(String taskId){
		return this.getFormData(taskId,"taskId");
	}
	
	private FormData getFormData(String id, String type) {
		FormData d = new FormData();
		ClientResponse response = RestRequestHelper.get(type.equalsIgnoreCase("taskId")?"form/form-data?taskId="+id:"form/form-data?processDefinitionId="+id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (FormData) RestRequestHelper.convertJsonToDao(contentResp,FormData.class);
			}else{
				this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
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
