package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.HashMap;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;


@Entity
@Table(name="tbl_action")
public class Action extends BaseActiveRecord<Action> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1366720109128763696L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private String page;
	@Column(nullable=false)
	private String action;
	private String package_name;
	private String xsl_src;
	private String page_descr;
	private String action_descr;
	private String version;
	private int status;
	@ManyToOne
	@JoinColumn(name = "env_fk",foreignKey = @ForeignKey(name="ACTION_ENV_FK"),nullable=false)
	private Application application;
	
	public Action(){		
	}
	
	public Action(String page, String action, String package_name, String xsl_src, String page_descr,
			String action_descr, String version, int status, Application application) {
		super();
		this.page = page;
		this.action = action;
		this.package_name = package_name;
		this.xsl_src = xsl_src;
		this.page_descr = page_descr;
		this.action_descr = action_descr;
		this.version = version;
		this.status = status;
		this.application = application;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}	
	public String getPackage_name() {
		return package_name;
	}
	public void setPackage_name(String package_name) {
		this.package_name = package_name.toLowerCase();
	}
	public String getXsl_src() {
		return xsl_src;
	}
	public void setXsl_src(String xsl_src) {
		this.xsl_src = xsl_src;
	}
	public String getPage_descr() {
		return page_descr;
	}
	public void setPage_descr(String page_descr) {
		this.page_descr = page_descr;
	}
	public String getAction_descr() {
		return action_descr;
	}
	public void setAction_descr(String action_descr) {
		this.action_descr = action_descr;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public HashMap<Integer,String> getListActions(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Página ---");
		for(Action ac:this.findAll()){
			if(ac.getPage_descr()!=null && !ac.getPage_descr().equals(""))
				lista.put(ac.getId(), ac.getPage_descr());
			else
				lista.put(ac.getId(), ac.getPage());
		}
		return lista;
	}
}