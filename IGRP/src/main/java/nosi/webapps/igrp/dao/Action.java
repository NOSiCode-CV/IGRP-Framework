package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.helpers.StringHelper;
import static nosi.core.i18n.Translator.gt;

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
	@Transient
	private String version_src;
	@Transient
	private String img_src;
	@Transient //Para armazenar id de pagina quando importar de plsql
	private Integer id_plsql;
	@Transient //Para armazenar src_xsl de pagina quando importar de plsql
	private String src_xsl_plsql;
	private int status;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_fk",foreignKey = @ForeignKey(name="ACTION_ENV_FK"),nullable=false)
	private Application application;
	private short isComponent = 0;
	private String xmlContent;
	private String xslContent;
	
	public Action(){		
	}
	
	public Action(String page, String action, String package_name, String xsl_src, String page_descr,
			String action_descr, String version, int status, Application application) {
		super();
		this.page = StringHelper.removeSpecialCharaterAndSpace(page);
		this.action = action;
		this.package_name = (package_name!=null)?package_name.toLowerCase():package_name;
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
		this.page = StringHelper.removeSpecialCharaterAndSpace(page);
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
		return "2.3";
	}
	public void setVersion(String version) {
		this.version = "2.3";
	}

	@Transient
	public String getVersion_src() {
		return version_src;
	}

	public void setVersion_src(String version_src) {
		this.version_src = version_src;
	}

	@Transient
	public Integer getId_plsql() {
		return id_plsql;
	}

	public void setId_plsql(Integer id_plsql) {
		this.id_plsql = id_plsql;
	}

	@Transient
	public String getSrc_xsl_plsql() {
		return src_xsl_plsql;
	}

	public void setSrc_xsl_plsql(String src_xsl_plsql) {
		this.src_xsl_plsql = src_xsl_plsql;
	}

	@Transient
	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
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

	public short getIsComponent() {
		return isComponent;
	}

	public void setIsComponent(short isComponent) {
		this.isComponent = isComponent;
	}
	
	public String getXmlContent() {
		return xmlContent;
	}

	public void setXmlContent(String xmlContent) {
		this.xmlContent = xmlContent;
	}
	
	public String getXslContent() {
		return xslContent;
	}

	public void setXslContent(String xslContent) {
		this.xslContent = xslContent;
	}

	@Override
	public String toString() {
		return "Action [page=" + page + ", action=" + action + ", package_name=" + package_name + ", xsl_src=" + xsl_src
				+ ", page_descr=" + page_descr + ", action_descr=" + action_descr + ", version=" + version + ", status="
				+ status +"]";
	}

	public HashMap<Integer,String> getListActions(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for(Action ac:this.findAll()){
			if(ac.getPage_descr()!=null && !ac.getPage_descr().equals(""))
				lista.put(ac.getId(), ac.getPage_descr());
			else
				lista.put(ac.getId(), ac.getPage());
		}
		return lista;
	}
	
	public HashMap<Integer,String> getListActions(int app){
		List<Share> shares = new Share().find().andWhere("env.id", "=", app).andWhere("type", "=", "PAGE")
				.andWhere("status", "=", "1").all();
		List<Action> aux = new ArrayList<Action>();
		
		if(shares == null)
			shares = new ArrayList<Share>();
		
		for(Share share : shares) {
			Action action = new Action().findOne(share.getType_fk());
			if(action != null)
				aux.add(action);
		} 
		
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		List<Action> actions = this.find().andWhere("application.id", "=", "" + app).all();
		
		if(actions == null)
			actions = new ArrayList<Action>();
		
		actions.addAll(aux);
		for(Action ac : actions){
			if(ac.getPage_descr()!=null && !ac.getPage_descr().equals(""))
				lista.put(ac.getId(), ac.getPage_descr());
			else
				lista.put(ac.getId(), ac.getPage());
		}
		return lista;
	}
}