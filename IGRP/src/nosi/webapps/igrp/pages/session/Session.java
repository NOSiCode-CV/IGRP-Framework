/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.session;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Session extends Model{		
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_utilizador")
	private String utilizador;
	@RParam(rParamName = "p_data_inicio")
	private String data_inicio;
	@RParam(rParamName = "p_data_fim")
	private String data_fim;
	@RParam(rParamName = "p_estado")
	private String estado;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}

	private ArrayList<Chart_t_sessao> chart_t_sessao = new ArrayList<>();
	public void setChart_t_sessao(ArrayList<Chart_t_sessao> chart_t_sessao){
		this.chart_t_sessao = chart_t_sessao;
	}
	public ArrayList<Chart_t_sessao> getchart_t_sessao(){
		return this.chart_t_sessao;
	}

	private ArrayList<Chart_t_session_app> chart_t_session_app = new ArrayList<>();
	public void setChart_t_session_app(ArrayList<Chart_t_session_app> chart_t_session_app){
		this.chart_t_session_app = chart_t_session_app;
	}
	public ArrayList<Chart_t_session_app> getchart_t_session_app(){
		return this.chart_t_session_app;
	}
	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setUtilizador(String utilizador){
		this.utilizador = utilizador;
	}
	public String getUtilizador(){
		return this.utilizador;
	}
	
	public void setData_inicio(String data_inicio){
		this.data_inicio = data_inicio;
	}
	public String getData_inicio(){
		return this.data_inicio;
	}
	
	public void setData_fim(String data_fim){
		this.data_fim = data_fim;
	}
	public String getData_fim(){
		return this.data_fim;
	}
	
	public void setEstado(String estado){
		this.estado = estado;
	}
	public String getEstado(){
		return this.estado;
	}


	public class Table_1{
		private String aplicacao;
		private String utilizador;
		private String ip;
		private String data_inicio;
		private String data_fim;
		private String filter;
		public void setAplicacao(String aplicacao){
			this.aplicacao = aplicacao;
		}
		public String getAplicacao(){
			return this.aplicacao;
		}

		public void setUtilizador(String utilizador){
			this.utilizador = utilizador;
		}
		public String getUtilizador(){
			return this.utilizador;
		}

		public void setIp(String ip){
			this.ip = ip;
		}
		public String getIp(){
			return this.ip;
		}

		public void setData_inicio(String data_inicio){
			this.data_inicio = data_inicio;
		}
		public String getData_inicio(){
			return this.data_inicio;
		}

		public void setData_fim(String data_fim){
			this.data_fim = data_fim;
		}
		public String getData_fim(){
			return this.data_fim;
		}

		public void setFilter(String filter){
			this.filter = filter;
		}
		public String getFilter(){
			return this.filter;
		}

	}
	public class Chart_t_sessao{
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
	public class Chart_t_session_app{
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