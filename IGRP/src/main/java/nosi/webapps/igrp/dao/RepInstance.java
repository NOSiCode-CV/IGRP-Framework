package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import nosi.base.ActiveRecord.BaseActiveRecord;

@Entity
@Table(name="tbl_rep_instance")
public class RepInstance extends IGRPBaseActiveRecord<RepInstance> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6038086276230437820L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name="rep_template_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_REP_TEMPLATE_FK"),nullable=true)
	private RepTemplate template;
	@Column(nullable=false)
	private String contra_prova;
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dt_created;
	private String reference;
	private int ref_fk;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_ENV_FK"),nullable=false)
	private Application application;

	@ManyToOne
	@JoinColumn(name="xml_content_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_XML_CONTENT_FK"),nullable=false)
	private CLob xml_content;
	
	@ManyToOne
	@JoinColumn(name="xsl_content_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_XSL_CONTENT_FK"),nullable=false)
	private CLob xsl_content;
	
	@ManyToOne
	@JoinColumn(name="user_fk",foreignKey=@ForeignKey(name="REP_INSTANCE_USER_FK"))
	private User user;

	public RepInstance(){}
	
	public RepInstance(RepTemplate template, String contra_prova, Date dt_created, String reference,
			int ref_fk, Application application, CLob xml_content, CLob xsl_content, User user) {
		super();
		this.template = template;
		this.contra_prova = contra_prova;
		this.dt_created = dt_created;
		this.reference = reference;
		this.ref_fk = ref_fk;
		this.application = application;
		this.xml_content = xml_content;
		this.xsl_content = xsl_content;
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public RepTemplate getTemplate() {
		return template;
	}

	public void setTemplate(RepTemplate template) {
		this.template = template;
	}

	public String getContra_prova() {
		return contra_prova;
	}

	public void setContra_prova(String contra_prova) {
		this.contra_prova = contra_prova;
	}

	public Date getDt_created() {
		return dt_created;
	}

	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public int getRef_fk() {
		return ref_fk;
	}

	public void setRef_fk(int ref_fk) {
		this.ref_fk = ref_fk;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}