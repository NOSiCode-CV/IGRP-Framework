package nosi.webapps.igrp.dao;

import java.io.Serializable;
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
 * Emanuel
 * 4 Sep 2018
 */

@Table(name="tbl_task_unassigned")
@Entity
public class TaskUnassigned extends IGRPBaseActiveRecord<TaskUnassigned> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 591450994687656212L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable=false,length=50)
	private String taskId;
	
	@Column(nullable=false,length=150)
	private String processKey;
	
	@Column(nullable=false,length=150)
	private String taskKey;

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "user_fk",foreignKey = @ForeignKey(name="USER_TASK_UNASSIGNED_FK"),nullable=false)
	private User user;
	@Column(nullable=false)
	private boolean noAssumed = true;

	public TaskUnassigned(String taskId, String processKey, String taskKey, User user) {
		super();
		this.taskId = taskId;
		this.processKey = processKey;
		this.taskKey = taskKey;
		this.user = user;
	}

	public TaskUnassigned() {
		super();
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isNoAssumed() {
		return noAssumed;
	}

	public void setNoAssumed(boolean noAssumed) {
		this.noAssumed = noAssumed;
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
}
