package nosi.webapps.igrp.dao;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import nosi.core.webapp.Core;


/**
 * Emanuel
 * 5 Mar 2019
 */

@Entity
@Table(name="tbl_activity_execute")
public class ActivityExecute extends IGRPBaseActiveRecord<ActivityExecute> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(nullable=false)
	private String processid;
	
	@Column(nullable=false)
	private String taskid;
	
	@ManyToOne
	@JoinColumn(name="env_fk", foreignKey=@ForeignKey(name="ENV_ACTIVITE_EXECUTE_FK"),nullable=false)
	private Application application;
	
	@ManyToOne
	@JoinColumn(name="org_fk", foreignKey=@ForeignKey(name="ORG_ACTIVITE_EXECUTE_FK"),nullable=false)
	private Organization organization;
	
	@ManyToOne
	@JoinColumn(name="prof_fk", foreignKey=@ForeignKey(name="PROF_ACTIVITE_EXECUTE_FK"),nullable=false)
	private ProfileType profile;
	
	@ManyToOne
	@JoinColumn(name="user_fk", foreignKey=@ForeignKey(name="USER_ACTIVITE_EXECUTE_FK"))
	private User user;
	
	@Enumerated(EnumType.STRING)
	@Column(name="execution_type",nullable=false,length=400)
	private ActivityEcexuteType execution_type;
	
	@Column(name="custom_permission",nullable=true,columnDefinition = "text")
	private String customPermission;
	
	@Column(name="proccess_key",nullable=false,length=200)
	private String proccessKey;
	
	@Column(name="task_key",nullable=false,length=200)
	private String taskKey;
	
	public ActivityExecute() {
		
	}

	public ActivityExecute(String processid, String taskid,Application application, Organization organization, ProfileType profile,
			User user,ActivityEcexuteType execution_type) {
		super();
		this.processid = processid;
		this.taskid = taskid;
		this.application = application;
		this.organization = organization;
		this.profile = profile;
		this.user = user;
		this.execution_type = execution_type;
	}

	public ActivityExecute(String processid, String taskid,String dad, Integer currentOrganization,Integer currentProfile, User currentUser,ActivityEcexuteType execution_type,String proccessKey,String taskKey) {
		this.processid = processid;
		this.taskid = taskid;
		this.application = Core.findApplicationByDad(dad);
		this.organization = new Organization().findOne(currentOrganization);
		this.profile = new ProfileType().findOne(currentProfile);
		this.user = currentUser;
		this.execution_type = execution_type;
		this.proccessKey = proccessKey;
		this.taskKey = taskKey;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTaskid() {
		return taskid;
	}

	public void setTaskid(String taskid) {
		this.taskid = taskid;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public ProfileType getProfile() {
		return profile;
	}

	public void setProfile(ProfileType profile) {
		this.profile = profile;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getProcessid() {
		return processid;
	}

	public void setProcessid(String processid) {
		this.processid = processid;
	}
	
	public ActivityEcexuteType getExecution_type() {
		return execution_type;
	}

	public void setExecution_type(ActivityEcexuteType execution_type) {
		this.execution_type = execution_type;
	}

	public String getCustomPermission() {
		return customPermission;
	}

	public void setCustomPermission(String customPermission) {
		this.customPermission = customPermission;
	}

	public String getProccessKey() {
		return proccessKey;
	}

	public void setProccessKey(String proccessKey) {
		this.proccessKey = proccessKey;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public String getTaskKey() {
		return taskKey;
	}

	public void setTaskKey(String taskKey) {
		this.taskKey = taskKey;
	}

	@Override
	public String toString() {
		return "ActivityExecute [id=" + id + ", processid=" + processid + ", taskid=" + taskid + ", organization="
				+ organization + ", profile=" + profile + ", user=" + user + ", execution_type=" + execution_type
				+ ", myCustomPermission=" + customPermission + "]";
	}
	
}
