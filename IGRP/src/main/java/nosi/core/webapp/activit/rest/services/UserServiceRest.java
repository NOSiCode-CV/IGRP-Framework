package nosi.core.webapp.activit.rest.services;

import com.google.gson.reflect.TypeToken;
import jakarta.ws.rs.core.Response;
import nosi.core.webapp.activit.rest.entities.UserService;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

import java.util.ArrayList;
import java.util.List;

/**
 * Emanuel 15 May 2019
 */
public class UserServiceRest extends GenericActivitiRest {
	
	public UserService getUser(String id) {
		UserService d = new UserService();
		var response = this.getRestRequest().getHttpClient("identity/users", id);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = ResponseConverter.convertJsonToDao(contentResp, UserService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public List<UserService> getUsers() {
		List<UserService> d = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("identity/users");
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = (List<UserService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<UserService>>() {
						}.getType());
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public UserService create(UserService user) {
		UserService u = new UserService();
		var response = this.getRestRequest().postHttpClient("identity/users", ResponseConverter.convertDaoToJson(user));
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 201) {
				u = ResponseConverter.convertJsonToDao(contentResp, UserService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return u;
	}

	public UserService update(UserService user) {
		UserService u = new UserService();
		var response = this.getRestRequest().putHttpClient("identity/users", ResponseConverter.convertDaoToJson(user),
				user.getId());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				u = ResponseConverter.convertJsonToDao(contentResp, UserService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return u;
	}

	public boolean delete(String id) {
		Response response = this.getRestRequest().delete("identity/users", id);
		boolean r= response != null && response.getStatus() == 204;
		if(response!=null) {
			response.close();
		}
		return r;
	}
}
