package nosi.webapps.agenda.dao;

import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Servicos {
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	private int id_entidade;
	private String nome_servico;
	private String codigo_servico;
	private String estado;
	private String assunto;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getId_entidade() {
		return id_entidade;
	}
	public void setId_entidade(int id_entidade) {
		this.id_entidade = id_entidade;
	}
	public String getNome_servico() {
		return nome_servico;
	}
	public void setNome_servico(String nome_servico) {
		this.nome_servico = nome_servico;
	}
	public String getCodigo_servico() {
		return codigo_servico;
	}
	public void setCodigo_servico(String codigo_servico) {
		this.codigo_servico = codigo_servico;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	
}
