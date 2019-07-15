package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

import nosi.core.webapp.Core;


@Entity
@Table(name="tbl_clob")
public class CLob extends IGRPBaseActiveRecord<CLob> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8421542320870086918L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	private String name;
	
	private String mime_type;
	
	@Column(nullable=false)
	@Lob
	@Type(type="org.hibernate.type.BinaryType")
	private byte[] c_lob_content;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date dt_created;
	@ManyToOne
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="CLOB_ENV_FK"),nullable=true)
	private Application application;

	@ManyToOne
	@JoinColumn(name="env_updated_fk",foreignKey=@ForeignKey(name="CLOB_ENV_UPDATED_FK"),nullable=true)
	private Application application_updated;
	
	@Temporal(TemporalType.DATE)
	private Date dt_updated;
	@ManyToOne
	@JoinColumn(name="user_created_fk",foreignKey=@ForeignKey(name="CLOB_USER_CREATED_FK"),nullable=true)
	private User user = Core.getCurrentUser(); 
	
	
	private String estado = "A"; // A -> Ativo; I -> InAtivo  
	
	public CLob(){}
	
	public CLob(String name, String mime_type, byte[] c_lob_content, Date dt_created,Application application) {
		super();
		this.name = name;
		this.mime_type = mime_type;
		this.c_lob_content = c_lob_content;
		this.dt_created = dt_created;
		this.application = application;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getMime_type() {
		return mime_type;
	}
	
	public void setMime_type(String mime_type) {
		this.mime_type = mime_type;
	}
	
	public byte[] getC_lob_content() {
		return c_lob_content;
	}
	
	public void setC_lob_content(byte[] c_lob_content) {
		this.c_lob_content = c_lob_content;
	}
	
	public Date getDt_created() {
		return dt_created;
	}
	
	public void setDt_created(Date dt_created) {
		this.dt_created = dt_created;
	}
	
	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	
	public Application getApplication_updated() {
		return application_updated;
	}

	public void setApplication_updated(Application application_updated) {
		this.application_updated = application_updated;
	}

	public Date getDt_updated() {
		return dt_updated;
	}

	public void setDt_updated(Date dt_updated) {
		this.dt_updated = dt_updated;
	}

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "CLob [id=" + id + ", name=" + name + ", mime_type=" + mime_type + ", c_lob_content="
				+ Arrays.toString(c_lob_content) + ", dt_created=" + dt_created + ", application=" + application
				+ ", application_updated=" + application_updated + ", dt_updated=" + dt_updated + ", user=" + user
				+ ", estado=" + estado + "]";
	}
	
	public void invalidate() {
		if(!this.estado.equals("I")) 
			this.estado = "I";
	}
	
}
