package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;

import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class GroupService extends Activit{

	private String type;
	public GroupService() {
	}
	
	public GroupService getGroup(String id){
		GroupService d = new GroupService();
		ClientResponse response = RestRequest.get("identity/groups",id);
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (GroupService) RestRequest.convertJsonToDao(contentResp, GroupService.class);
			}else{
				d.setError((ResponseError) RestRequest.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}


	@SuppressWarnings("unchecked")
	public List<GroupService> getGroups(){
		List<GroupService> d = new ArrayList<>();
		ClientResponse response = RestRequest.get("identity/groups");
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				GroupService dep = (GroupService) RestRequest.convertJsonToDao(contentResp, this.getClass());
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<GroupService>) RestRequest.convertJsonToListDao(contentResp,"data", new TypeToken<List<GroupService>>(){}.getType());
			}else{
				this.setError((ResponseError) RestRequest.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public GroupService create(GroupService group){
		GroupService d = new GroupService();
		ClientResponse response = RestRequest.post("identity/groups",RestRequest.convertDaoToJson(group));
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==201){
				d = (GroupService) RestRequest.convertJsonToDao(contentResp, GroupService.class);
			}else{
				d.setError((ResponseError) RestRequest.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	

	public GroupService update(GroupService group){
		GroupService d = new GroupService();
		ClientResponse response = RestRequest.put("identity/groups",RestRequest.convertDaoToJson(group),group.getId());
		if(response!=null){
			String contentResp = response.getEntity(String.class);
			if(response.getStatus()==200){
				d = (GroupService) RestRequest.convertJsonToDao(contentResp, GroupService.class);
			}else{
				d.setError((ResponseError) RestRequest.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public int addUser(String idGroup,String user){
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("userId" ,user);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		ClientResponse response = RestRequest.post("identity/groups/"+idGroup+"/members",jobj.toString());
		return response!=null?response.getStatus():-1;
	}
	
	public int addUser(String user){
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("userId" ,user);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		ClientResponse response = RestRequest.post("identity/groups/"+this.getId()+"/members",jobj.toString());
		return response!=null?response.getStatus():-1;
	}
	
	public boolean delete(String id){
		ClientResponse response = RestRequest.delete("identity/groups",id);
		return response!=null && response.getStatus()==204;
	}
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
