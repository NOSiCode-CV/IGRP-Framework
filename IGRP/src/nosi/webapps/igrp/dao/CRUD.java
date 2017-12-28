package nosi.webapps.igrp.dao;

import java.io.Serializable;

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

/**
 * Emanuel
 * 8 Dec 2017
 */

@Entity
@Table(name="tbl_crud")
public class CRUD extends BaseActiveRecord<CRUD> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private String tableName;
	@Column(nullable=false)
	private String schemaName;
	@ManyToOne
	@JoinColumn(name="config_env_fk",foreignKey=@ForeignKey(name="CRUD_CONFIG_ENV_FK"),nullable=true)
	private Config_env config_env;
	
	public CRUD() {
		
	}
	public CRUD(String tableName, String schemaName, Config_env config_env) {
		super();
		this.tableName = tableName;
		this.schemaName = schemaName;
		this.config_env = config_env;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getSchemaName() {
		return schemaName;
	}
	public void setSchemaName(String schemaName) {
		this.schemaName = schemaName;
	}
	public Config_env getConfig_env() {
		return config_env;
	}
	public void setConfig_env(Config_env config_env) {
		this.config_env = config_env;
	}
	
	
}
