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
 * 25 Mar 2019
 */

@Entity
@Table(name="tbl_task_file")
public class TaskFile extends IGRPBaseActiveRecord<TaskFile> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="clob_fk",foreignKey=@ForeignKey(name="TASK_FILE_CLOB_FK"),nullable=false)
	private CLob clob;	

	@ManyToOne
	@JoinColumn(name="tipo_documento_etapa_fk",foreignKey=@ForeignKey(name="TIPO_DOCUMENTO_ETAPA_CLOB_FK"),nullable=false)
	private TipoDocumentoEtapa tipo_doc_task;

	@Column(name="task_id",nullable=false,length=20)
	private String taskId;
	
	public TaskFile() {
		
	}
	
	public TaskFile(CLob clob, TipoDocumentoEtapa tipo_doc_task,String taskId) {
		super();
		this.clob = clob;
		this.tipo_doc_task = tipo_doc_task;
		this.taskId = taskId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public CLob getClob() {
		return clob;
	}

	public void setClob(CLob clob) {
		this.clob = clob;
	}

	public TipoDocumentoEtapa getTipo_doc_task() {
		return tipo_doc_task;
	}

	public void setTipo_doc_task(TipoDocumentoEtapa tipo_doc_task) {
		this.tipo_doc_task = tipo_doc_task;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	@Override
	public String toString() {
		return "TaskFile [id=" + id + ", clob=" + clob + ", tipo_doc_task=" + tipo_doc_task + ", taskId=" + taskId
				+ "]";
	}

	
}
