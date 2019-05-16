package nosi.core.webapp.activit.rest.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.reflect.TypeToken;

import nosi.core.webapp.activit.rest.entities.GroupService;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.webservices.helpers.ResponseConverter;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Emanuel 15 May 2019
 */
public class GroupServiceRest extends GenericActivitiRest{

	public GroupService getGroup(String id) {
		GroupService g = new GroupService();
		Response response = this.getRestRequest().get("identity/groups", id);
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				g = (GroupService) ResponseConverter.convertJsonToDao(contentResp, GroupService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}

	@SuppressWarnings("unchecked")
	public List<GroupService> getGroups() {
		List<GroupService> d = new ArrayList<>();
		Response response = this.getRestRequest().get("identity/groups");
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				d = (List<GroupService>) ResponseConverter.convertJsonToListDao(contentResp, "data",
						new TypeToken<List<GroupService>>() {
						}.getType());
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return d;
	}

	public GroupService create(GroupService group) {
		GroupService g = new GroupService();
		Response response = this.getRestRequest().post("identity/groups", ResponseConverter.convertDaoToJson(group));
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 201) {
				g = (GroupService) ResponseConverter.convertJsonToDao(contentResp, GroupService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
			}
		}
		return g;
	}

	public GroupService update(GroupService group) {
		GroupService g = new GroupService();
		Response response = this.getRestRequest().put("identity/groups", ResponseConverter.convertDaoToJson(group),
				group.getId());
		if (response != null) {
			String contentResp = "";
			InputStream is = (InputStream) response.getEntity();
			try {
				contentResp = FileHelper.convertToString(is);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (response.getStatus() == 200) {
				g = (GroupService) ResponseConverter.convertJsonToDao(contentResp, GroupService.class);
			} else {
				this.setError((ResponseError) ResponseConverter.convertJsonToDao(contentResp, ResponseError.class));
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
		Response response = this.getRestRequest().post("identity/groups/" + idGroup + "/members", jobj.toString());
		return response != null ? response.getStatus() : -1;
	}

	public boolean delete(String id) {
		Response response = this.getRestRequest().delete("identity/groups", id);
		return response != null && response.getStatus() == 204;
	}
}
