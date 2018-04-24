package nosi.webapps.igrp.pages.menuorganica;

import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;



import java.util.ArrayList;
import java.util.List;

public class MenuOrganica extends Model{		
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
		private int menu;
		private int menu_check;
		private String descricao;
		public void setMenu(int menu){
			this.menu = menu;
		}
		public int getMenu(){
			return this.menu;
		}
		public void setMenu_check(int menu_check){
			this.menu_check = menu_check;
		}
		public int getMenu_check(){
			return this.menu_check;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
