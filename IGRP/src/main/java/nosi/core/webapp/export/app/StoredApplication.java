package nosi.core.webapp.export.app;

import java.util.List;

/**
 * Emanuel
 * 3 Apr 2018
 */
public class StoredApplication {
	private String dad;
	private String name;
	private String img_src;
	private String description;
	private int status;
	private String template;
	private int external;
	private String url;
	
	private List<StoredModulo> modulos;
	
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTemplate() {
		return template;
	}
	public void setTemplate(String template) {
		this.template = template;
	}
	public int getExternal() {
		return external;
	}
	public void setExternal(int external) {
		this.external = external;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public List<StoredModulo> getModulos() {
		return modulos;
	}
	public void setModulos(List<StoredModulo> modulos) {
		this.modulos = modulos;
	}
	@Override
	public String toString() {
		return "StoredApplication [dad=" + dad + ", name=" + name + ", img_src=" + img_src + ", description="
				+ description + ", status=" + status + ", template=" + template + ", external=" + external + ", url="
				+ url + "]";
	}
	
}
