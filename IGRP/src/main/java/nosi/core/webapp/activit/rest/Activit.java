package nosi.core.webapp.activit.rest;

import com.google.gson.annotations.Expose;
import nosi.core.webapp.webservices.helpers.ResponseError;

/**
 * Yma
 * 27 Sep 2017
 */
public class Activit {

	private String id;
	private String category;
	private String name;
	private String url;
	@Expose(serialize=false,deserialize=false)
	private ResponseError error;
	@Expose(serialize=false)
	private Integer total;
	@Expose(serialize=false)
	private Integer start;
	@Expose(serialize=false)
	private String sort;
	@Expose(serialize=false)
	private String order;
	@Expose(serialize=false)
	private Integer size;
	@Expose(serialize=false,deserialize=false)
	private String filter="";
	
	public Activit() {
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
	
}
