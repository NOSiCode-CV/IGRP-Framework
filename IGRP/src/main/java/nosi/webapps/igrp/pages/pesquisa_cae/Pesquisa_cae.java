package nosi.webapps.igrp.pages.pesquisa_cae;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Pesquisa_cae extends Model{		
	@RParam(rParamName = "p_codigo")
	private String codigo;
	@RParam(rParamName = "p_descricao")
	private String descricao;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
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


	public static class Table_1 extends IGRPTable.Table{
		private String t_codigo;
		private String t_descricao;
		public void setT_codigo(String t_codigo){
			this.t_codigo = t_codigo;
		}
		public String getT_codigo(){
			return this.t_codigo;
		}

		public void setT_descricao(String t_descricao){
			this.t_descricao = t_descricao;
		}
		public String getT_descricao(){
			return this.t_descricao;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
