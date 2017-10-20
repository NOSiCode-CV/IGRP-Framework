package nosi.core.xml;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Isaias.Nunes
 * Oct 18, 2017
 */
@XmlRootElement(name = "Application")
public class XMLApplicationReader {
	private String dad;
	private String description;
	private int external;
	private String img_src;
	private String name;
	private int status;
	private String url;
	private int action_fk;
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getExternal() {
		return external;
	}
	public void setExternal(int external) {
		this.external = external;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getAction_fk() {
		return action_fk;
	}
	public void setAction_fk(int action_fk) {
		this.action_fk = action_fk;
	}
	@Override
	public String toString() {
		return "XMLApplicationReader [dad=" + dad + ", description=" + description + ", external=" + external
				+ ", img_src=" + img_src + ", name=" + name + ", status=" + status + ", url=" + url + ", action_fk="
				+ action_fk + "]";
	}

}
