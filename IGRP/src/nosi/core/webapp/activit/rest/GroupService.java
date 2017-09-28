package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;
import nosi.core.webapp.helpers.ResponseError;
import nosi.core.webapp.helpers.RestRequestHelper;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class GroupService extends Activit{

	private String type;
	public GroupService() {
	}
	
	public GroupService getGroup(String id){
		ClientResponse response = RestRequestHelper.get("identity/groups",id);
		String contentResp = response.getEntity(String.class);
		GroupService d = new GroupService();
		if(response.getStatus()==200){
			d = (GroupService) RestRequestHelper.convertJsonToDao(contentResp, GroupService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}


	@SuppressWarnings("unchecked")
	public List<GroupService> getGroups(){
		ClientResponse response = RestRequestHelper.get("identity/groups");
		String contentResp = response.getEntity(String.class);
		List<GroupService> d = new ArrayList<>();
		if(response.getStatus()==200){
			GroupService dep = (GroupService) RestRequestHelper.convertJsonToDao(contentResp, this.getClass());
			this.setTotal(dep.getTotal());
			this.setSize(dep.getSize());
			this.setSort(dep.getSort());
			this.setOrder(dep.getOrder());
			this.setStart(dep.getStart());
			d = (List<GroupService>) RestRequestHelper.convertJsonToListDao(contentResp,"data", new TypeToken<List<GroupService>>(){}.getType());
		}else{
			this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	
	public GroupService create(GroupService group){
		ClientResponse response = RestRequestHelper.post("identity/groups",RestRequestHelper.convertDaoToJson(group));
		String contentResp = response.getEntity(String.class);
		GroupService d = new GroupService();
		if(response.getStatus()==201){
			d = (GroupService) RestRequestHelper.convertJsonToDao(contentResp, GroupService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	

	public GroupService update(GroupService group){
		ClientResponse response = RestRequestHelper.put("identity/groups",RestRequestHelper.convertDaoToJson(group),group.getId());
		String contentResp = response.getEntity(String.class);
		GroupService d = new GroupService();
		if(response.getStatus()==200){
			d = (GroupService) RestRequestHelper.convertJsonToDao(contentResp, GroupService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	
	public boolean delete(String id){
		ClientResponse response = RestRequestHelper.delete("identity/groups",id);
		return response.getStatus()==204;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
