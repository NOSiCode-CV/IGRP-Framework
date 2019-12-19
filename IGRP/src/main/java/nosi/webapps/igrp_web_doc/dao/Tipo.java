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

/**
 * @author: IGRP SysAdmin
 * 2019-10-31
*/

@Entity
@Table(name="tipo",schema="public")
@NamedQuery(name="Tipo.findAll", query="SELECT b FROM Tipo b")
public class Tipo extends BaseActiveRecord<Tipo> implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id_tipo", nullable=false)
	private Integer idTipo;
	@Column(name="nome",nullable=false)
	private String nome;
    @Column(name="descricao",nullable=false)
	private String descricao;

	public Integer getIdTipo() {
		return idTipo;
	}
	public void setIdTipo(Integer idTipo) {
		this.idTipo = idTipo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
  
  	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
