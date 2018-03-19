package nosi.webapps.igrp.pages.transacaoorganica;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;
import java.util.List;

public class TransacaoOrganica extends Model{		
	@RParam(rParamName = "p_id")
	private int p_id;
	@RParam(rParamName = "p_type")
	private String p_type;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}
	
	public void setP_id(int p_id){
		this.p_id = p_id;
	}
	public int getP_id(){
		return this.p_id;
	}
	
	public void setP_type(String p_type){
		this.p_type = p_type;
	}
	public String getP_type(){
		return this.p_type;
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
}
