package nosi.core.webapp.activit.rest.business;

import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
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

	@SuppressWarnings("deprecation")
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
	
	/**
	 * Get proccess instance that i have access
	 * @return list of process instances
	 */
	public List<ActivityExecute> getMyProccessInstances(String[] filterProcessIDs) {
		final String[] process = this.getMyProcessKey();
		if (process.length > 0)
			return new ActivityExecute().find().keepConnection()
					.where("organization", "=", Core.getCurrentOrganization())
					.andWhere("proccessKey", "in", process)
					.andWhere("processid", "in", filterProcessIDs)
					.andWhere("application.dad", "=", Core.getCurrentDad())
					.all();
		return null;
	}

	private String[] getMyProcessKey() {

		final List<TaskAccess> taskAccessList = new TaskAccess().find()
				.where("organization","=",Core.getCurrentOrganization())
				.andWhere("profileType","=",Core.getCurrentProfile())
				.andWhere("profileType.application.dad","=",Core.getCurrentDad())
				.keepConnection()
				.all();

		if (taskAccessList == null)
			return new String[] {};

		return taskAccessList.stream().map(TaskAccess::getProcessName).distinct().toArray(String[]::new);
	}

	
	public boolean filterAccess(ProcessDefinitionService p) {
        if (null == p || p.getKey() == null)
            return false;
        if ("igrp_studio".equalsIgnoreCase(Core.getCurrentApp().getDad()))
            return true;
		return new TaskAccess().getTaskAccess().stream()
				.anyMatch(a -> null != a && (
								p.getKey().equals(a.getProcessName()) || ("Start" + p.getKey()).equals(a.getTaskName())
						)
				);

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
