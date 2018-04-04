package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;
import java.io.Serializable;

@Entity
@Table(name="tbl_rep_template")
public class RepTemplate extends BaseActiveRecord<RepTemplate> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4986692344136748109L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String code;
	@Column(nullable=false)
	private String name;
	@Temporal(TemporalType.DATE)
	private Date dt_created;
	@Temporal(TemporalType.DATE)
	private Date dt_updated;
	private int status;
	
	@ManyToOne
	@JoinColumn(name="user_created_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_USER_CREATED_FK"),nullable=false)
	private User user_created;
	
	@ManyToOne
	@JoinColumn(name="user_updated_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_USER_UPDATED_FK"),nullable=false)
	private User user_updated;	
	
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_ENV_FK"),nullable=false)
	private Application application;
	
	@ManyToOne
	@JoinColumn(name="xml_content_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_XML_CONTENT_FK"),nullable=false)
	private CLob xml_content;
	
	@ManyToOne
	@JoinColumn(name="xsl_content_fk",foreignKey=@ForeignKey(name="REP_TEMPLATE_XSL_CONTENT_FK"),nullable=false)
	private CLob xsl_content;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="reptemplate",fetch=FetchType.EAGER)
	private Set<RepTemplateParam> params;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="repSource",fetch=FetchType.EAGER)
	private Set<RepTemplateSource> reptemplatesources;
	
	public RepTemplate(){}
	
	public RepTemplate(String code, String name, Date dt_created, Date dt_updated, int status,User user_created, User user_updated, Application application,
			CLob xml_content, CLob xsl_content) {
		super();
		this.code = code;
		this.name = name;
		this.dt_created = dt_created;
		this.dt_updated = dt_updated;
		this.status = status;
		this.user_created = user_created;
		this.user_updated = user_updated;
		this.application = application;
		this.xml_content = xml_content;
		this.xsl_content = xsl_content;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDt_created() {
		return dt_created;
	}

	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}

	public Date getDt_updated() {
		return dt_updated;
	}

	public void setDt_updated(Date dt_updated) {
		this.dt_updated = dt_updated;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public User getUser_created() {
		return user_created;
	}

	public void setUser_created(User user_created) {
		this.user_created = user_created;
	}

	public User getUser_updated() {
		return user_updated;
	}

	public void setUser_updated(User user_updated) {
		this.user_updated = user_updated;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public CLob getXml_content() {
		return xml_content;
	}

	public void setXml_content(CLob xml_content) {
		this.xml_content = xml_content;
	}

	public CLob getXsl_content() {
		return xsl_content;
	}

	public void setXsl_content(CLob xsl_content) {
		this.xsl_content = xsl_content;
	}

	public Set<RepTemplateParam> getParams() {
		return params;
	}

	public void setParams(Set<RepTemplateParam> params) {
		this.params = params;
	}

	public Set<RepTemplateSource> getReptemplatesources() {
		return reptemplatesources;
	}

	public void setReptemplatesources(Set<RepTemplateSource> reptemplatesources) {
		this.reptemplatesources = reptemplatesources;
	}

	
}
