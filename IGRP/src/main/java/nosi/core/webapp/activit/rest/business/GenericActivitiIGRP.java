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
	protected List<String> myproccessId = null;
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

	protected void setMyProccessAccess() {
		if(this.myproccessId==null)
			this.myproccessId = this.getMyProccessAccess();
	}
	private List<String> getMyProccessAccess() {
		List<ActivityExecute>  myProccessAccess =  this.getMyProccessInstances();
		List<String> proccess = new ArrayList<>();
		if(myProccessAccess!=null) {
			myProccessAccess = myProccessAccess.stream()
					.filter(p->allowTask(p.getProccessKey(), p))
					.collect(Collectors.toList());
			proccess = myProccessAccess.stream().map(ActivityExecute::getProcessid).collect(Collectors.toList());
		}
		return proccess;
	}

	public boolean allowTask(String proccessKey,ActivityExecute task) {
		boolean r = true;//allow all task by default
    	try {
    		if(Core.isNotNullMultiple(task.getApplication(),task.getApplication().getDad())) {
	    		String packageName = GenerateInterfacePermission.getProccessPackageName(task.getApplication().getDad().toLowerCase(),proccessKey);
	    		if(Core.isNotNull(packageName)) {
					Class<?> c = Class.forName(packageName);
					if(c!=null) {
						Core.setAttribute("current_app_conn", Core.getCurrentDad());
						Method method = c.getMethod("allowTask",ActivityExecute.class);
						r = (boolean) method.invoke(c.newInstance(), task);//Get custom permission
					}
	    		}
    		}
		} catch (Exception e) {
			r = true;
		} 
    	return r;
	}	
	
	/**
	 * Get proccess instance that i have access
	 * @return
	 */
	public List<ActivityExecute> getMyProccessInstances(){
		String [] proccess = this.getMyProccessKey();
		if(proccess!=null && proccess.length > 0)
			return new ActivityExecute().find()
					.where("organization","=",Core.getCurrentOrganization())
					.andWhere("proccessKey","in",proccess)
					.andWhere("application.dad","=",Core.getCurrentDad())
					.all();
		return null;
	}

	private String[] getMyProccessKey() {
		List<TaskAccess> ta = new TaskAccess().find()
				.where("organization","=",Core.getCurrentOrganization())
				.andWhere("profileType","=",Core.getCurrentProfile())
				.andWhere("profileType.application.dad","=",Core.getCurrentDad())
				.all();
		if(ta!=null) {
			return Core.convertArrayObjectToArrayString(ta.stream().map(TaskAccess::getProcessName).collect(Collectors.toList()).toArray());
		}
		return null;
	}

	public boolean filterAccess(ProcessDefinitionService p) {
		if (Core.getCurrentApp().getDad().equalsIgnoreCase("igrp_studio"))
			return true;
		boolean x = new TaskAccess().getTaskAccess().stream().filter(a -> {
			try {
				return a.getProcessName().compareTo(p.getKey()) == 0 ||  a.getTaskName().compareTo("Start" + p.getKey()) == 0;
			} catch (Exception e) {
				return false;
			}
		}).collect(Collectors.toList()).size() > 0;
		return x;
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
				return f;
			}
		}
		return f;
	}
	
	
}
