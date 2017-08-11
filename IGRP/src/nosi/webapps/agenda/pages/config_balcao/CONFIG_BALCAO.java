/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.config_balcao;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class CONFIG_BALCAO extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_entidade")
	private int entidade;
	@RParam(rParamName = "p_localizacao")
	private String localizacao;
	@RParam(rParamName = "p_fuso_horario")
	private String fuso_horario;
	@RParam(rParamName = "p_nr_servicos")
	private int nr_servicos;
	@RParam(rParamName = "p_confirmacao")
	private int confirmacao;
	@RParam(rParamName = "p_horario_de_atendimento")
	private String horario_de_atendimento;
	@RParam(rParamName = "p_hr_inicio")
	private String hr_inicio;
	@RParam(rParamName = "p_hr_fim")
	private String hr_fim;
	@RParam(rParamName = "p_id")
	private int p_id;
	@RParam(rParamName = "p_estado")
	private String p_estado;
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setEntidade(int entidade){
		this.entidade = entidade;
	}
	public int getEntidade(){
		return this.entidade;
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
	
	public void setNr_servicos(int nr_servicos){
		this.nr_servicos = nr_servicos;
	}
	public int getNr_servicos(){
		return this.nr_servicos;
	}
	
	public void setConfirmacao(int confirmacao){
		this.confirmacao = confirmacao;
	}
	public int getConfirmacao(){
		return this.confirmacao;
	}
	
	public void setHorario_de_atendimento(String horario_de_atendimento){
		this.horario_de_atendimento = horario_de_atendimento;
	}
	public String getHorario_de_atendimento(){
		return this.horario_de_atendimento;
	}
	
	public void setHr_inicio(String hr_inicio){
		this.hr_inicio = hr_inicio;
	}
	public String getHr_inicio(){
		return this.hr_inicio;
	}
	
	public void setHr_fim(String hr_fim){
		this.hr_fim = hr_fim;
	}
	public String getHr_fim(){
		return this.hr_fim;
	}
	
	public void setP_id(int p_id){
		this.p_id = p_id;
	}
	public int getP_id(){
		return this.p_id;
	}
	
	public void setP_estado(String p_estado){
		this.p_estado = p_estado;
	}
	public String getP_estado(){
		return this.p_estado;
	}


}
/*-------------------------*/