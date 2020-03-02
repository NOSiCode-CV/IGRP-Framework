package nosi.webapps.tutorial.dao;

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
 * 2019-12-11
*/

@Entity
@Table(name="DOCUMENT",schema="PUBLIC")
@NamedQuery(name="Document.findAll", query="SELECT b FROM Document b")
public class Document extends BaseActiveRecord<Document> implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_DOC", nullable=false)
	private Integer idDoc;
	@Temporal(TemporalType.DATE)
	@Column(name="DATA",nullable=true,length=10)
	private Date data;
	@Column(name="DESCRICAO",nullable=true,length=999999999)
	private String descricao;
	@Column(name="RELACIONADOS",nullable=true,length=255)
	private String relacionados;
	@Column(name="TITULO",nullable=false,length=255)
	private String titulo;
	@ManyToOne
	@JoinColumn(name="ID_TYPE", foreignKey=@ForeignKey(name="FOREIGN_KEY_TYPE_ID"), nullable=true)
	private Tipo idType;
	@Column(name="ORDEM",nullable=false,length=255)
	private Integer ordem;

	public Integer getIdDoc() {
		return idDoc;
	}
	public void setIdDoc(Integer idDoc) {
		this.idDoc = idDoc;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
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
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public Integer getOrdem() {
		return ordem;
	}
	public void setOrdem(Integer ordem) {
		this.ordem = ordem;
	}
	
	public Tipo getIdType() {
		return idType;
	}
	public void setIdType(Tipo idType) {
		this.idType = idType;
	}
	
	@Override
		public String getConnectionName() {
			
			return "tutorial_h2_1";
		}
}