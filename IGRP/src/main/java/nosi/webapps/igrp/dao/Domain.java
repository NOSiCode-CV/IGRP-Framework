package nosi.webapps.igrp.dao;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Emanuel
 * 27 Mar 2018
 */
@Entity
@Table(name="tbl_domain")
public class Domain extends IGRPBaseActiveRecord<Domain> implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false, length=50)
	private String dominio;
	@Column(nullable=false, length=50)
	private String valor;
	@Column(nullable=false, length=100)
	private String description;
	@Column(nullable=false, length=8)
	private String status = "ATIVE";
	@Column(nullable=false, length=2)
	private int ordem = 0;

	public Domain(String dominio, String valor, String description, String status, int ordem) {
		super();
		this.dominio = dominio;
		this.valor = valor;
		this.description = description;
		this.status = status;
		this.ordem = ordem;
	}

	public Domain() {
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDominio() {
		return dominio;
	}
	public void setDominio(String dominio) {
		this.dominio = dominio;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getordem() {
		return ordem;
	}
	public void setordem(int ordem) {
		this.ordem = ordem;
	}
		
}
