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
import javax.persistence.Transient;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.ResultSet;

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

	public List<TaskAccess> getCurrentMyTaskAccess(){
		return new TaskAccess().find()
			   	.andWhere("organization", "=",Core.getCurrentOrganization())
			   	.andWhere("profileType", "=",Core.getCurrentProfile())
		   		.andWhere("user_fk", "=",Core.getCurrentUser().getId())
		   		.all();	
	}
	
	public List<TaskAccess> getCurrentTaskUnassigned(){
		List<TaskAccess> list = new ArrayList<>();
		ResultSet.Record r = Core.query(this.getConnectionName(),"SELECT id, noAssumed, processKey, taskId, taskKey, user_fk FROM tbl_task_unassigned")
								 .where("noAssumed=true")
								 .getRecordList();
		r.RowList.forEach(row->{
			TaskAccess t = new TaskAccess();
			t.setProcessName(row.getString("processKey"));
			t.setTaskName(row.getString("taskKey"));
			t.setTaskId(row.getString("taskId"));
			list.add(t);
		});
		return list;
	}
	
	public List<TaskAccess> getCurrentAvailableTaskAccess(){
		return new TaskAccess().find()
			   	.andWhere("organization", "=",Core.getCurrentOrganization())
			   	.andWhere("profileType", "=",Core.getCurrentProfile())
		   		.andWhere("user_fk", "isnull")
			   	.all();		
	}
	
	public List<TaskAccess> getCurrentAllTaskAccess(){
		List<TaskAccess> list = new ArrayList<>();
		list.addAll(this.getCurrentAvailableTaskAccess());
		list.addAll(this.getCurrentMyTaskAccess());
		return list;		
	}
	
	@Override
	public String toString() {
		return "TaskAccess [id=" + id + ", organization=" + organization + ", profileType=" + profileType
				+ ", taskName=" + taskName + ", processName=" + processName + "]";
	}
}
