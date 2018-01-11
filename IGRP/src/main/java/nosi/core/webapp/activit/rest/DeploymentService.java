package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ws.rs.core.MediaType;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;

import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */

public class DeploymentService extends Activit{

	private Date deploymentTime;
	private String tenantId;
	
	public DeploymentService() {
	}

	public DeploymentService getDeployment(String id){
		DeploymentService d = new DeploymentService();
		ClientResponse response = new RestRequest().get("repository/deployments/",id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (DeploymentService) new RestRequest().convertJsonToDao(contentResp, DeploymentService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	@SuppressWarnings("unchecked")
	public List<DeploymentService> getDeployments(){
		List<DeploymentService> d = new ArrayList<>();
		ClientResponse response = new RestRequest().get("repository/deployments");
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				DeploymentService dep = (DeploymentService) new RestRequest().convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<DeploymentService>) new RestRequest().convertJsonToListDao(contentResp,"data", new TypeToken<List<DeploymentService>>(){}.getType());
			}else{
				this.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public DeploymentService create(DeploymentService deploy){
		deploy.setId(null);
		DeploymentService d = new DeploymentService();
		new RestRequest().CONTENT_TYPE = MediaType.MULTIPART_FORM_DATA;
		ClientResponse response = new RestRequest().post("repository/deployments",new RestRequest().convertDaoToJson(deploy));
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==201){
				d = (DeploymentService) new RestRequest().convertJsonToDao(contentResp, DeploymentService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public DeploymentService update(DeploymentService deploy){
		DeploymentService d = new DeploymentService();
		ClientResponse response = new RestRequest().post("repository/deployments",new RestRequest().convertDaoToJson(deploy));
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (DeploymentService) new RestRequest().convertJsonToDao(contentResp, DeploymentService.class);
			}else{
				d.setError((ResponseError) new RestRequest().convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public boolean delete(String id){
		ClientResponse response = new RestRequest().delete("repository/deployments",id);
		return response!=null && response.getStatus()==204;
	}

	
	public Date getDeploymentTime() {
		return deploymentTime;
	}

	public void setDeploymentTime(Date deploymentTime) {
		this.deploymentTime = deploymentTime;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

}
