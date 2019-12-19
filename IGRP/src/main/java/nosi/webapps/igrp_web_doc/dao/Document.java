package nosi.webapps.igrp_web_doc.dao;

import nosi.base.ActiveRecord.BaseActiveRecord;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.ForeignKey;

/**
 * @author: IGRP SysAdmin
 * 2019-10-31
*/

@Entity
@Table(name="document",schema="public")
@NamedQuery(name="Document.findAll", query="SELECT b FROM Document b")
public class Document extends BaseActiveRecord<Document> implements Serializable{

	private static final long serialVersionUID = 1L;

	@Column(name="titulo",nullable=false)
	private String titulo;
	@Column(name="descricao",nullable=false)
	private String descricao;
	@Column(name="relacionados",nullable=true)
	private String relacionados;
	@Temporal(TemporalType.DATE)
	@Column(name="data",nullable=true,length=13)
	private Date data;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_doc", nullable=false)
	private Integer idDoc;
	@ManyToOne
	@JoinColumn(name="id_type", foreignKey=@ForeignKey(name="foreign_key_type_id"), nullable=true)
	private Tipo tipo;

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getRelacionados() {
		return relacionados;
	}
	public void setRelacionados(String relacionados) {
		this.relacionados = relacionados;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Integer getIdDoc() {
		return idDoc;
	}
	public void setIdDoc(Integer idDoc) {
		this.idDoc = idDoc;
	}
	public Tipo getTipo() {
		return tipo;
	}
	public void setTipo(Tipo tipo) {
		this.tipo = tipo;
	}
}
