package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
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
		ProcessDefinitionService dep = ResponseConverter.convertJsonToDao(contentResp,
				ProcessDefinitionService.class);
		@SuppressWarnings("unchecked")
		List<ProcessDefinitionService> listProcessInstancesService = (List<ProcessDefinitionService>) ResponseConverter
				.convertJsonToListDao(contentResp, "data", new TypeToken<List<ProcessDefinitionService>>() {
				}.getType());
		if (listProcessInstancesService != null) {
			int size = listProcessInstancesService.size();
			if (size > 0) {
                if (dep != null) {
                    dep.setTotal(size);
                }
                return dep;
			}
		}
		return null;
	}

	public ProcessDefinitionService getProccessDescription(String link) {
		ProcessDefinitionService process = new ProcessDefinitionService();
		if (Core.isNotNull(link)) {
			RestRequest request = this.getRestRequest();
			//request.userBaseUrl(false);
			//TODO: must check for errors. To be review this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			String response = request.getString(link);
			if (response != null) {

					process = ResponseConverter.convertJsonToDao(response,
							ProcessDefinitionService.class);

			}
		}
		return process;
	}

	public ProcessDefinitionService getProcessDefinition(String id) {
		var response = this.getRestRequest().getHttpClient("repository/process-definitions/", id);
		ProcessDefinitionService process = new ProcessDefinitionService();
		if (response != null) {
			String contentResp = response.body();

			if (response.statusCode() == 200) {
				process = ResponseConverter.convertJsonToDao(contentResp,
						ProcessDefinitionService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}		
		return process;
	}

	public ProcessDefinitionService getLatestProcessDefinitionByKey(String processKey, String tenantId) {
		this.clearFilterUrl();
		this.addFilterUrl("key", processKey);
		this.addFilterUrl("latest", "true");
		this.addFilterUrl("tenantId", tenantId);
		List<ProcessDefinitionService> list = this.getProcessDefinitions();
		return list != null && !list.isEmpty() ? list.get(0) : null;
	}

	@SuppressWarnings("unchecked")
	public List<ProcessDefinitionService> getProcessDefinitions() {
		List<ProcessDefinitionService> d = new ArrayList<>();
		var response = this.getRestRequest()
				.getHttpClient("repository/process-definitions?size=" + ActivitiConstants.SIZE_QUERY + this.getFilterUrl());
		if (response != null) {
			String contentResp = response.body();
			if (Response.Status.OK.getStatusCode() == response.statusCode()) {
				d = (List<ProcessDefinitionService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<ProcessDefinitionService>>() {
						}.getType());
			} else {

				var error = ResponseConverter.convertJsonToDao(contentResp, ResponseError.class);

				this.setError(error);
			}
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
		var response = this.getRestRequest().putHttpClient("repository/process-definitions", jobj.toString(), id);
		if (response != null) {
			String contentResp = response.body();
			this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			r = response.statusCode() == 200;
		}
		return r;
	}

	public ProcessDefinitionService create(ProcessDefinitionService p) {
		ProcessDefinitionService d = new ProcessDefinitionService();
		var response = this.getRestRequest().postHttpClient("repository/process-definitions", ResponseConverter.convertDaoToJson(p));
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 201) {
				d = ResponseConverter.convertJsonToDao(contentResp,
						ProcessDefinitionService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public ProcessDefinitionService update(ProcessDefinitionService p) {
		ProcessDefinitionService d = new ProcessDefinitionService();
		var response = this.getRestRequest().putHttpClient("repository/process-definitions", ResponseConverter.convertDaoToJson(p),
				p.getId());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = ResponseConverter.convertJsonToDao(contentResp,
						ProcessDefinitionService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
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
		return Base64.getEncoder().encodeToString(request.getBytes(request.getBase_url() + url));
	}


	public boolean delete(String deploymentId) { 
		Response response = this.getRestRequest().delete("repository/deployments", deploymentId); 
		boolean r= response != null && response.getStatus() == 204;
		if(response != null) 
			response.close();
		return r;
	}

	public boolean suspend(String processDefinitionId) {
		var response = this.getRestRequest().putHttpClient("repository/process-definitions",
				"{\"action\":\"suspend\",\"includeProcessInstances\":\"true\"}", processDefinitionId);
		return response != null && response.statusCode() == 200;
	} 
}
