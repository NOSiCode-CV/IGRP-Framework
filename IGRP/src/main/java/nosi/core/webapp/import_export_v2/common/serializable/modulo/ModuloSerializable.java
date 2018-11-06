package nosi.core.webapp.import_export_v2.common.serializable.modulo;

import java.io.Serializable;
import java.util.List;
import nosi.core.webapp.import_export_v2.common.serializable.page.PageSerializable;

/**
 * Emanuel
 * 5 Nov 2018
 */
public class ModuloSerializable implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String dad_app;
	private String descricao;
	private List<PageSerializable> pages;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDad_app() {
		return dad_app;
	}
	public void setDad_app(String dad_app) {
		this.dad_app = dad_app;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public List<PageSerializable> getPages() {
		return pages;
	}
	public void setPages(List<PageSerializable> pages) {
		this.pages = pages;
	}
	
}
