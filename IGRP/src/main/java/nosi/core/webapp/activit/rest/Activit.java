package nosi.core.webapp.activit.rest;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import com.google.gson.annotations.Expose;
import nosi.core.webapp.Core;
import nosi.core.webapp.bpmn.GenerateInterfacePermission;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.webapps.igrp.dao.ActivityExecute;

/**
 * Yma
 * 27 Sep 2017
 */
public class Activit {

	protected String id;
	protected String category;
	protected String name;
	protected String url;
	@Expose(serialize=false,deserialize=false)
	private ResponseError error;
	@Expose(serialize=false)
	private Integer total = 0;
	@Expose(serialize=false)
	private Integer start;
	@Expose(serialize=false)
	private String sort;
	@Expose(serialize=false)
	private String order;
	@Expose(serialize=false)
	private Integer size = 0;
	@Expose(serialize=false,deserialize=false)
	private String filter="";
	@Expose(serialize=false,deserialize=false)
	protected List<String> myproccessId;
	
	public Activit() {
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
		boolean r = true;
    	try {
    		if(Core.isNotNullMultiple(task.getApplication(),task.getApplication().getDad())) {
	    		String packageName = GenerateInterfacePermission.getProccessClassName(task.getApplication().getDad().toLowerCase(),proccessKey);
	    		if(Core.isNotNull(packageName)) {
					Class<?> c = Class.forName(packageName);
					Method method = c.getMethod("allowTask",ActivityExecute.class);
					r = (boolean) method.invoke(c.newInstance(), task);//Get custom permission
	    		}
    		}
		} catch (Exception e) {
			r = true;
			e.printStackTrace();
		} 
    	return r;//allow all task by default
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	/**
	 * Get proccess instance that i have access without custom permission
	 * @return
	 */
	public List<ActivityExecute> getMyProccessInstances(){
		return new ActivityExecute().find()
				.where("organization","=",Core.getCurrentOrganization())
				.andWhere("profile","=",Core.getCurrentProfile())
				.andWhere("application.dad","=",Core.getCurrentDad() )
				.all();
	}
	
}
