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
	@Column(nullable=false)
	private String taskId;
	@Column(nullable=false)
	private String processId;
	@Column(nullable=false)
	private String codigo;
	private short ordem;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "action_fk",foreignKey = @ForeignKey(name="ACTION_COMPONENT_FK"),nullable=false)
	private Action action;
	private String title;	
	
	public TaskComponent(String taskId, String processId, String codigo, short ordem, Action action, String title) {
		super();
		this.taskId = taskId;
		this.processId = processId;
		this.codigo = codigo;
		this.ordem = ordem;
		this.action = action;
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

	public String getProcessId() {
		return processId;
	}

	public void setProcessId(String processId) {
		this.processId = processId;
	}

	@Override
	public String toString() {
		return "TaskComponent [id=" + id + ", taskId=" + taskId + ", processId=" + processId + ", codigo=" + codigo
				+ ", ordem=" + ordem + ", action=" + action + ", title=" + title + "]";
	}
}
