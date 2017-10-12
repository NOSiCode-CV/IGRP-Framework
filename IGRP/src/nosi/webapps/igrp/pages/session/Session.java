/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.session;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Session extends Model{	
	
	@RParam(rParamName = "p_aplicacao")
	private int aplicacao;
	
	@RParam(rParamName = "p_utilizador")
	private String utilizador; 
	
	@RParam(rParamName = "p_data_inicio")
	private String data_inicio;
	
	@RParam(rParamName = "p_data_fim")
	private String data_fim;
	
	@RParam(rParamName = "p_estado")
	private int estado;

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
	
	public void setAplicacao(int aplicacao){
		this.aplicacao = aplicacao;
	}
	public int getAplicacao(){
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
	
	public void setEstado(int estado){
		this.estado = estado;
	}
	public int getEstado(){
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
		private String data;
		private int total;
		public String getData() {
			return data;
		}
		public void setData(String data) {
			this.data = data;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
	}
	
	
	public class Chart_t_session_app{
		private String dataInicio;
//		private String appname;
		private int total;
		
		public String getDataInicio() {
			return dataInicio;
		}
		public void setDataInicio(String dataInicio) {
			this.dataInicio = dataInicio;
		}
//		public String getAppname() {
//			return appname;
//		}
//		public void setAppname(String appname) {
//			this.appname = appname;
//		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		
	}
}
/*-------------------------*/