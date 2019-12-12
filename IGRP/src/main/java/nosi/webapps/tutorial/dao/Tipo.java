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

/**
 * @author: IGRP SysAdmin
 * 2019-12-11
*/

@Entity
@Table(name="TIPO",schema="PUBLIC")
@NamedQuery(name="Tipo.findAll", query="SELECT b FROM Tipo b")
public class Tipo extends BaseActiveRecord<Tipo> implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_TIPO", nullable=false)
	private Integer idTipo;
	@Column(name="DESCRICAO",nullable=false,length=255)
	private String descricao;
	@Column(name="NOME",nullable=false,length=255)
	private String nome;

	public Integer getIdTipo() {
		return idTipo;
	}
	public void setIdTipo(Integer idTipo) {
		this.idTipo = idTipo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
}