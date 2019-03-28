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
 * 27 Mar 2019
 */

@Entity
@Table(name="tbl_custom_permission_task")
public class CustomPermssionTask extends IGRPBaseActiveRecord<CustomPermssionTask> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="user_fk",nullable=false,foreignKey=@ForeignKey(name="CUSTOM_PERMISSION_TASK_USER_FK"))
	private User user;
	
	@Column(name="my_custom_permission",nullable=false,columnDefinition = "text")
	private String customPermission;

	public CustomPermssionTask() {
		
	}
	
	public CustomPermssionTask(User user, String myCustomPermission) {
		super();
		this.user = user;
		this.customPermission = myCustomPermission;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCustomPermission() {
		return customPermission;
	}

	public void setCustomPermission(String customPermission) {
		this.customPermission = customPermission;
	}

	@Override
	public String toString() {
		return "CustomPermssionTask [id=" + id + ", user=" + user + ", customPermission=" + customPermission + "]";
	}
	
	
}
