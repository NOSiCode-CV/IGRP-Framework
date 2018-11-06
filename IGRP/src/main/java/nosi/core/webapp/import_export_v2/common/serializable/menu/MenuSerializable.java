package nosi.core.webapp.import_export_v2.common.serializable.menu;

import java.io.Serializable;

/**
 * Emanuel
 * 31 Oct 2018
 */
public class MenuSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String descr;
	private int orderby;
	private int status;
	private int flg_base;
	private String target;
	private String page_name;
	private String dad_page;
	private String dad_menu;
	private MenuSerializable menu;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getOrderby() {
		return orderby;
	}
	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getFlg_base() {
		return flg_base;
	}
	public void setFlg_base(int flg_base) {
		this.flg_base = flg_base;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getPage_name() {
		return page_name;
	}
	public void setPage_name(String page_name) {
		this.page_name = page_name;
	}
	public String getDad_page() {
		return dad_page;
	}
	public void setDad_page(String dad_page) {
		this.dad_page = dad_page;
	}
	public String getDad_menu() {
		return dad_menu;
	}
	public void setDad_menu(String dad_menu) {
		this.dad_menu = dad_menu;
	}
	public MenuSerializable getMenu() {
		return menu;
	}
	public void setMenu(MenuSerializable menu) {
		this.menu = menu;
	}
	
	
}
