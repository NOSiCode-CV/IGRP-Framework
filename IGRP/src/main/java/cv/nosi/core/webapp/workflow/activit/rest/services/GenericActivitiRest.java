package cv.nosi.core.webapp.workflow.activit.rest.services;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.workflow.activit.rest.entities.TaskVariables;
import cv.nosi.core.webapp.workflow.activit.rest.request.RestRequest;
import cv.nosi.core.webservices.rest.client.helpers.ResponseError;

/**
 * Emanuel 14 May 2019
 */
public abstract class GenericActivitiRest {

	protected ResponseError error;
	protected String filterUrl = "";
	protected JSONObject filterBody;
	protected List<TaskVariables> variables;

	public GenericActivitiRest() {
		this.filterBody = new JSONObject();
		this.variables = new ArrayList<>();
	}

	protected RestRequest getRestRequest() {
		return new RestRequest();
	}
	
	public ResponseError getError() {
		return error;
	}

	public void setError(ResponseError error) {
		this.error = error;
	}

	public String getFilterUrl() {
		return filterUrl;
	}

	public void setFilterUrl(String filterUrl) {
		this.filterUrl = filterUrl;
	}

	public JSONObject getFilterBody() {
		return filterBody;
	}

	public void setFilterBody(JSONObject filterBody) {
		this.filterBody = filterBody;
	}

	public void addFilterBody(String filterName, String value) {
		if (Core.isNotNull(filterName)) {
			try {
				filterBody.put(filterName, value);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

	public void addFilterUrl(String paramName, String value) {
		this.filterUrl += ("&" + paramName + "=" + value);
	}

	public void clearFilterUrl() {
		this.filterUrl = "";
	}

	public void clearFilterBody() {
		this.filterBody = new JSONObject();
	}


}
