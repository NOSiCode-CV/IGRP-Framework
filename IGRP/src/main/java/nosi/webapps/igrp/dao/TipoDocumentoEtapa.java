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
import javax.persistence.Transient;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.gui.components.IGRPLink;

/**
 * Emanuel
 * 11 Apr 2018
 */

@Entity
@Table(name="tbl_tipo_documento_etapa")
public class TipoDocumentoEtapa extends BaseActiveRecord<TipoDocumentoEtapa> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(length=100,nullable=false)
	private String processId;
	@Column(length=4,nullable=false)
	private String tipo;
	@Column(length=100,nullable=false)
	private String taskId;
	private int status;
	private int required;	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "tipo_documento_fk",foreignKey = @ForeignKey(name="TIPO_DOCUEMNTO_ETAPA_TIPO_DOCUMENTO_FK"),nullable=true)
	private TipoDocumento tipoDocumento;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "report_fk",foreignKey = @ForeignKey(name="TIPO_DOCUEMNTO_ETAPA_REPORT_FK"),nullable=true)
	private RepTemplate repTemplate;
	@Transient
	private IGRPLink link;
	
	public TipoDocumentoEtapa(String processId, String taskId,String tipo, int status, int required, TipoDocumento tipoDocumento) {
		super();
		this.tipo = tipo;
		this.processId = processId;
		this.taskId = taskId;
		this.status = status;
		this.required = required;
		this.tipoDocumento = tipoDocumento;
	}

	public TipoDocumentoEtapa() {
		
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public int getRequired() {
		return required;
	}

	public void setRequired(int required) {
		this.required = required;
	}

	public TipoDocumento getTipoDocumento() {
		return tipoDocumento;
	}
	public void setTipoDocumento(TipoDocumento tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	
	public RepTemplate getRepTemplate() {
		return repTemplate;
	}

	public void setRepTemplate(RepTemplate repTemplate) {
		this.repTemplate = repTemplate;
	}


	@Transient
	public IGRPLink getLink() {
		return link;
	}

	public void setLink(IGRPLink link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "TipoDocumentoEtapa [id=" + id + ", processId=" + processId + ", taskId=" + taskId + ", status=" + status
				+ ", tipoDocumento=" + tipoDocumento + "]";
	}
}
