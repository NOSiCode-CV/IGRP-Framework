/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.transacaoorganica;
import nosi.core.webapp.Model;
import java.util.ArrayList;

public class TransacaoOrganica extends Model{		
	private String type;
	private int id;		
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}


	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}


	public class Table_1{
		private int transacao;
		private int transacao_check;
		private String descricao;
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

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

	}
}
/*-------------------------*/