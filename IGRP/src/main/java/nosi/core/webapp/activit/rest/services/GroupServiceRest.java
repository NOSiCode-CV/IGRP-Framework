package nosi.core.webapp.activit.rest.services;

import com.google.gson.reflect.TypeToken;
import jakarta.ws.rs.core.Response;
import nosi.core.webapp.activit.rest.entities.GroupService;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Emanuel 15 May 2019
 */
public class GroupServiceRest extends GenericActivitiRest{

	public GroupService getGroup(String id) {
		GroupService g = new GroupService();
		var response = this.getRestRequest().getHttpClient("identity/groups", id);
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				g = ResponseConverter.convertJsonToDao(contentResp, GroupService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}

	@SuppressWarnings("unchecked")
	public List<GroupService> getGroups() {
		List<GroupService> d = new ArrayList<>();
		var response = this.getRestRequest().getHttpClient("identity/groups");
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				d = (List<GroupService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<GroupService>>() {
						}.getType());
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public GroupService create(GroupService group) {
		GroupService g = new GroupService();
		var response = this.getRestRequest().postHttpClient("identity/groups", ResponseConverter.convertDaoToJson(group));
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 201) {
				g = ResponseConverter.convertJsonToDao(contentResp, GroupService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}

	public GroupService update(GroupService group) {
		GroupService g = new GroupService();
		var response = this.getRestRequest().putHttpClient("identity/groups", ResponseConverter.convertDaoToJson(group),
				group.getId());
		if (response != null) {
			String contentResp = response.body();
			if (response.statusCode() == 200) {
				g = ResponseConverter.convertJsonToDao(contentResp, GroupService.class);
			} else {
				this.setError(ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}

	public int addUser(String idGroup, String user) {
		JSONObject jobj = new JSONObject();
		try {
			jobj.put("userId", user);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		var response = this.getRestRequest().postHttpClient("identity/groups/" + idGroup + "/members", jobj.toString());
		return response != null ? response.statusCode() : -1;
	}

	public boolean delete(String id) {
		Response response = this.getRestRequest().delete("identity/groups", id);
		boolean r = response != null && response.getStatus() == 204;
		if(response!=null) {
			response.close();
		}
		return r;
	}
}
