package nosi.webapps.igrp.pages.transacaoorganica;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class TransacaoOrganica extends Model{		
	@RParam(rParamName = "p_id")
	private int id;
	@RParam(rParamName = "p_type")
	private String type;
	
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
	
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	
	public void setType(String type){
		this.type = type;
	}
	public String getType(){
		return this.type;
	}


	public static class Table_1 extends IGRPTable.Table{
		private int transacao;
		private int transacao_check;
		private String nome;
		public void setTransacao(int transacao){
			this.transacao = transacao;
		}
		public int getTransacao(){
			return this.transacao;
		}
		public void setTransacao_check(int transacao_check){
			this.transacao_check = transacao_check;
		}
		public int getTransacao_check(){
			return this.transacao_check;
		}

		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
