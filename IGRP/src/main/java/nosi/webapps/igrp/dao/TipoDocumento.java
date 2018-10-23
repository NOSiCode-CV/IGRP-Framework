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
 * 11 Apr 2018
 */

@Entity
@Table(name="tbl_tipo_documento")
public class TipoDocumento extends IGRPBaseActiveRecord<TipoDocumento> implements Serializable{
	
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer id;
	@Column(length=100,nullable=false)
	private String nome;
	private int status;
	@Column(length=500)
	private String descricao;
	@Column(length=50)
	private String codigo;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "env_fk",foreignKey = @ForeignKey(name="TIPO_DOCUEMNTO_ENV_FK"),nullable=false)
	private Application application;
	
	
	
	public TipoDocumento(String nome, int status, String descricao, String codigo,
			Application application) {
		super();
		this.nome = nome;
		this.status = status;
		this.descricao = descricao;
		this.codigo = codigo;
		this.application = application;
	}

	public TipoDocumento() {
		
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	 public TipoDocumento getTipoDcumento(String codigo,String dad) {
		 return this.find().andWhere("codigo", "=",codigo).andWhere("application.dad", "=",dad).one();
	 }
	 
	@Override
	public String toString() {
		return "TipoDocumento [id=" + id + ", nome=" + nome + ", status=" + status + ", descricao="
				+ descricao + ", codigo=" + codigo + "]";
	}
}
