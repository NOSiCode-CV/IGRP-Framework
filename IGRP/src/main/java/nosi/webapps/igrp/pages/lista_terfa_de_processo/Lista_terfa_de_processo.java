package nosi.webapps.igrp.pages.lista_terfa_de_processo;

import java.util.ArrayList;
import java.util.List;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;

public class Lista_terfa_de_processo extends Model{		
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}



	public static class Table_1 extends IGRPTable.Table{
		private String estado;
		private String descricao_tarefa;
		private String data_inicio;
		private String data_fim;
		private String n_tarefa;
		private String atribuido_a;
		private String processdefinitionkey;
		private String taskdefinitionkey;
		private String prm_taskid;
		public void setEstado(String estado){
			this.estado = estado;
		}
		public String getEstado(){
			return this.estado;
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

		public void setN_tarefa(String n_tarefa){
			this.n_tarefa = n_tarefa;
		}
		public String getN_tarefa(){
			return this.n_tarefa;
		}

		public void setAtribuido_a(String atribuido_a){
			this.atribuido_a = atribuido_a;
		}
		public String getAtribuido_a(){
			return this.atribuido_a;
		}

		public void setProcessdefinitionkey(String processdefinitionkey){
			this.processdefinitionkey = processdefinitionkey;
		}
		public String getProcessdefinitionkey(){
			return this.processdefinitionkey;
		}

		public void setTaskdefinitionkey(String taskdefinitionkey){
			this.taskdefinitionkey = taskdefinitionkey;
		}
		public String getTaskdefinitionkey(){
			return this.taskdefinitionkey;
		}

		public void setPrm_taskid(String prm_taskid){
			this.prm_taskid = prm_taskid;
		}
		public String getPrm_taskid(){
			return this.prm_taskid;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
