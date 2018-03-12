package nosi.webapps.igrp.dao;

import java.io.Serializable;

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
 * Mar 9, 2018
 */
@Entity
@Table(name="glb_t_acl")
public class Share extends BaseActiveRecord<Application> implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_fk")
	private Application env;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_owner_fk")
	private Application owner;
	
	private String type; // PAGE|WORKFLOW|SERVICE|REPORT 
	private int type_fk;
	private int status;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Application getEnv() {
		return env;
	}
	
	public void setEnv(Application env) {
		this.env = env;
	}
	
	public Application getOwner() {
		return owner;
	}
	
	public void setOwner(Application owner) {
		this.owner = owner;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public int getType_fk() {
		return type_fk;
	}
	
	public void setType_fk(int type_fk) {
		this.type_fk = type_fk;
	}
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Share [id=" + id + ", env=" + env + ", owner=" + owner + ", type=" + type + ", type_fk=" + type_fk
				+ ", status=" + status + "]";
	}
	
}
