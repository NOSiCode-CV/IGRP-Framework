/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.agdashboard;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class AGDashboard extends Model{		
	@RParam(rParamName = "p_entidade")
	private String entidade;
	@RParam(rParamName = "p_data_de_")
	private String data_de_;
	@RParam(rParamName = "p_data_ate")
	private String data_ate;
	@RParam(rParamName = "p_agendamentos_do_dia_tit")
	private String agendamentos_do_dia_tit;
	@RParam(rParamName = "p_agendamentos_do_dia_val")
	private String agendamentos_do_dia_val;
	@RParam(rParamName = "p_agendamentos_do_dia_txt")
	private String agendamentos_do_dia_txt;
	@RParam(rParamName = "p_agendamentos_do_dia_url")
	private String agendamentos_do_dia_url;
	@RParam(rParamName = "p_agendamentos_do_dia_bg")
	private String agendamentos_do_dia_bg;
	@RParam(rParamName = "p_agendamentos_do_dia_icn")
	private String agendamentos_do_dia_icn;
	@RParam(rParamName = "p_agendamentos_atendidos_tit")
	private String agendamentos_atendidos_tit;
	@RParam(rParamName = "p_agendamentos_atendidos_lbl")
	private String agendamentos_atendidos_lbl;
	@RParam(rParamName = "p_agendamentos_atendidos_val")
	private String agendamentos_atendidos_val;
	@RParam(rParamName = "p_agendamentos_atendidos_desc")
	private String agendamentos_atendidos_desc;
	@RParam(rParamName = "p_agendamentos_atendidos_url")
	private String agendamentos_atendidos_url;
	@RParam(rParamName = "p_agendamentos_atendidos_bg")
	private String agendamentos_atendidos_bg;

	private ArrayList<Chart_1> chart_1 = new ArrayList<>();
	public void setChart_1(ArrayList<Chart_1> chart_1){
		this.chart_1 = chart_1;
	}
	public ArrayList<Chart_1> getchart_1(){
		return this.chart_1;
	}

	private ArrayList<Chart_2> chart_2 = new ArrayList<>();
	public void setChart_2(ArrayList<Chart_2> chart_2){
		this.chart_2 = chart_2;
	}
	public ArrayList<Chart_2> getchart_2(){
		return this.chart_2;
	}

	private ArrayList<Chart_5> chart_5 = new ArrayList<>();
	public void setChart_5(ArrayList<Chart_5> chart_5){
		this.chart_5 = chart_5;
	}
	public ArrayList<Chart_5> getchart_5(){
		return this.chart_5;
	}

	private ArrayList<Chart_3> chart_3 = new ArrayList<>();
	public void setChart_3(ArrayList<Chart_3> chart_3){
		this.chart_3 = chart_3;
	}
	public ArrayList<Chart_3> getchart_3(){
		return this.chart_3;
	}
	
	public void setEntidade(String entidade){
		this.entidade = entidade;
	}
	public String getEntidade(){
		return this.entidade;
	}
	
	public void setData_de_(String data_de_){
		this.data_de_ = data_de_;
	}
	public String getData_de_(){
		return this.data_de_;
	}
	
	public void setData_ate(String data_ate){
		this.data_ate = data_ate;
	}
	public String getData_ate(){
		return this.data_ate;
	}
	
	public void setAgendamentos_do_dia_tit(String agendamentos_do_dia_tit){
		this.agendamentos_do_dia_tit = agendamentos_do_dia_tit;
	}
	public String getAgendamentos_do_dia_tit(){
		return this.agendamentos_do_dia_tit;
	}
	
	public void setAgendamentos_do_dia_val(String agendamentos_do_dia_val){
		this.agendamentos_do_dia_val = agendamentos_do_dia_val;
	}
	public String getAgendamentos_do_dia_val(){
		return this.agendamentos_do_dia_val;
	}
	
	public void setAgendamentos_do_dia_txt(String agendamentos_do_dia_txt){
		this.agendamentos_do_dia_txt = agendamentos_do_dia_txt;
	}
	public String getAgendamentos_do_dia_txt(){
		return this.agendamentos_do_dia_txt;
	}
	
	public void setAgendamentos_do_dia_url(String agendamentos_do_dia_url){
		this.agendamentos_do_dia_url = agendamentos_do_dia_url;
	}
	public String getAgendamentos_do_dia_url(){
		return this.agendamentos_do_dia_url;
	}
	
	public void setAgendamentos_do_dia_bg(String agendamentos_do_dia_bg){
		this.agendamentos_do_dia_bg = agendamentos_do_dia_bg;
	}
	public String getAgendamentos_do_dia_bg(){
		return this.agendamentos_do_dia_bg;
	}
	
	public void setAgendamentos_do_dia_icn(String agendamentos_do_dia_icn){
		this.agendamentos_do_dia_icn = agendamentos_do_dia_icn;
	}
	public String getAgendamentos_do_dia_icn(){
		return this.agendamentos_do_dia_icn;
	}
	
	public void setAgendamentos_atendidos_tit(String agendamentos_atendidos_tit){
		this.agendamentos_atendidos_tit = agendamentos_atendidos_tit;
	}
	public String getAgendamentos_atendidos_tit(){
		return this.agendamentos_atendidos_tit;
	}
	
	public void setAgendamentos_atendidos_lbl(String agendamentos_atendidos_lbl){
		this.agendamentos_atendidos_lbl = agendamentos_atendidos_lbl;
	}
	public String getAgendamentos_atendidos_lbl(){
		return this.agendamentos_atendidos_lbl;
	}
	
	public void setAgendamentos_atendidos_val(String agendamentos_atendidos_val){
		this.agendamentos_atendidos_val = agendamentos_atendidos_val;
	}
	public String getAgendamentos_atendidos_val(){
		return this.agendamentos_atendidos_val;
	}
	
	public void setAgendamentos_atendidos_desc(String agendamentos_atendidos_desc){
		this.agendamentos_atendidos_desc = agendamentos_atendidos_desc;
	}
	public String getAgendamentos_atendidos_desc(){
		return this.agendamentos_atendidos_desc;
	}
	
	public void setAgendamentos_atendidos_url(String agendamentos_atendidos_url){
		this.agendamentos_atendidos_url = agendamentos_atendidos_url;
	}
	public String getAgendamentos_atendidos_url(){
		return this.agendamentos_atendidos_url;
	}
	
	public void setAgendamentos_atendidos_bg(String agendamentos_atendidos_bg){
		this.agendamentos_atendidos_bg = agendamentos_atendidos_bg;
	}
	public String getAgendamentos_atendidos_bg(){
		return this.agendamentos_atendidos_bg;
	}


	public class Chart_1{
		private String Ano;
		private String X1;
		private String X2;
		private String X3;
		private String X4;
		public void setAno(String Ano){
			this.Ano = Ano;
		}
		public String getAno(){
			return this.Ano;
		}

		public void setX1(String X1){
			this.X1 = X1;
		}
		public String getX1(){
			return this.X1;
		}

		public void setX2(String X2){
			this.X2 = X2;
		}
		public String getX2(){
			return this.X2;
		}

		public void setX3(String X3){
			this.X3 = X3;
		}
		public String getX3(){
			return this.X3;
		}

		public void setX4(String X4){
			this.X4 = X4;
		}
		public String getX4(){
			return this.X4;
		}

	}
	public class Chart_2{
		private String Ano;
		private String X1;
		private String X2;
		private String X3;
		private String X4;
		public void setAno(String Ano){
			this.Ano = Ano;
		}
		public String getAno(){
			return this.Ano;
		}

		public void setX1(String X1){
			this.X1 = X1;
		}
		public String getX1(){
			return this.X1;
		}

		public void setX2(String X2){
			this.X2 = X2;
		}
		public String getX2(){
			return this.X2;
		}

		public void setX3(String X3){
			this.X3 = X3;
		}
		public String getX3(){
			return this.X3;
		}

		public void setX4(String X4){
			this.X4 = X4;
		}
		public String getX4(){
			return this.X4;
		}

	}
	public class Chart_5{
		private String Ano;
		private String X1;
		private String X2;
		private String X3;
		private String X4;
		public void setAno(String Ano){
			this.Ano = Ano;
		}
		public String getAno(){
			return this.Ano;
		}

		public void setX1(String X1){
			this.X1 = X1;
		}
		public String getX1(){
			return this.X1;
		}

		public void setX2(String X2){
			this.X2 = X2;
		}
		public String getX2(){
			return this.X2;
		}

		public void setX3(String X3){
			this.X3 = X3;
		}
		public String getX3(){
			return this.X3;
		}

		public void setX4(String X4){
			this.X4 = X4;
		}
		public String getX4(){
			return this.X4;
		}

	}
	public class Chart_3{
		private String Ano;
		private String X1;
		private String X2;
		private String X3;
		private String X4;
		public void setAno(String Ano){
			this.Ano = Ano;
		}
		public String getAno(){
			return this.Ano;
		}

		public void setX1(String X1){
			this.X1 = X1;
		}
		public String getX1(){
			return this.X1;
		}

		public void setX2(String X2){
			this.X2 = X2;
		}
		public String getX2(){
			return this.X2;
		}

		public void setX3(String X3){
			this.X3 = X3;
		}
		public String getX3(){
			return this.X3;
		}

		public void setX4(String X4){
			this.X4 = X4;
		}
		public String getX4(){
			return this.X4;
		}

	}
}
/*-------------------------*/