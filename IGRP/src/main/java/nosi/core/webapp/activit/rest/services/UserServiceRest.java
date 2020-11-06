package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.ws.rs.core.Response;
import com.google.gson.reflect.TypeToken;
import nosi.core.webapp.activit.rest.entities.UserService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 15 May 2019
 */
public class UserServiceRest extends GenericActivitiRest {
	
	public UserService getUser(String id) {
		UserService d = new UserService();
		Response response = this.getRestRequest().get("identity/users", id);
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (UserService) ResponseConverter.convertJsonToDao(contentResp, UserService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	@SuppressWarnings("unchecked")
	public List<UserService> getUsers() {
		List<UserService> d = new ArrayList<>();
		Response response = this.getRestRequest().get("identity/users");
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<UserService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<UserService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return d;
	}

	public UserService create(UserService user) {
		UserService u = new UserService();
		Response response = this.getRestRequest().post("identity/users", ResponseConverter.convertDaoToJson(user));
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 201) {
				u = (UserService) ResponseConverter.convertJsonToDao(contentResp, UserService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
		}
		return u;
	}

	public UserService update(UserService user) {
		UserService u = new UserService();
		Response response = this.getRestRequest().put("identity/users", ResponseConverter.convertDaoToJson(user),
				user.getId());
		if (response != null) {
			String contentResp = "";
			try {
				contentResp = FileHelper.convertToString((InputStream) response.getEntity());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				u = (UserService) ResponseConverter.convertJsonToDao(contentResp, UserService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
			response.close();
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
