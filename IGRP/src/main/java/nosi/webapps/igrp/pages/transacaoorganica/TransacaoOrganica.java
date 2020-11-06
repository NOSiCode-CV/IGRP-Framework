package nosi.webapps.igrp.pages.transacaoorganica;

import nosi.core.gui.components.IGRPLink;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.annotation.RParam;
import nosi.core.webapp.mvc.Model;
import nosi.core.webapp.util.helpers.database.BaseQueryInterface;
import nosi.core.webapp.util.report.Report;

import java.util.ArrayList;
import java.util.List;

public class TransacaoOrganica extends Model{		

	@RParam(rParamName = "p_help")
	private IGRPLink help;
	@RParam(rParamName = "p_help_desc")
	private String help_desc;

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

	
	public IGRPLink setHelp(String app,String page,String action){
		this.help = new IGRPLink(app,page,action);
		return this.help;
	}
	public IGRPLink getHelp(){
		return this.help;
	}
	public void setHelp_desc(String help_desc){
		this.help_desc = help_desc;
	}
	public String getHelp_desc(){
		return this.help_desc;
	}
	public IGRPLink setHelp(String link){
		this.help = new IGRPLink(link);
		return this.help;
	}
	public IGRPLink setHelp(Report link){
		this.help = new IGRPLink(link);
		return this.help;
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
