package nosi.webapps.agenda.dao;

import com.google.gson.annotations.Expose;

/**
 * Isaias.Nunes
 * Aug 25, 2017
 */
public class Horario_Atendimento {
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	private int id_agenda;
	private String estado;
	private String horario;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getId_agenda() {
		return id_agenda;
	}
	public void setId_agenda(int id_agenda) {
		this.id_agenda = id_agenda;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	
}
