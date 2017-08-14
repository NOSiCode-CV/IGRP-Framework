package nosi.webapps.agenda.dao;

import com.google.gson.annotations.Expose;

/**
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Agenda {
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	private int id_servico;
	private int id_balcao;
	private int nr_atendimentos;
	private int nr_atend_disponiveis;
	private int nr_atendedores;
	private float tempo_medio;
	private int antecede_edit;
	private int anteced_agenda;
	private String dias_atendimento;
	private String estado;
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
	public int getId_balcao() {
		return id_balcao;
	}
	public void setId_balcao(int id_balcao) {
		this.id_balcao = id_balcao;
	}
	public int getNr_atendimentos() {
		return nr_atendimentos;
	}
	public void setNr_atendimentos(int nr_atendimentos) {
		this.nr_atendimentos = nr_atendimentos;
	}
	public int getNr_atend_disponiveis() {
		return nr_atend_disponiveis;
	}
	public void setNr_atend_disponiveis(int nr_atend_disponiveis) {
		this.nr_atend_disponiveis = nr_atend_disponiveis;
	}
	public int getNr_atendedores() {
		return nr_atendedores;
	}
	public void setNr_atendedores(int nr_atendedores) {
		this.nr_atendedores = nr_atendedores;
	}
	public float getTempo_medio() {
		return tempo_medio;
	}
	public void setTempo_medio(float tempo_medio) {
		this.tempo_medio = tempo_medio;
	}
	public int getAntecede_edit() {
		return antecede_edit;
	}
	public void setAntecede_edit(int antecede_edit) {
		this.antecede_edit = antecede_edit;
	}
	public int getAnteced_agenda() {
		return anteced_agenda;
	}
	public void setAnteced_agenda(int anteced_agenda) {
		this.anteced_agenda = anteced_agenda;
	}
	public String getDias_atendiemnto() {
		return dias_atendimento;
	}
	public void setDias_atendiemnto(String dias_atendimento) {
		this.dias_atendimento = dias_atendimento;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
}
