package nosi.core.webapp.import_export_v2.common.serializable.domain;

import java.io.Serializable;

import nosi.webapps.igrp.dao.DomainType;

/**
 * Emanuel
 * 30 Oct 2018
 */
public class DomainSerializable implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String dominio;
	private String valor;
	private String description;
	private String status = "ATIVE";
	private int ordem = 0;
	private DomainType domainType;
	private String dad;
	
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
	public int getOrdem() {
		return ordem;
	}
	public void setOrdem(int ordem) {
		this.ordem = ordem;
	}
	public DomainType getDomainType() {
		return domainType;
	}
	public void setDomainType(DomainType domainType) {
		this.domainType = domainType;
	}

	/**
	 * @return the dad
	 */
	public String getDad() {
		return dad;
	}
	/**
	 * @param dad the dad to set
	 */
	public void setDad(String dad) {
		this.dad = dad;
	}

}
