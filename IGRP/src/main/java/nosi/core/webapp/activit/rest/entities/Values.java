package nosi.core.webapp.activit.rest.entities;
/**
 * Emanuel
 * 14 May 2019
 */
public class Values  implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Values [id=" + id + ", name=" + name + "]";
	}
}
