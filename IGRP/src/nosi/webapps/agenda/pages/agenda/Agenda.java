/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.agenda;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Agenda extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_servico_fk")
	private String[] p_servico_fk;
	@RParam(rParamName = "p_servico_fk_desc")
	private String[] p_servico_fk_desc;
	@RParam(rParamName = "p_numero_de_atendimentos_fk")
	private int[] p_numero_de_atendimentos_fk;
	@RParam(rParamName = "p_numero_de_atendimentos_fk_desc")
	private int[] p_numero_de_atendimentos_fk_desc;
	@RParam(rParamName = "p_dias_de_semana_fk")
	private String[] p_dias_de_semana_fk;
	@RParam(rParamName = "p_dias_de_semana_fk_desc")
	private String[] p_dias_de_semana_fk_desc;
	@RParam(rParamName = "p_hora_inicio_fk")
	private String[] p_hora_inicio_fk;
	@RParam(rParamName = "p_hora_inicio_fk_desc")
	private String[] p_hora_inicio_fk_desc;
	@RParam(rParamName = "p_hora_fim_fk")
	private String[] p_hora_fim_fk;
	@RParam(rParamName = "p_hora_fim_fk_desc")
	private String[] p_hora_fim_fk_desc;
	@RParam(rParamName = "p_numero_de_atendedores_fk")
	private int[] p_numero_de_atendedores_fk;
	@RParam(rParamName = "p_numero_de_atendedores_fk_desc")
	private int[] p_numero_de_atendedores_fk_desc;
	@RParam(rParamName = "p_tempo_medio_de_atendimento_mn_fk")
	private float[] p_tempo_medio_de_atendimento_mn_fk;
	@RParam(rParamName = "p_tempo_medio_de_atendimento_mn_fk_desc")
	private float[] p_tempo_medio_de_atendimento_mn_fk_desc;
	@RParam(rParamName = "p_antecedencia_alterarcancelar_hr_fk")
	private String[] p_antecedencia_alterarcancelar_hr_fk;
	@RParam(rParamName = "p_antecedencia_alterarcancelar_hr_fk_desc")
	private String[] p_antecedencia_alterarcancelar_hr_fk_desc;
	@RParam(rParamName = "p_antecedencia_de_agendamento_hr_fk")
	private String[] p_antecedencia_de_agendamento_hr_fk;
	@RParam(rParamName = "p_antecedencia_de_agendamento_hr_fk_desc")
	private String[] p_antecedencia_de_agendamento_hr_fk_desc;
	@RParam(rParamName = "p_periodo_fk")
	private String[] p_periodo_fk;
	@RParam(rParamName = "p_periodo_fk_desc")
	private String[] p_periodo_fk_desc;

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
	
	public void setP_servico_fk(String[] p_servico_fk){
		this.p_servico_fk = p_servico_fk;
	}
	public String[] getP_servico_fk(){
		return this.p_servico_fk;
	}
	
	public void setP_servico_fk_desc(String[] p_servico_fk_desc){
		this.p_servico_fk_desc = p_servico_fk_desc;
	}
	public String[] getP_servico_fk_desc(){
		return this.p_servico_fk_desc;
	}
	
	public void setP_numero_de_atendimentos_fk(int[] p_numero_de_atendimentos_fk){
		this.p_numero_de_atendimentos_fk = p_numero_de_atendimentos_fk;
	}
	public int[] getP_numero_de_atendimentos_fk(){
		return this.p_numero_de_atendimentos_fk;
	}
	
	public void setP_numero_de_atendimentos_fk_desc(int[] p_numero_de_atendimentos_fk_desc){
		this.p_numero_de_atendimentos_fk_desc = p_numero_de_atendimentos_fk_desc;
	}
	public int[] getP_numero_de_atendimentos_fk_desc(){
		return this.p_numero_de_atendimentos_fk_desc;
	}
	
	public void setP_dias_de_semana_fk(String[] p_dias_de_semana_fk){
		this.p_dias_de_semana_fk = p_dias_de_semana_fk;
	}
	public String[] getP_dias_de_semana_fk(){
		return this.p_dias_de_semana_fk;
	}
	
	public void setP_dias_de_semana_fk_desc(String[] p_dias_de_semana_fk_desc){
		this.p_dias_de_semana_fk_desc = p_dias_de_semana_fk_desc;
	}
	public String[] getP_dias_de_semana_fk_desc(){
		return this.p_dias_de_semana_fk_desc;
	}
	
	public void setP_hora_inicio_fk(String[] p_hora_inicio_fk){
		this.p_hora_inicio_fk = p_hora_inicio_fk;
	}
	public String[] getP_hora_inicio_fk(){
		return this.p_hora_inicio_fk;
	}
	
	public void setP_hora_inicio_fk_desc(String[] p_hora_inicio_fk_desc){
		this.p_hora_inicio_fk_desc = p_hora_inicio_fk_desc;
	}
	public String[] getP_hora_inicio_fk_desc(){
		return this.p_hora_inicio_fk_desc;
	}
	
	public void setP_hora_fim_fk(String[] p_hora_fim_fk){
		this.p_hora_fim_fk = p_hora_fim_fk;
	}
	public String[] getP_hora_fim_fk(){
		return this.p_hora_fim_fk;
	}
	
	public void setP_hora_fim_fk_desc(String[] p_hora_fim_fk_desc){
		this.p_hora_fim_fk_desc = p_hora_fim_fk_desc;
	}
	public String[] getP_hora_fim_fk_desc(){
		return this.p_hora_fim_fk_desc;
	}
	
	public void setP_numero_de_atendedores_fk(int[] p_numero_de_atendedores_fk){
		this.p_numero_de_atendedores_fk = p_numero_de_atendedores_fk;
	}
	public int[] getP_numero_de_atendedores_fk(){
		return this.p_numero_de_atendedores_fk;
	}
	
	public void setP_numero_de_atendedores_fk_desc(int[] p_numero_de_atendedores_fk_desc){
		this.p_numero_de_atendedores_fk_desc = p_numero_de_atendedores_fk_desc;
	}
	public int[] getP_numero_de_atendedores_fk_desc(){
		return this.p_numero_de_atendedores_fk_desc;
	}
	
	public void setP_tempo_medio_de_atendimento_mn_fk(float[] p_tempo_medio_de_atendimento_mn_fk){
		this.p_tempo_medio_de_atendimento_mn_fk = p_tempo_medio_de_atendimento_mn_fk;
	}
	public float[] getP_tempo_medio_de_atendimento_mn_fk(){
		return this.p_tempo_medio_de_atendimento_mn_fk;
	}
	
	public void setP_tempo_medio_de_atendimento_mn_fk_desc(float[] p_tempo_medio_de_atendimento_mn_fk_desc){
		this.p_tempo_medio_de_atendimento_mn_fk_desc = p_tempo_medio_de_atendimento_mn_fk_desc;
	}
	public float[] getP_tempo_medio_de_atendimento_mn_fk_desc(){
		return this.p_tempo_medio_de_atendimento_mn_fk_desc;
	}
	
	public void setP_antecedencia_alterarcancelar_hr_fk(String[] p_antecedencia_alterarcancelar_hr_fk){
		this.p_antecedencia_alterarcancelar_hr_fk = p_antecedencia_alterarcancelar_hr_fk;
	}
	public String[] getP_antecedencia_alterarcancelar_hr_fk(){
		return this.p_antecedencia_alterarcancelar_hr_fk;
	}
	
	public void setP_antecedencia_alterarcancelar_hr_fk_desc(String[] p_antecedencia_alterarcancelar_hr_fk_desc){
		this.p_antecedencia_alterarcancelar_hr_fk_desc = p_antecedencia_alterarcancelar_hr_fk_desc;
	}
	public String[] getP_antecedencia_alterarcancelar_hr_fk_desc(){
		return this.p_antecedencia_alterarcancelar_hr_fk_desc;
	}
	
	public void setP_antecedencia_de_agendamento_hr_fk(String[] p_antecedencia_de_agendamento_hr_fk){
		this.p_antecedencia_de_agendamento_hr_fk = p_antecedencia_de_agendamento_hr_fk;
	}
	public String[] getP_antecedencia_de_agendamento_hr_fk(){
		return this.p_antecedencia_de_agendamento_hr_fk;
	}
	
	public void setP_antecedencia_de_agendamento_hr_fk_desc(String[] p_antecedencia_de_agendamento_hr_fk_desc){
		this.p_antecedencia_de_agendamento_hr_fk_desc = p_antecedencia_de_agendamento_hr_fk_desc;
	}
	public String[] getP_antecedencia_de_agendamento_hr_fk_desc(){
		return this.p_antecedencia_de_agendamento_hr_fk_desc;
	}
	
	public void setP_periodo_fk(String[] p_periodo_fk){
		this.p_periodo_fk = p_periodo_fk;
	}
	public String[] getP_periodo_fk(){
		return this.p_periodo_fk;
	}
	
	public void setP_periodo_fk_desc(String[] p_periodo_fk_desc){
		this.p_periodo_fk_desc = p_periodo_fk_desc;
	}
	public String[] getP_periodo_fk_desc(){
		return this.p_periodo_fk_desc;
	}


	public static class Separatorlist_1{
		private Pair servico;
		private Pair numero_de_atendimentos;
		private Pair dias_de_semana;
		private Pair hora_inicio;
		private Pair hora_fim;
		private Pair numero_de_atendedores;
		private Pair tempo_medio_de_atendimento_mn;
		private Pair antecedencia_alterarcancelar_hr;
		private Pair antecedencia_de_agendamento_hr;
		private Pair periodo;
		public static class Pair{
		
			private String key;
			private String value;
			
			public Pair() {}
			
			public Pair(String key, String value) {
				this.key = key;
				this.value = value;
			}
			
			public String getKey() {
				return key;
			}
			public void setKey(String key) {
				this.key = key;
			}
			public String getValue() {
				return value;
			}
			public void setValue(String value) {
				this.value = value;
			}
			
			@Override
			public String toString() {
				return this.key + "_" + this.value;
			}
		}
 		
		public void setServico(Pair servico){
			this.servico = servico;
		}
		public Pair getServico(){
			return this.servico;
		}

		public void setNumero_de_atendimentos(Pair numero_de_atendimentos){
			this.numero_de_atendimentos = numero_de_atendimentos;
		}
		public Pair getNumero_de_atendimentos(){
			return this.numero_de_atendimentos;
		}

		public void setDias_de_semana(Pair dias_de_semana){
			this.dias_de_semana = dias_de_semana;
		}
		public Pair getDias_de_semana(){
			return this.dias_de_semana;
		}

		public void setHora_inicio(Pair hora_inicio){
			this.hora_inicio = hora_inicio;
		}
		public Pair getHora_inicio(){
			return this.hora_inicio;
		}

		public void setHora_fim(Pair hora_fim){
			this.hora_fim = hora_fim;
		}
		public Pair getHora_fim(){
			return this.hora_fim;
		}

		public void setNumero_de_atendedores(Pair numero_de_atendedores){
			this.numero_de_atendedores = numero_de_atendedores;
		}
		public Pair getNumero_de_atendedores(){
			return this.numero_de_atendedores;
		}

		public void setTempo_medio_de_atendimento_mn(Pair tempo_medio_de_atendimento_mn){
			this.tempo_medio_de_atendimento_mn = tempo_medio_de_atendimento_mn;
		}
		public Pair getTempo_medio_de_atendimento_mn(){
			return this.tempo_medio_de_atendimento_mn;
		}

		public void setAntecedencia_alterarcancelar_hr(Pair antecedencia_alterarcancelar_hr){
			this.antecedencia_alterarcancelar_hr = antecedencia_alterarcancelar_hr;
		}
		public Pair getAntecedencia_alterarcancelar_hr(){
			return this.antecedencia_alterarcancelar_hr;
		}

		public void setAntecedencia_de_agendamento_hr(Pair antecedencia_de_agendamento_hr){
			this.antecedencia_de_agendamento_hr = antecedencia_de_agendamento_hr;
		}
		public Pair getAntecedencia_de_agendamento_hr(){
			return this.antecedencia_de_agendamento_hr;
		}

		public void setPeriodo(Pair periodo){
			this.periodo = periodo;
		}
		public Pair getPeriodo(){
			return this.periodo;
		}

	}
}
/*-------------------------*/