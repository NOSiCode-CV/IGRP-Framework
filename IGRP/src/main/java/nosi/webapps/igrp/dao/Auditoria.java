package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Iekiny Marcel
 * May 17, 2019
 */
@Entity
@Table(name = "tbl_auditoria") 
public class Auditoria extends IGRPBaseActiveRecord<Auditoria> implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; 
	
	@Column(name = "table_name")
	private String tableName; 
	
	@Column(name = "table_id")
	private String tableId;
	
	@Column(name = "xml_old", columnDefinition = "text")
	private String xmlOld; 
	
	@Column(name = "xml_new", columnDefinition = "text")
	private String xmlNew; 
	
	@Column(name = "user_ip")
	private String userIp; 
	
	@Column(name = "user_context")
	private String userContext;
	
	@Column(name = "user_id")
	private String userId; 
	
	@Column(name = "action")
	private String action; 
	
	@Column(name = "date_action")
	private Date dateAction; 
	
	@Column(name = "env")
	private String env; 
	
	@Column(name = "sessid")
	private String sessId;

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

	public String getTableId() {
		return tableId;
	}

	public void setTableId(String tableId) {
		this.tableId = tableId;
	}

	public String getXmlOld() {
		return xmlOld;
	}

	public void setXmlOld(String xmlOld) {
		this.xmlOld = xmlOld;
	}

	public String getXmlNew() {
		return xmlNew;
	}

	public void setXmlNew(String xmlNew) {
		this.xmlNew = xmlNew;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	public String getUserContext() {
		return userContext;
	}

	public void setUserContext(String userContext) {
		this.userContext = userContext;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Date getDateAction() {
		return dateAction;
	}

	public void setDateAction(Date dateAction) {
		this.dateAction = dateAction;
	}

	public String getEnv() {
		return env;
	}

	public void setEnv(String env) {
		this.env = env;
	}

	public String getSessId() {
		return sessId;
	}

	public void setSessId(String sessId) {
		this.sessId = sessId;
	} 
	
}
