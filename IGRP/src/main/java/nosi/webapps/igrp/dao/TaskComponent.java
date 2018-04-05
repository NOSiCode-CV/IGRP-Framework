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
 * 5 Apr 2018
 */

@Entity
@Table(name="tbl_task_component")
public class TaskComponent extends BaseActiveRecord<TaskComponent> implements Serializable{

	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(unique=true,nullable=false)
	private String codigo;
	private short ordem;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "action_fk",foreignKey = @ForeignKey(name="ACTION_COMPONENT_FK"),nullable=false)
	private Action action;
	private String taskId;
	private String title;
	
	public TaskComponent(short ordem,String taskId,String codigo,String title, Action action) {
		super();
		this.ordem = ordem;
		this.action = action;
		this.taskId = taskId;
		this.codigo = codigo;
		this.title = title;
	}
	
	public TaskComponent() {
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public short getOrdem() {
		return ordem;
	}
	public void setOrdem(short ordem) {
		this.ordem = ordem;
	}
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "TaskComponent [id=" + id + ", codigo=" + codigo + ", ordem=" + ordem + ", action=" + action
				+ ", taskId=" + taskId + ", title=" + title + "]";
	}

	
}
