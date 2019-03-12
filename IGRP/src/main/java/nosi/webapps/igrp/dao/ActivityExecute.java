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
	private Integer processid;
	
	@Column(nullable=false)
	private Integer taskid;
	
	@ManyToOne
	@JoinColumn(name="org_fk", foreignKey=@ForeignKey(name="ORG_ACTIVITE_EXECUTE_FK"))
	private Organization organization;
	
	@ManyToOne
	@JoinColumn(name="prof_fk", foreignKey=@ForeignKey(name="PROF_ACTIVITE_EXECUTE_FK"))
	private ProfileType profile;
	
	@ManyToOne
	@JoinColumn(name="user_fk", foreignKey=@ForeignKey(name="USER_ACTIVITE_EXECUTE_FK"))
	private User user;
	
	public ActivityExecute() {
		
	}

	public ActivityExecute(Integer processid, Integer taskid, Organization organization, ProfileType profile,
			User user) {
		super();
		this.processid = processid;
		this.taskid = taskid;
		this.organization = organization;
		this.profile = profile;
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTaskid() {
		return taskid;
	}

	public void setTaskid(Integer taskid) {
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

	public Integer getProcessid() {
		return processid;
	}

	public void setProcessid(Integer processid) {
		this.processid = processid;
	}
}
