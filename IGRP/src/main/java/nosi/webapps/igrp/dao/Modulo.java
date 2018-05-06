package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.ArrayList;
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

import nosi.base.ActiveRecord.BaseActiveRecord;

/**
 * Iekiny Marcel
 * May 3, 2018
 */
@Entity
@Table(name="tbl_modulo")
public class Modulo extends BaseActiveRecord<Modulo> implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable=false)
	private String name;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_fk",foreignKey = @ForeignKey(name="env_fk"), nullable=false)
	private Application application;

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

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}
	
	public List<Modulo> getModuloByApp(int appId){
		List<Modulo> l = new ArrayList<Modulo>();
		l = this.find().andWhere("application.id", "=", appId).all();
		return l;

	}

	@Override
	public String toString() {
		return "Modulo [id=" + id + ", name=" + name + ", application=" + application + "]";
	}
}
