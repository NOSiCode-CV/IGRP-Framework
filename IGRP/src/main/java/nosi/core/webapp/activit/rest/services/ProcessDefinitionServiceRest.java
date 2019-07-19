package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.helpers.ActivitiConstants;
import nosi.core.webapp.activit.rest.request.RestRequest;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 14 May 2019
 */
public class ProcessDefinitionServiceRest extends GenericActivitiRest {

	public Integer getTotal(String contentResp) {
		ProcessDefinitionService pd = this.getProcessDefinitionService(contentResp);
		if (pd != null) {
			return pd.getTotal();
		}
		return 0;
	}

	public ProcessDefinitionService getProcessDefinitionService(String contentResp) {
		ProcessDefinitionService dep = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,
				ProcessDefinitionService.class);
		@SuppressWarnings("unchecked")
		List<ProcessDefinitionService> listProcessInstancesService = (List<ProcessDefinitionService>) ResponseConverter
				.convertJsonToListDao(contentResp, "data", new TypeToken<List<ProcessDefinitionService>>() {
				}.getType());
		if (listProcessInstancesService != null) {
			int size = listProcessInstancesService.size();
			if (size > 0) {
				dep.setTotal(size);
				return dep;
			}
		}
		return null;
	}

	public ProcessDefinitionService getProccessDescription(String link) {
		ProcessDefinitionService process = new ProcessDefinitionService();
		if (Core.isNotNull(link)) {
			RestRequest request = this.getRestRequest();
			request.setBase_url("");
			Response response = request.get(link);
			if (response != null) {
				String contentResp = "";
				try {
					contentResp = FileHelper.convertToString((InputStream) response.getEntity());
				} catch (IOException e) {
					e.printStackTrace();
				}
				if (response.getStatus() == 200) {
					process = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,
							ProcessDefinitionService.class);
				} else {
					this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
				}
				response.close();
			}
		}
		return process;
	}

	public ProcessDefinitionService getProcessDefinition(String id) {
		Response response = this.getRestRequest().get("repository/process-definitions/", id);
		ProcessDefinitionService process = new ProcessDefinitionService();
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				process = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,
						ProcessDefinitionService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}		
		return process;
	}

	public ProcessDefinitionService getLatestProcessDefinitionByKey(String processKey, String tenantId) {
		this.clearFilterUrl();
		this.addFilterUrl("key", processKey);
		this.addFilterUrl("latest", "true");
		this.addFilterUrl("tenantId", tenantId);
		List<ProcessDefinitionService> list = this.getProcessDefinitions();
		return list != null && list.size() > 0 ? list.get(0) : null;
	}

	@SuppressWarnings("unchecked")
	public List<ProcessDefinitionService> getProcessDefinitions() {
		List<ProcessDefinitionService> d = new ArrayList<>();
		Response response = this.getRestRequest()
				.get("repository/process-definitions?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (Response.Status.OK.getStatusCode() == response.getStatus()) {
				d = (List<ProcessDefinitionService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<ProcessDefinitionService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	public List<ProcessDefinitionService> getProcessDefinitionsAtivos(String tenantId) {
		this.clearFilterUrl();
		this.addFilterUrl("suspended", "false");
		this.addFilterUrl("latest", "true");
		this.addFilterUrl("tenantId", tenantId);
		return this.getProcessDefinitions();
	}

	public boolean activateProcessDefinition(String id) {
		return this.statusProcessDefinition(id, "activate", true);
	}

	public boolean suspendProcessDefinition(String id) {
		return this.statusProcessDefinition(id, "suspend", true);
	}

	public boolean statusProcessDefinition(String id, String action, boolean includeProcessInstances) {
		boolean r = false;
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("action", action);
			jobj.put("includeProcessInstances", includeProcessInstances);
			jobj.put("date", new Date(System.currentTimeMillis()));
		} catch (JSONException e) {
			e.printStackTrace();
		}
		Response response = this.getRestRequest().put("repository/process-definitions", jobj.toString(), id);
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			r = response.getStatus() == 200;
			response.close();
			
		}
		return r;
	}

	public ProcessDefinitionService create(ProcessDefinitionService p) {
		ProcessDefinitionService d = new ProcessDefinitionService();
		Response response = this.getRestRequest().post("repository/process-definitions", ResponseConverter.convertDaoToJson(p));
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 201) {
				d = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,
						ProcessDefinitionService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	public ProcessDefinitionService update(ProcessDefinitionService p) {
		ProcessDefinitionService d = new ProcessDefinitionService();
		Response response = this.getRestRequest().put("repository/process-definitions", ResponseConverter.convertDaoToJson(p),
				p.getId());
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (ProcessDefinitionService) ResponseConverter.convertJsonToDao(contentResp,
						ProcessDefinitionService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	public String getProcessDiagram(String processId) {
		return this.getDiagram("runtime/process-instances/"+processId+"/diagram");
	}

	public String getDiagram(String url) {
		String d = null;
		RestRequest request = this.getRestRequest();
		request.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = request.get(url);
		if (response != null) {
			if (response.getStatus() == 200) {
				try {
					d = FileHelper.convertInputStreamToBase64((InputStream) response.getEntity());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			response.close();
		}
		return d;
	}
	public boolean delete(String id) {
		Response response = this.getRestRequest().delete("repository/process-definitions", id);
		boolean r= response != null && response.getStatus() == 204;
		if(response!=null) {
			response.close();
		}
		return r;
	}

	public boolean suspend(String processDefinitionId) {
		Response response = this.getRestRequest().put("repository/process-definitions",
				"{\"action\":\"suspend\",\"includeProcessInstances\":\"true\"}", processDefinitionId);
		boolean r= response != null && response.getStatus() == 200;
		if(response!=null) {
			response.close();
		}
		return r;
	}
}
