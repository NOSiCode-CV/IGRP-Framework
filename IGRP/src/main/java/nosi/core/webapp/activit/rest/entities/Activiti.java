package nosi.core.webapp.activit.rest.entities;

import com.google.gson.annotations.Expose;

/**
 * Yma
 * 27 Sep 2017
 */
public class Activiti  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected String id;
	protected String category;
	protected String name;
	protected String url;
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
	@Expose(deserialize=false,serialize=false)
	private String processName;
	@Expose(deserialize=false,serialize=false)
	private String businessKey_;
	
	public Activiti() {
		
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

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public String getBusinessKey_() {
		return businessKey_;
	}

	public void setBusinessKey_(String businessKey_) {
		this.businessKey_ = businessKey_;
	}

	@Override
	public String toString() {
		return "Activiti [id=" + id + ", category=" + category + ", name=" + name + ", url=" + url + ", total=" + total
				+ ", start=" + start + ", sort=" + sort + ", order=" + order + ", size=" + size + ", processName="
				+ processName + ", businessKey_=" + businessKey_ + "]";
	}
	
}
