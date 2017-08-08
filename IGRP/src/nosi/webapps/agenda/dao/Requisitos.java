package nosi.webapps.agenda.dao;

import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Requisitos {
	@Expose(serialize = false, deserialize = true)
	private int id;
	private int id_servico;
	private String tipo_servico;
	private int id_doc_igrp;
	private String descritivo;
	private int estado;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_servico() {
		return id_servico;
	}
	public void setId_servico(int id_servico) {
		this.id_servico = id_servico;
	}
	public String getTipo_servico() {
		return tipo_servico;
	}
	public void setTipo_servico(String tipo_servico) {
		this.tipo_servico = tipo_servico;
	}
	public int getId_doc_igrp() {
		return id_doc_igrp;
	}
	public void setId_doc_igrp(int id_doc_igrp) {
		this.id_doc_igrp = id_doc_igrp;
	}
	public String getDescritivo() {
		return descritivo;
	}
	public void setDescritivo(String descritivo) {
		this.descritivo = descritivo;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}	
	
}
