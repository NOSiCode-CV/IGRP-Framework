package nosi.webapps.igrp.services.rest.pesquisa_cae.pojo;


/**
 * Emanuel
 * 10 Apr 2019
 */
public class Cae {

	private Integer id;
	private String codigo;
	private String descricao;

	public Cae() {
		
	}
	public Integer getId() {
		return id;
	}

	public String getCodigo() {
		return codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	@Override
	public String toString() {
		return "Entry [id=" + id + ", codigo=" + codigo + ", descricao=" + descricao + "]";
	}
	
}
