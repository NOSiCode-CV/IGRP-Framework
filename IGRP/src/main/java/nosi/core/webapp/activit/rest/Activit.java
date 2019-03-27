package nosi.core.webapp.activit.rest;

import java.util.List;
import java.util.stream.Collectors;

import com.google.gson.annotations.Expose;

import nosi.core.webapp.Core;
import nosi.core.webapp.webservices.helpers.ResponseError;
import nosi.webapps.igrp.dao.ActivityExecute;
import nosi.webapps.igrp.dao.CustomPermssionTask;

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
		this.myproccessId = this.getMyProccessInstances().stream().map(ActivityExecute::getProcessid).collect(Collectors.toList());
		List<ActivityExecute>  instances = this.getMyProccessInstancesCustom();
		if(instances!=null && !instances.isEmpty()) {
			this.myproccessId.addAll(instances.stream().map(ActivityExecute::getProcessid).collect(Collectors.toList()));
		}
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
				.andWhereIsNull("myCustomPermission")
				.all();
	}
	
	/**
	 * Get proccess instance that i have access with custom permission
	 * @return
	 */
	public List<ActivityExecute> getMyProccessInstancesCustom(){
		List<String> customPermission = new CustomPermssionTask().find()
				.where("user.email","=",Core.getCurrentUser().getEmail())
				.all()
				.stream()
				.map(CustomPermssionTask::getCustomPermission)
				.collect(Collectors.toList());
		if(customPermission!=null && customPermission.isEmpty())
			return null;
		return new ActivityExecute().find()
				.where("organization","=",Core.getCurrentOrganization())
				.andWhere("profile","=",Core.getCurrentProfile())
				.andWhere("myCustomPermission.customPermission","in",Core.convertArrayObjectToArrayString(customPermission.toArray()))
				.all();
	}
}
