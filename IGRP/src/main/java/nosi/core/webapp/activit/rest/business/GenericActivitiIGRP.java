package nosi.core.webapp.activit.rest.business;

import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import nosi.core.webapp.Core;
import nosi.core.webapp.activit.rest.entities.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.services.GenericActivitiRest;
import nosi.core.webapp.bpmn.GenerateInterfacePermission;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.core.webapp.webservices.helpers.RestRequest;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.TaskAccess;

/**
 * Emanuel
 * 14 May 2019
 */
public class GenericActivitiIGRP {
	
	private ResponseError error;
	protected List<String> myproccessId;
	protected GenericActivitiRest activitiRest;
	
	public ResponseError getError() {
		return error;
	}
	
	public void addFilterBody(String filterName, String value) {
		this.activitiRest.addFilterBody(filterName, value);
	}

	public void addFilterUrl(String paramName, String value) {
		this.activitiRest.addFilterUrl(paramName, value);
	}

	public void clearFilterUrl() {
		this.activitiRest.clearFilterUrl();
	}

	public void clearFilterBody() {
		this.activitiRest.clearFilterBody();
	}
	public void setError(ResponseError error) {
		this.error = error;
	}

	protected void setMyProccessAccess(String[] filterProcessIDs) {
		if(this.myproccessId==null) {
			if(filterProcessIDs.length>0)
				this.myproccessId = this.getMyProcessAccess(filterProcessIDs);
			else
				this.myproccessId =new ArrayList<>();
		}
	}

	private List<String> getMyProcessAccess(String[] filterProcessIDs) {

		final List<ActivityExecute> myProcessAccess = this.getMyProccessInstances(filterProcessIDs);

		if (myProcessAccess == null)
			return new ArrayList<>();

		return myProcessAccess.stream()
				.filter(p -> allowTask(p.getProccessKey(), p))
				.map(ActivityExecute::getProcessid).distinct().collect(Collectors.toList());
	}

	/**
	 * Get proccess instance that i have access
	 * @return list of process instances
	 */
	public List<ActivityExecute> getMyProccessInstances(String[] filterProcessIDs) {
		final String[] process = this.getMyProcessKey();
		if (process.length > 0) {
			 ActivityExecute activityExecute = new ActivityExecute().find().keepConnection();

			if(new Organization().find().where("organization","=",Core.getCurrentOrganization()).getCount()==0)
				activityExecute.where("organization", "=", Core.getCurrentOrganization());

			activityExecute.andWhere("proccessKey", "in", process)
					.andWhere("processid", "in", filterProcessIDs)
					.andWhere("application.dad", "=", Core.getCurrentDad())
					.orderByDesc("id");
            return activityExecute.all().stream()
					.collect(Collectors.toMap(
							ActivityExecute::getProcessid, // key - the field on which you want distinct activities
							Function.identity(),      // value - the activity itself
							(existing, replacement) -> existing)) // if a value already exists for a key, keep the existing
					.values()
					.stream()
					.collect(Collectors.toList());
		}
		return null;
	}
	
	private String[] getMyProcessKey() {
		final List<Map<String, Object>> taskAccessList = new TaskAccess().find()
				.where("organization","=",Core.getCurrentOrganization())
				.andWhere("profileType","=",Core.getCurrentProfile())
				.groupBy("processName")
				.keepConnection()
				.allColumns("processName");
		
		if (taskAccessList == null)
			return new String[] {};
		
		return taskAccessList.stream().map(m->m.get("processName")).distinct().toArray(String[]::new);
	}	
	
	public boolean allowTask(String processKey,ActivityExecute task) {
		boolean allowTask = true;//allow all task by default
    	try {
      		if(Core.isNotNullMultiple(task.getApplication(),task.getApplication().getDad())) {
	    		String packageName = GenerateInterfacePermission.getProccessPackageName(task.getApplication().getDad().toLowerCase(),processKey);
	    		if(Core.isNotNull(packageName)) {
					final Class<?> c = Class.forName(packageName);
					Core.setAttribute("current_app_conn", Core.getCurrentDad());
					final Method method = c.getMethod("allowTask", ActivityExecute.class);
					allowTask = (boolean) method.invoke(c.getDeclaredConstructor().newInstance(), task);//Get custom permission
	    		}
    		}
		} catch (Exception ignored) {
			// Exception ignored
		} 
    	return allowTask;
	}
	
	public boolean filterAccess(ProcessDefinitionService p) {
        if (null == p || p.getKey() == null)
            return false;
        final String currentDad = Core.getCurrentDad();
		if ("igrp_studio".equalsIgnoreCase(currentDad) || "igrp".equalsIgnoreCase(currentDad))
            return true;
		return new TaskAccess().hasTaskAccess(p.getKey());

    }

	
	public FileRest getFile(String url){
		RestRequest request = new RestRequest();
		FileRest f = new FileRest();
		request.setAccept_format(MediaType.APPLICATION_OCTET_STREAM);
		Response response = request.get(url);
		if(response!=null){
			if(response.getStatus()==200) {
				f.setContent((InputStream) response.getEntity());
				f.setSize(response.getLength());
				f.setContentType(response.getMediaType().toString());
			}
			response.close();
		}
		return f;
	}
	
}
