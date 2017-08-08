package nosi.webapps.agenda.dao;

import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Balcao {
	@Expose(serialize = false, deserialize = true)
	private int id;
	private int id_entidade;
	private String fusohorario;
	private String localizacao;
	private String hr_inicio;
	private String hr_fim;
	private int nr_servicos;
	private int confirmacao;
	private String estado;
	private int id_organica;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_entidade() {
		return id_entidade;
	}
	public void setId_entidade(int id_entidade) {
		this.id_entidade = id_entidade;
	}
	public String getFusohorario() {
		return fusohorario;
	}
	public void setFusohorario(String fusohorario) {
		this.fusohorario = fusohorario;
	}
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	public String getHr_inicio() {
		return hr_inicio;
	}
	public void setHr_inicio(String hr_inicio) {
		this.hr_inicio = hr_inicio;
	}
	public String getHr_fim() {
		return hr_fim;
	}
	public void setHr_fim(String hr_fim) {
		this.hr_fim = hr_fim;
	}
	public int getNr_servicos() {
		return nr_servicos;
	}
	public void setNr_servicos(int nr_servicos) {
		this.nr_servicos = nr_servicos;
	}
	public int getConfirmacao() {
		return confirmacao;
	}
	public void setConfirmacao(int confirmacao) {
		this.confirmacao = confirmacao;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getId_organica() {
		return id_organica;
	}
	public void setId_organica(int id_organica) {
		this.id_organica = id_organica;
	}
}
