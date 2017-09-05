package nosi.webapps.igrp.dao;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;

/**
 * @author: Emanuel Pereira
 * 4 Sep 2017
 */
@Entity
@Table(name="tbl_current_config")
public class CurrentConfig  extends BaseActiveRecord<CurrentConfig> implements Serializable {

	private static final long serialVersionUID = -2363727513490936688L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private String application;
	@Column(nullable=false)
	private Integer organization;
	@Column(nullable=false)
	private Integer perfil;
	
	public CurrentConfig() {
		// TODO Auto-generated constructor stub
	}
	
	public CurrentConfig(String application, Integer organization, Integer perfil) {
		super();
		this.application = application;
		this.organization = organization;
		this.perfil = perfil;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getApplication() {
		return application;
	}
	public void setApplication(String application) {
		this.application = application;
	}
	public Integer getOrganization() {
		return organization;
	}
	public void setOrganization(Integer organization) {
		this.organization = organization;
	}
	public Integer getPerfil() {
		return perfil;
	}
	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}
	@Override
	public String getConnectionName() {
		return "hibernate-igrp-config";
	}

	@Override
	public String toString() {
		return "CurrentConfig [id=" + id + ", application=" + application + ", organization=" + organization
				+ ", perfil=" + perfil + "]";
	}
	
	
}