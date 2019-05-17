package nosi.webapps.igrp.dao;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

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
import javax.persistence.Transient;
import nosi.core.webapp.Core;

/**
 * Emanuel
 * 9 May 2018
 */

@Entity
@Table(name="tbl_task_access")
public class TaskAccess extends IGRPBaseActiveRecord<TaskAccess> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "org_fk",foreignKey = @ForeignKey(name="TASK_ACCESS_ORGANIZATION_FK"),nullable=false)
	private Organization organization;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "prof_fk",foreignKey = @ForeignKey(name="TASK_ACCESS_PROFILE_TYPE_FK"))
	private ProfileType profileType;
	private Integer user_fk;
	@Column(length=100)
	private String taskName;
	@Column(length=150)
	private String processName;	
	private String taskDescription;
	
	@Transient
	private String taskId;
	
	public TaskAccess() {
		super();
	}
	
	
	public TaskAccess(Organization organization, ProfileType profileType, Integer user_fk, String taskName,
			String processName, String taskDescription, String taskId) {
		super();
		this.organization = organization;
		this.profileType = profileType;
		this.user_fk = user_fk;
		this.taskName = taskName;
		this.processName = processName;
		this.taskDescription = taskDescription;
		this.taskId = taskId;
	}


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public ProfileType getProfileType() {
		return profileType;
	}
	public void setProfileType(ProfileType profileType) {
		this.profileType = profileType;
	}
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public String getProcessName() {
		return processName;
	}
	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public Integer getUser_fk() {
		return user_fk;
	}

	public void setUser_fk(Integer user_fk) {
		this.user_fk = user_fk;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
	public String getTaskDescription() {
		return taskDescription;
	}

	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	
	
	public List<TaskAccess> getTaskAccess(){
		return new TaskAccess().find()
			   	.andWhere("organization", "=",Core.getCurrentOrganization())
			   	.andWhere("profileType", "=",Core.getCurrentProfile())
			   	.all();		
	}
	
	public List<TaskAccess> getTaskAccess(String processKey){
		return new TaskAccess().find()
			   	.where("organization", "=",Core.getCurrentOrganization())
			   	.andWhere("profileType", "=",Core.getCurrentProfile())
			   	.andWhere("processName","=",processKey)
			   	.all();		
	}
	
	@Override
	public String toString() {
		return "TaskAccess [id=" + id + ", organization=" + organization + ", profileType=" + profileType
				+ ", taskName=" + taskName + ", processName=" + processName + "]";
	}


	public List<String> getMyProcessNames() {
		return this.getTaskAccess().stream().map(TaskAccess::getProcessName).collect(Collectors.toList());
	}
}
