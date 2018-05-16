package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import javax.ws.rs.core.Response;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */

public class DeploymentService extends Activit{

	private String deploymentTime;
	private String tenantId;
	
	public DeploymentService() {
	}

	public DeploymentService getDeployment(String id){
		DeploymentService d = this;
		Response response = new RestRequest().get("repository/deployments/",id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp,DeploymentService.class);
			}else{
				d.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	@SuppressWarnings("unchecked")
	public DeploymentService getDeploymentByName(String name){
		DeploymentService d = this;
		Response response = new RestRequest().get("repository/deployments?name="+name);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				List<DeploymentService> list = (List<DeploymentService>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<DeploymentService>>(){}.getType());
				if(list != null && list.size() > 0) 
					d = list.get(0);
			}else{
				d.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public List<DeploymentService> getDeployments(String idApp){
		List<DeploymentService> d = new ArrayList<>();
		Response response = new RestRequest().get("repository/deployments?&size=100000000&tenantId="+idApp);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				DeploymentService dep = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<DeploymentService>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<DeploymentService>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public DeploymentService create(Part file,String idApp) throws IOException {
	   DeploymentService d = this;
       Response response = new RestRequest().post("repository/deployments?tenantId="+idApp,file,".bpmn20.xml");
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==201){
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
			}else{
				d.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		file.delete();
		return d;
	}
	
	public DeploymentService create(InputStream file,String idApp,String fileName,String contentType) throws IOException {
		   DeploymentService d = this;
	       Response response = new RestRequest().post("repository/deployments?tenantId="+idApp,file,fileName,contentType);
			if(response!=null){
				String contentResp = "";
				InputStream is = (InputStream) response.getEntity();
				try {
					contentResp = FileHelper.convertToString(is);
				} catch (IOException e) {
					e.printStackTrace();
				}
				if(response.getStatus()==201){
					d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp, DeploymentService.class);
				}else{
					d.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
				}
			}
			return d;
	}
	
	public DeploymentService update(Part file,String idApp) throws IOException{
		DeploymentService d = this;
		Response response = new RestRequest().post("repository/deployments?tenantId="+idApp,file,".bpmn20.xml");
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				d = (DeploymentService) ResponseConverter.convertJsonToDao(contentResp,DeploymentService.class);
			}else{
				d.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		file.delete();
		return d;
	}
	
	public boolean delete(String id){
		Response response = new RestRequest().delete("repository/deployments",id);
		return response!=null && response.getStatus()==204;
	}

	
	public String getDeploymentTime() {
		return deploymentTime;
	}

	public void setDeploymentTime(String deploymentTime) {
		this.deploymentTime = deploymentTime;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public boolean hashError() {
		return this.getError()!=null;
	}


}
