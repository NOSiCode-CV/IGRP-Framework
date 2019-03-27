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
	@JoinColumn(name="org_fk", foreignKey=@ForeignKey(name="ORG_ACTIVITE_EXECUTE_FK"))
	private Organization organization;
	
	@ManyToOne
	@JoinColumn(name="prof_fk", foreignKey=@ForeignKey(name="PROF_ACTIVITE_EXECUTE_FK"))
	private ProfileType profile;
	
	@ManyToOne
	@JoinColumn(name="user_fk", foreignKey=@ForeignKey(name="USER_ACTIVITE_EXECUTE_FK"))
	private User user;
	@Enumerated(EnumType.STRING)
	@Column(name="execution_type",nullable=false,length=8)
	private ActivityEcexuteType execution_type;
	@ManyToOne
	@JoinColumn(name="my_custom_permission_fk",nullable=true,foreignKey=@ForeignKey(name="MY_CUSTOM_PERMISSION_EXECUTE_FK"))
	private CustomPermssionTask myCustomPermission;
	
	public ActivityExecute() {
		
	}

	public ActivityExecute(String processid, String taskid, Organization organization, ProfileType profile,
			User user,ActivityEcexuteType execution_type) {
		super();
		this.processid = processid;
		this.taskid = taskid;
		this.organization = organization;
		this.profile = profile;
		this.user = user;
		this.execution_type = execution_type;
	}

	public ActivityExecute(String processid, String taskid, Integer currentOrganization,Integer currentProfile, User currentUser,ActivityEcexuteType execution_type) {
		this.processid = processid;
		this.taskid = taskid;
		this.organization = new Organization().findOne(currentOrganization);
		this.profile = new ProfileType().findOne(currentProfile);
		this.user = currentUser;
		this.execution_type = execution_type;
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

	public CustomPermssionTask getMyCustomPermission() {
		return myCustomPermission;
	}

	public void setMyCustomPermission(CustomPermssionTask myCustomPermission) {
		this.myCustomPermission = myCustomPermission;
	}

	@Override
	public String toString() {
		return "ActivityExecute [id=" + id + ", processid=" + processid + ", taskid=" + taskid + ", organization="
				+ organization + ", profile=" + profile + ", user=" + user + ", execution_type=" + execution_type
				+ ", myCustomPermission=" + myCustomPermission + "]";
	}
	
}
