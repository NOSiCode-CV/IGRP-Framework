package nosi.webapps.igrp.pages.tbl_tipo_documentolist;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Tbl_tipo_documentoList extends Model{		
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}


	public static class Table_1{
		private String id;
		private String codigo;
		private String descricao;
		private String nome;
		private int status;
		private String aplicacao;
		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

		public void setCodigo(String codigo){
			this.codigo = codigo;
		}
		public String getCodigo(){
			return this.codigo;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setStatus(int status){
			this.status = status;
		}
		public int getStatus(){
			return this.status;
		}

		public void setAplicacao(String aplicacao){
			this.aplicacao = aplicacao;
		}
		public String getAplicacao(){
			return this.aplicacao;
		}

	}

	public void loadTable_1(QueryHelper query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
