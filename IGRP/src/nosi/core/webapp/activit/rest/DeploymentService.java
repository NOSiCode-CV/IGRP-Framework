package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;
import nosi.core.webapp.helpers.ResponseError;
import nosi.core.webapp.helpers.RestRequestHelper;
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
		ClientResponse response = RestRequestHelper.get("repository/deployments/",id);
		String contentResp = response.getEntity(String.class);
		DeploymentService d = new DeploymentService();
		if(response.getStatus()==200){
			d = (DeploymentService) RestRequestHelper.convertJsonToDao(contentResp, DeploymentService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	

	@SuppressWarnings("unchecked")
	public List<DeploymentService> getDeployments(){
		ClientResponse response = RestRequestHelper.get("repository/deployments");
		String contentResp = response.getEntity(String.class);
		List<DeploymentService> d = new ArrayList<>();
		if(response.getStatus()==200){
			DeploymentService dep = (DeploymentService) RestRequestHelper.convertJsonToDao(contentResp, this.getClass());
			this.setTotal(dep.getTotal());
			this.setSize(dep.getSize());
			this.setSort(dep.getSort());
			this.setOrder(dep.getOrder());
			this.setStart(dep.getStart());
			d = (List<DeploymentService>) RestRequestHelper.convertJsonToListDao(contentResp,"data", new TypeToken<List<DeploymentService>>(){}.getType());
		}else{
			this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	
	public DeploymentService create(DeploymentService deploy){
		deploy.setId(null);
		ClientResponse response = RestRequestHelper.post("repository/deployments",RestRequestHelper.convertDaoToJson(deploy));
		String contentResp = response.getEntity(String.class);
		DeploymentService d = new DeploymentService();
		if(response.getStatus()==201){
			d = (DeploymentService) RestRequestHelper.convertJsonToDao(contentResp, DeploymentService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	

	public DeploymentService update(DeploymentService deploy){
		ClientResponse response = RestRequestHelper.post("repository/deployments",RestRequestHelper.convertDaoToJson(deploy));
		String contentResp = response.getEntity(String.class);
		System.out.println(contentResp);
		DeploymentService d = new DeploymentService();
		if(response.getStatus()==200){
			d = (DeploymentService) RestRequestHelper.convertJsonToDao(contentResp, DeploymentService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	
	public boolean delete(String id){
		ClientResponse response = RestRequestHelper.delete("repository/deployments",id);
		return response.getStatus()==204;
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
