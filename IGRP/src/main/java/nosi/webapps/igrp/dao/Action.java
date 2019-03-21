package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.StringHelper;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name = "tbl_action")
public class Action extends IGRPBaseActiveRecord<Action> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1366720109128763696L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable = false)
	private String page;
	@Column(nullable = false)
	private String action;
	private String package_name;
	private String xsl_src;
	private String page_descr;
	private String action_descr;
	private String versao;
	@Transient
	private String version_src;
	@Transient
	private String img_src;
	@Transient // Para armazenar id de pagina quando importar de plsql
	private Integer id_plsql;
	@Transient // Para armazenar src_xsl de pagina quando importar de plsql
	private String src_xsl_plsql;
	private int status;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "env_fk", foreignKey = @ForeignKey(name = "ACTION_ENV_FK"), nullable = false)
	private Application application;
	private short isComponent = 0; // 0 = Page; 1 = Component; 2 = Page Task
	private String xmlContent;
	private String xslContent;
	private String processKey;
	
	private short tipo = 0; // 0 = Privado (Authentication); 1 = Publico; ... 
	
	private String nomeModulo;

	public Action() {
		super();
	}

	public Action(String page, String action, String package_name, String xsl_src, String page_descr,
			String action_descr, String version, int status, Application application) {	
		this();	
		this.page = StringHelper.removeSpecialCharaterAndSpace(page);
		this.action = action;
		this.package_name = (package_name != null) ? package_name.toLowerCase() : package_name;
		this.xsl_src = xsl_src;
		this.page_descr = page_descr;
		this.action_descr = action_descr;
		this.versao = version;
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
		this.versao = "2.3";
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

	
	
	public String getProcessKey() {
		return processKey;
	}

	public void setProcessKey(String processKey) {
		this.processKey = processKey;
	}

	@Override
	public String toString() {
		return "Action [page=" + page + ", action=" + action + ", package_name=" + package_name + ", xsl_src=" + xsl_src
				+ ", page_descr=" + page_descr + ", action_descr=" + action_descr + ", version=" + versao + ", status="
				+ status + "]";
	}

	public HashMap<Integer, String> getListActions() {
		HashMap<Integer, String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for (Action ac : this.findAll()) {
			if (ac.getPage_descr() != null && !ac.getPage_descr().equals(""))
				lista.put(ac.getId(), ac.getPage_descr());
			else
				lista.put(ac.getId(), ac.getPage());
		}
		return lista;
	}

	public HashMap<Integer, String> getListActions(int app) {
		List<Share> shares = new Share().find().andWhere("env.id", "=", app).andWhere("type", "=", "PAGE")
				.andWhere("status", "=", 1).all();
		List<Action> aux = new ArrayList<Action>();

		if (shares != null)
			for (Share share : shares) {
				Action action = new Action().findOne(share.getType_fk());
				if (action != null)
					aux.add(action);
			}
		
		LinkedHashMap<Integer, String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		List<Action> actions = this.find().andWhere("application.id", "=",app).andWhere("status", "=", 1)
				.andWhere("isComponent", "=", (short)0).all();

		if (actions != null)
			for (Action ac : actions) {
				if (Core.isNotNull(ac.getPage_descr()))
					lista.put(ac.getId(), ac.getPage_descr());
				else
					lista.put(ac.getId(), ac.getPage());

			}
		// For shared pages, it will add the (dad)
		for (Action ac : aux) {
			if (Core.isNotNull(ac.getPage_descr()))
				lista.put(ac.getId(), ac.getPage_descr() + " [" + ac.getApplication().getDad() + "]");
			else
				lista.put(ac.getId(), ac.getPage() + " [" + ac.getApplication().getDad() + "]");
		}

		return lista;
	}
	
	public String getNomeModulo() {
		return nomeModulo;
	}

	public void setNomeModulo(String nomeModulo) {
		this.nomeModulo = nomeModulo;
	}

	public Action findByPage(String page, String dad) {
		return this.find().andWhere("page", "=",page).andWhere("application.dad", "=",dad).one();
	}

	public short getTipo() {
		return tipo;
	}

	public void setTipo(short tipo) {
		this.tipo = tipo;
	}
	
	public boolean isPublicPage(String appDad, String pageId) {
		boolean flag = false;
		try {
			Application app = new Application().find().andWhere("dad", "=", appDad).one();
			if(app != null) {
				Action action = new Action().find().andWhere("page", "=", pageId).andWhere("application.id", "=", app.getId()).one();
				flag = action != null && action.getTipo() == 1;
			}
		}catch (Exception e) {
			
		}
		return flag;
	}
	
}
