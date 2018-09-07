package nosi.webapps.igrp.pages.lista_terfa_de_processo;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Lista_terfa_de_processo extends Model{		
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	@RParam(rParamName = "p_table_1_id")
	private String[] p_table_1_id;
	@RParam(rParamName = "p_table_1_del")
	private String[] p_table_1_del;
	
	public void setP_table_1_id(String[] p_table_1_id){
		this.p_table_1_id = p_table_1_id;
	}
	public String[] getP_table_1_id(){
		return this.p_table_1_id;
	}
	
	public void setP_table_1_del(String[] p_table_1_del){
		this.p_table_1_del = p_table_1_del;
	}
	public String[] getP_table_1_del(){
		return this.p_table_1_del;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String n_tarefa;
		private String descricao_tarefa;
		private String data_inicio;
		private String data_fim;
		private String estado;
		public void setN_tarefa(String n_tarefa){
			this.n_tarefa = n_tarefa;
		}
		public String getN_tarefa(){
			return this.n_tarefa;
		}

		public void setDescricao_tarefa(String descricao_tarefa){
			this.descricao_tarefa = descricao_tarefa;
		}
		public String getDescricao_tarefa(){
			return this.descricao_tarefa;
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

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
