package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import javax.ws.rs.core.Response;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.activit.rest.entities.DeploymentService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 14 May 2019
 */
public class DeploymentServiceRest extends GenericActivitiRest {

	public DeploymentService getDeployment(String id) {
		DeploymentService d = new DeploymentService();
		Response response = this.getRestRequest().get("repository/deployments/", id);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public DeploymentService getDeploymentByName(String name) {
		DeploymentService d = new DeploymentService();
		Response response = this.getRestRequest().get("repository/deployments?name=" + name);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				List<DeploymentService> list = (List<DeploymentService>) ResponseConverter
						.convertJsonToListDao(contentResp, "data", new TypeToken<List<DeploymentService>>() {
						}.getType());
				if (list != null && list.size() > 0)
					d = list.get(0);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public List<DeploymentService> getDeployments(String idApp) {
		List<DeploymentService> d = new ArrayList<>();
		Response response = this.getRestRequest().get("repository/deployments?&size=100000000&tenantId=" + idApp);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<DeploymentService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<DeploymentService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public DeploymentService create(Part file, String idApp) throws IOException {
		DeploymentService d = new DeploymentService();
		Response response = this.getRestRequest().post("repository/deployments?tenantId=" + idApp, file, ".bpmn20.xml");
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 201) {
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		file.delete();
		return d;
	}

	public DeploymentService create(InputStream file, String idApp, String fileName, String contentType)
			throws IOException {
		DeploymentService d = new DeploymentService();
		Response response = this.getRestRequest().post("repository/deployments?tenantId=" + idApp, file, fileName, contentType);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 201) {
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public DeploymentService update(Part file, String idApp) throws IOException {
		DeploymentService d = new DeploymentService();
		Response response = this.getRestRequest().post("repository/deployments?tenantId=" + idApp, file, ".bpmn20.xml");
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		file.delete();
		return d;
	}

	public boolean delete(String id) {
		Response response = this.getRestRequest().delete("repository/deployments", id);
		return response != null && response.getStatus() == 204;
	}
}
