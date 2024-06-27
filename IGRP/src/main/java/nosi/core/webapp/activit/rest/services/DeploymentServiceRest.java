package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.http.Part;
import com.google.gson.reflect.TypeToken;

import nosi.core.webapp.activit.rest.entities.DeploymentService;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 14 May 2019
 */
public class DeploymentServiceRest extends GenericActivitiRest {

	public DeploymentService getDeployment(String id) {
		DeploymentService d = new DeploymentService();
		var response = this.getRestRequest().getHttpClient("repository/deployments/", id);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public DeploymentService getDeploymentByName(String name) {
		DeploymentService d = new DeploymentService();
		var response = this.getRestRequest().getHttpClient("repository/deployments?name=" + name);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				List<DeploymentService> list = (List<DeploymentService>) ResponseConverter
						.convertJsonToListDao(contentResp, "data", new TypeToken<List<DeploymentService>>() {
						}.getType());
				if (list != null && !list.isEmpty())
					d = list.get(0);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public List<DeploymentService> getDeployments(String idApp) {
		List<DeploymentService> d = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("repository/deployments?&size=100000000&tenantId=" + idApp);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = (List<DeploymentService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<DeploymentService>>() {
						}.getType());
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public DeploymentService create(Part file, String idApp) throws IOException {
		DeploymentService d = new DeploymentService();
		var response = this.getRestRequest().post("repository/deployments?tenantId=" + idApp, file, ".bpmn20.xml", String.class);
		if (response != null) {
			d = ResponseConverter.convertJsonToDao(response, DeploymentService.class);
		} else {
			error = new ResponseError();
			error.setException("Server error! create - repository/deployments");
			error.setMessage(error.getException());
			error.setStatusCode(500);

			this.setError(error);
		}
		file.delete();
		return d;
	}

	public DeploymentService create(InputStream file, String idApp, String fileName, String contentType)
			throws IOException {
		DeploymentService d = new DeploymentService();
		var response = this.getRestRequest().post("repository/deployments?tenantId=" + idApp, file, fileName, contentType, String.class);
		if (response != null) {
			d = ResponseConverter.convertJsonToDao(response, DeploymentService.class);
		} else {
			error = new ResponseError();
			error.setException("Server error! create - repository/deployments");
			error.setMessage(error.getException());
			error.setStatusCode(500);

			this.setError(error);
		}
		return d;
	}

	public DeploymentService update(Part file, String idApp) throws IOException {
		DeploymentService d = new DeploymentService();
		var response = this.getRestRequest().post("repository/deployments?tenantId=" + idApp, file, ".bpmn20.xml", String.class);
		if (response != null) {
			d = ResponseConverter.convertJsonToDao(response, DeploymentService.class);
		} else {
			error = new ResponseError();
			error.setException("Server error! update - repository/deployments");
			error.setMessage(error.getException());
			error.setStatusCode(500);

			this.setError(error);
		}
		file.delete();
		return d;
	}

	public boolean delete(String id) {
		var response = this.getRestRequest().deleteHttpClient("repository/deployments", id);
		return response != null && response.statusCode() == 204;
	}
}
