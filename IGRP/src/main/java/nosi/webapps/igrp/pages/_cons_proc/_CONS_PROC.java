package nosi.webapps.igrp.pages._cons_proc;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class _CONS_PROC extends Model{		
	@RParam(rParamName = "p_aplicacao")
	private String aplicacao;
	@RParam(rParamName = "p_tipo_processo")
	private String tipo_processo;
	@RParam(rParamName = "p_cbx_utilizador")
	private String cbx_utilizador;
	@RParam(rParamName = "p_status")
	private String status;
	@RParam(rParamName = "p_referencia_pedido")
	private String referencia_pedido;
	@RParam(rParamName = "p_requerente")
	private String requerente;
	@RParam(rParamName = "p_num")
	private String num;
	@RParam(rParamName = "p_intervalo_entrada")
	private String intervalo_entrada;
	@RParam(rParamName = "p_dt_ini")
	private String dt_ini;
	@RParam(rParamName = "p_dt_fim")
	private String dt_fim;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setAplicacao(String aplicacao){
		this.aplicacao = aplicacao;
	}
	public String getAplicacao(){
		return this.aplicacao;
	}
	
	public void setTipo_processo(String tipo_processo){
		this.tipo_processo = tipo_processo;
	}
	public String getTipo_processo(){
		return this.tipo_processo;
	}
	
	public void setCbx_utilizador(String cbx_utilizador){
		this.cbx_utilizador = cbx_utilizador;
	}
	public String getCbx_utilizador(){
		return this.cbx_utilizador;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	public String getStatus(){
		return this.status;
	}
	
	public void setReferencia_pedido(String referencia_pedido){
		this.referencia_pedido = referencia_pedido;
	}
	public String getReferencia_pedido(){
		return this.referencia_pedido;
	}
	
	public void setRequerente(String requerente){
		this.requerente = requerente;
	}
	public String getRequerente(){
		return this.requerente;
	}
	
	public void setNum(String num){
		this.num = num;
	}
	public String getNum(){
		return this.num;
	}
	
	public void setIntervalo_entrada(String intervalo_entrada){
		this.intervalo_entrada = intervalo_entrada;
	}
	public String getIntervalo_entrada(){
		return this.intervalo_entrada;
	}
	
	public void setDt_ini(String dt_ini){
		this.dt_ini = dt_ini;
	}
	public String getDt_ini(){
		return this.dt_ini;
	}
	
	public void setDt_fim(String dt_fim){
		this.dt_fim = dt_fim;
	}
	public String getDt_fim(){
		return this.dt_fim;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String num_processo;
		private String processo;
		private String eatapa;
		private String dt_inicio_etapa;
		private String dt_fim_etapa;
		private String atribuido_a;
		private String estado;
		private String id_task;
		public void setNum_processo(String num_processo){
			this.num_processo = num_processo;
		}
		public String getNum_processo(){
			return this.num_processo;
		}

		public void setProcesso(String processo){
			this.processo = processo;
		}
		public String getProcesso(){
			return this.processo;
		}

		public void setEatapa(String eatapa){
			this.eatapa = eatapa;
		}
		public String getEatapa(){
			return this.eatapa;
		}

		public void setDt_inicio_etapa(String dt_inicio_etapa){
			this.dt_inicio_etapa = dt_inicio_etapa;
		}
		public String getDt_inicio_etapa(){
			return this.dt_inicio_etapa;
		}

		public void setDt_fim_etapa(String dt_fim_etapa){
			this.dt_fim_etapa = dt_fim_etapa;
		}
		public String getDt_fim_etapa(){
			return this.dt_fim_etapa;
		}

		public void setAtribuido_a(String atribuido_a){
			this.atribuido_a = atribuido_a;
		}
		public String getAtribuido_a(){
			return this.atribuido_a;
		}

		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
		}

		public void setId_task(String id_task){
			this.id_task = id_task;
		}
		public String getId_task(){
			return this.id_task;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
