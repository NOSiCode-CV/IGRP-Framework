package nosi.core.webapp.activit.rest;

import java.util.ArrayList;
import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.ClientResponse;
import nosi.core.webapp.helpers.ResponseError;
import nosi.core.webapp.helpers.RestRequestHelper;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class UserService {

	private String id;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
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
	@Expose(serialize=false,deserialize=false)
	private String filter= "";
	
	public UserService() {
	}

	public UserService getUser(String id){
		ClientResponse response = RestRequestHelper.get("identity/users",id);
		String contentResp = response.getEntity(String.class);
		UserService d = new UserService();
		if(response.getStatus()==200){
			d = (UserService) RestRequestHelper.convertJsonToDao(contentResp, UserService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}


	@SuppressWarnings("unchecked")
	public List<UserService> getUsers(){
		ClientResponse response = RestRequestHelper.get("identity/users");
		String contentResp = response.getEntity(String.class);
		List<UserService> d = new ArrayList<>();
		if(response.getStatus()==200){
			UserService dep = (UserService) RestRequestHelper.convertJsonToDao(contentResp, this.getClass());
			this.setTotal(dep.getTotal());
			this.setSize(dep.getSize());
			this.setSort(dep.getSort());
			this.setOrder(dep.getOrder());
			this.setStart(dep.getStart());
			d = (List<UserService>) RestRequestHelper.convertJsonToListDao(contentResp,"data", new TypeToken<List<UserService>>(){}.getType());
		}else{
			this.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	
	public UserService create(UserService user){
		ClientResponse response = RestRequestHelper.post("identity/users",RestRequestHelper.convertDaoToJson(user));
		String contentResp = response.getEntity(String.class);
		UserService d = new UserService();
		if(response.getStatus()==201){
			d = (UserService) RestRequestHelper.convertJsonToDao(contentResp, UserService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	

	public UserService update(UserService user){
		ClientResponse response = RestRequestHelper.put("identity/users",RestRequestHelper.convertDaoToJson(user),user.getId());
		String contentResp = response.getEntity(String.class);
		UserService d = new UserService();
		if(response.getStatus()==200){
			d = (UserService) RestRequestHelper.convertJsonToDao(contentResp, UserService.class);
		}else{
			d.setError((ResponseError) RestRequestHelper.convertJsonToDao(contentResp, ResponseError.class));
		}
		return d;
	}
	
	public boolean delete(String id){
		ClientResponse response = RestRequestHelper.delete("identity/users",id);
		return response.getStatus()==204;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}
	
}
