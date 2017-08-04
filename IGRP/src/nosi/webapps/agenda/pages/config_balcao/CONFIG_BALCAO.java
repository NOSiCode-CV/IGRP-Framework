/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.config_balcao;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class CONFIG_BALCAO extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_balcao")
	private String balcao;
	@RParam(rParamName = "p_localizacao")
	private String localizacao;
	@RParam(rParamName = "p_fuso_horario")
	private String fuso_horario;
	@RParam(rParamName = "p_escolher_hora")
	private String escolher_hora;
	@RParam(rParamName = "p_nr_de_servicos_por_agendamento")
	private String nr_de_servicos_por_agendamento;
	@RParam(rParamName = "p_hora_inicio")
	private String hora_inicio;
	@RParam(rParamName = "p_hora_fim")
	private String hora_fim;
	@RParam(rParamName = "p_confirmacao_automatica")
	private String confirmacao_automatica;
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setBalcao(String balcao){
		this.balcao = balcao;
	}
	public String getBalcao(){
		return this.balcao;
	}
	
	public void setLocalizacao(String localizacao){
		this.localizacao = localizacao;
	}
	public String getLocalizacao(){
		return this.localizacao;
	}
	
	public void setFuso_horario(String fuso_horario){
		this.fuso_horario = fuso_horario;
	}
	public String getFuso_horario(){
		return this.fuso_horario;
	}
	
	public void setEscolher_hora(String escolher_hora){
		this.escolher_hora = escolher_hora;
	}
	public String getEscolher_hora(){
		return this.escolher_hora;
	}
	
	public void setNr_de_servicos_por_agendamento(String nr_de_servicos_por_agendamento){
		this.nr_de_servicos_por_agendamento = nr_de_servicos_por_agendamento;
	}
	public String getNr_de_servicos_por_agendamento(){
		return this.nr_de_servicos_por_agendamento;
	}
	
	public void setHora_inicio(String hora_inicio){
		this.hora_inicio = hora_inicio;
	}
	public String getHora_inicio(){
		return this.hora_inicio;
	}
	
	public void setHora_fim(String hora_fim){
		this.hora_fim = hora_fim;
	}
	public String getHora_fim(){
		return this.hora_fim;
	}
	
	public void setConfirmacao_automatica(String confirmacao_automatica){
		this.confirmacao_automatica = confirmacao_automatica;
	}
	public String getConfirmacao_automatica(){
		return this.confirmacao_automatica;
	}


}
/*-------------------------*/