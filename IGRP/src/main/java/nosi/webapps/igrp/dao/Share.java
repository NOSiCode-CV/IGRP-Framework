package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
/**
 * Iekiny Marcel
 * Mar 9, 2018
 */
@Entity
@Table(name="glb_t_acl")
public class Share extends IGRPBaseActiveRecord<Share> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_fk")
	private Application env;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_owner_fk")
	private Application owner;
	
	private String type;
	private int type_fk;
	private int status;
	
	private String processKey; 
	private String taskKey; 
	
	public enum TYPE{
		 PAGE, WORKFLOW, SERVICE, REPORT, TRANS 
	}

   public Share() {
		super();
	}

	public Share(Application env, Application owner, String type, int type_fk, int status) {
		super();
		this.env = env;
		this.owner = owner;
		this.type = type;
		this.type_fk = type_fk;
		this.status = status;
	}

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
	
	public List<Share> getAllSharedResources(int appOrigem, int appDestino, String type){
		List<Share> results = new ArrayList<>();
		results = this.find().andWhere("owner.id", "=", appOrigem)
				.andWhere("env.id", "=", appDestino)
				.andWhere("type", "=", type)
				.all();
		return results;
	}
	
	public boolean getPermissionPage(String dad,String app, Integer action) {
		Long s= new Share().find()
			.where("env.dad", "=", dad)
			.andWhere("owner.dad", "=",app)
			.andWhere("type_fk", "=",action)
			.andWhere("type", "=", "PAGE")
			.andWhere("status", "=", 1)
			.getCount();
		return s>0;
	}
	public boolean isTransactionShared(Integer transactionId,Integer appId, Integer appIdOwner) {
		if(transactionId==null)
			return false;
		return new Share().find()
				.andWhere("type_fk", "=", transactionId)
				.andWhere("status", "=", 1)
				.andWhere("env.id", "=", appId)
				.andWhere("owner.id", "=", appIdOwner)
				.one()!=null;
	}

	public String getProcessKey() {
		return processKey;
	}

	public void setProcessKey(String processKey) {
		this.processKey = processKey;
	}

	public String getTaskKey() {
		return taskKey;
	}

	public void setTaskKey(String taskKey) {
		this.taskKey = taskKey;
	}

	@Override
	public String toString() {
		return "Share [id=" + id + ", env=" + env + ", owner=" + owner + ", type=" + type + ", type_fk=" + type_fk
				+ ", status=" + status + ", processKey=" + processKey + ", taskKey=" + taskKey + "]";
	}
}
