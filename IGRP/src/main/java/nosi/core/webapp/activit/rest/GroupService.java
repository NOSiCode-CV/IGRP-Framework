package nosi.core.webapp.activit.rest;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Response;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class GroupService{

	/**
	 * 
	 */

	private String id;
	private String category;
	private String name;
	private String type;

	@Expose(serialize=false,deserialize=false)
	private ResponseError error;
	@Expose(serialize=false)
	private Integer total;
	@Expose(serialize=false)
	private Integer start;
	@Expose(serialize=false)
	private String sort;
	@Expose(serialize=false)
	private String order;
	@Expose(serialize=false)
	private Integer size;
	
	public GroupService() {
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ResponseError getError() {
		return error;
	}


	public void setError(ResponseError error) {
		this.error = error;
	}


	public Integer getTotal() {
		return total;
	}


	public void setTotal(Integer total) {
		this.total = total;
	}


	public Integer getStart() {
		return start;
	}


	public void setStart(Integer start) {
		this.start = start;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getOrder() {
		return order;
	}


	public void setOrder(String order) {
		this.order = order;
	}


	public Integer getSize() {
		return size;
	}


	public void setSize(Integer size) {
		this.size = size;
	}


	public GroupService getGroup(String id){
		GroupService g = new GroupService();
		Response response = new RestRequest().get("identity/groups",id);
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				g = (GroupService) ResponseConverter.convertJsonToDao(contentResp,GroupService.class);
			}else{
				g.setError((ResponseError)ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}


	@SuppressWarnings("unchecked")
	public List<GroupService> getGroups(){
		List<GroupService> d = new ArrayList<>();
		Response response = new RestRequest().get("identity/groups");
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				GroupService dep = (GroupService) ResponseConverter.convertJsonToDao(contentResp,GroupService.class);
				this.setTotal(dep.getTotal());
				this.setSize(dep.getSize());
				this.setSort(dep.getSort());
				this.setOrder(dep.getOrder());
				this.setStart(dep.getStart());
				d = (List<GroupService>) ResponseConverter.convertJsonToListDao(contentResp,"data", new TypeToken<List<GroupService>>(){}.getType());
			}else{
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}
	
	public GroupService create(GroupService group){
		GroupService g = new GroupService();
		Response response = new RestRequest().post("identity/groups",ResponseConverter.convertDaoToJson(group));
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==201){
				g = (GroupService) ResponseConverter.convertJsonToDao(contentResp,GroupService.class);
			}else{
				g.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}
	

	public GroupService update(GroupService group){
		GroupService g = new GroupService();
		Response response = new RestRequest().put("identity/groups",ResponseConverter.convertDaoToJson(group),group.getId());
		if(response!=null){
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(response.getStatus()==200){
				g  = (GroupService) ResponseConverter.convertJsonToDao(contentResp,GroupService.class);
			}else{
				g.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}
	
	public int addUser(String idGroup,String user){
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("userId" ,user);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		Response response = new RestRequest().post("identity/groups/"+idGroup+"/members",jobj.toString());
		return response!=null?response.getStatus():-1;
	}
	
	public int addUser(String user){
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("userId" ,user);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		Response response = new RestRequest().post("identity/groups/"+this.getId()+"/members",jobj.toString());
		return response!=null?response.getStatus():-1;
	}
	
	public boolean delete(String id){
		Response response = new RestRequest().delete("identity/groups",id);
		return response!=null && response.getStatus()==204;
	}	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "GroupService [id=" + id + ", category=" + category + ", name=" + name + ", type=" + type + ", error="
				+ error + ", total=" + total + ", start=" + start + ", sort=" + sort + ", order=" + order + ", size="
				+ size + "]";
	}
	
}
