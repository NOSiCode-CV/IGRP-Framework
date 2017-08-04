/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.agenda;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Agenda extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_balcao")
	private String balcao;
	@RParam(rParamName = "p_servico")
	private String servico;
	@RParam(rParamName = "p_numero_de_atendimentos")
	private float numero_de_atendimentos;
	@RParam(rParamName = "p_dias_de_semana")
	private String dias_de_semana;
	@RParam(rParamName = "p_hora_inicio")
	private String hora_inicio;
	@RParam(rParamName = "p_hora_fim")
	private String hora_fim;
	@RParam(rParamName = "p_numero_de_atendedores")
	private float numero_de_atendedores;
	@RParam(rParamName = "p_tempo_medio_de_atendimento_mn")
	private float tempo_medio_de_atendimento_mn;
	@RParam(rParamName = "p_antecedencia_alterarcancelar_hr")
	private String antecedencia_alterarcancelar_hr;
	@RParam(rParamName = "p_antecedencia_de_agendamento_hr")
	private String antecedencia_de_agendamento_hr;

	private ArrayList<Separatorlist_1> separatorlist_1 = new ArrayList<>();
	public void setSeparatorlist_1(ArrayList<Separatorlist_1> separatorlist_1){
		this.separatorlist_1 = separatorlist_1;
	}
	public ArrayList<Separatorlist_1> getseparatorlist_1(){
		return this.separatorlist_1;
	}
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setBalcao(String balcao){
		this.balcao = balcao;
	}
	public String getBalcao(){
		return this.balcao;
	}
	
	public void setServico(String servico){
		this.servico = servico;
	}
	public String getServico(){
		return this.servico;
	}
	
	public void setNumero_de_atendimentos(float numero_de_atendimentos){
		this.numero_de_atendimentos = numero_de_atendimentos;
	}
	public float getNumero_de_atendimentos(){
		return this.numero_de_atendimentos;
	}
	
	public void setDias_de_semana(String dias_de_semana){
		this.dias_de_semana = dias_de_semana;
	}
	public String getDias_de_semana(){
		return this.dias_de_semana;
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
	
	public void setNumero_de_atendedores(float numero_de_atendedores){
		this.numero_de_atendedores = numero_de_atendedores;
	}
	public float getNumero_de_atendedores(){
		return this.numero_de_atendedores;
	}
	
	public void setTempo_medio_de_atendimento_mn(float tempo_medio_de_atendimento_mn){
		this.tempo_medio_de_atendimento_mn = tempo_medio_de_atendimento_mn;
	}
	public float getTempo_medio_de_atendimento_mn(){
		return this.tempo_medio_de_atendimento_mn;
	}
	
	public void setAntecedencia_alterarcancelar_hr(String antecedencia_alterarcancelar_hr){
		this.antecedencia_alterarcancelar_hr = antecedencia_alterarcancelar_hr;
	}
	public String getAntecedencia_alterarcancelar_hr(){
		return this.antecedencia_alterarcancelar_hr;
	}
	
	public void setAntecedencia_de_agendamento_hr(String antecedencia_de_agendamento_hr){
		this.antecedencia_de_agendamento_hr = antecedencia_de_agendamento_hr;
	}
	public String getAntecedencia_de_agendamento_hr(){
		return this.antecedencia_de_agendamento_hr;
	}


	public class Separatorlist_1{
		private String balcao;
		private String servico;
		private float numero_de_atendimentos;
		private String dias_de_semana;
		private String hora_inicio;
		private String hora_fim;
		private float numero_de_atendedores;
		private float tempo_medio_de_atendimento_mn;
		private String antecedencia_alterarcancelar_hr;
		private String antecedencia_de_agendamento_hr;
		public void setBalcao(String balcao){
			this.balcao = balcao;
		}
		public String getBalcao(){
			return this.balcao;
		}

		public void setServico(String servico){
			this.servico = servico;
		}
		public String getServico(){
			return this.servico;
		}

		public void setNumero_de_atendimentos(float numero_de_atendimentos){
			this.numero_de_atendimentos = numero_de_atendimentos;
		}
		public float getNumero_de_atendimentos(){
			return this.numero_de_atendimentos;
		}

		public void setDias_de_semana(String dias_de_semana){
			this.dias_de_semana = dias_de_semana;
		}
		public String getDias_de_semana(){
			return this.dias_de_semana;
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

		public void setNumero_de_atendedores(float numero_de_atendedores){
			this.numero_de_atendedores = numero_de_atendedores;
		}
		public float getNumero_de_atendedores(){
			return this.numero_de_atendedores;
		}

		public void setTempo_medio_de_atendimento_mn(float tempo_medio_de_atendimento_mn){
			this.tempo_medio_de_atendimento_mn = tempo_medio_de_atendimento_mn;
		}
		public float getTempo_medio_de_atendimento_mn(){
			return this.tempo_medio_de_atendimento_mn;
		}

		public void setAntecedencia_alterarcancelar_hr(String antecedencia_alterarcancelar_hr){
			this.antecedencia_alterarcancelar_hr = antecedencia_alterarcancelar_hr;
		}
		public String getAntecedencia_alterarcancelar_hr(){
			return this.antecedencia_alterarcancelar_hr;
		}

		public void setAntecedencia_de_agendamento_hr(String antecedencia_de_agendamento_hr){
			this.antecedencia_de_agendamento_hr = antecedencia_de_agendamento_hr;
		}
		public String getAntecedencia_de_agendamento_hr(){
			return this.antecedencia_de_agendamento_hr;
		}

	}
}
/*-------------------------*/