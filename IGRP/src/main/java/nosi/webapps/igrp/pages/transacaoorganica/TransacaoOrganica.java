package nosi.webapps.igrp.pages.transacaoorganica;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
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


	public static class Table_1{
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

	public void loadTable_1(QueryHelper query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
