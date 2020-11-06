package nosi.core.webapp.activit.rest.entities;

/**
 * @author: Emanuel Pereira
 * 27 Sep 2017
 */
public class GroupService extends Activiti implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String category;
	private String name;
	private String type;

	
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

	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "GroupService [id=" + id + ", category=" + category + ", name=" + name + ", type=" + type + "]";
	}
	
}
