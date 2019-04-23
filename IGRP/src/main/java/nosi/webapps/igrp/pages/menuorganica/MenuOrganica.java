package nosi.webapps.igrp.pages.menuorganica;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class MenuOrganica extends Model{		
	@RParam(rParamName = "p_env_fk")
	private int env_fk;
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

	
	public void setEnv_fk(int env_fk){
		this.env_fk = env_fk;
	}
	public int getEnv_fk(){
		return this.env_fk;
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
		private Integer menu;
		private Integer menu_check;
		private String descricao;
		private String app;
		public void setMenu(Integer menu){
			this.menu = menu;
		}
		public Integer getMenu(){
			return this.menu;
		}
		public void setMenu_check(Integer menu_check){
			this.menu_check = menu_check;
		}
		public Integer getMenu_check(){
			return this.menu_check;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		public String getDescricao(){
			return this.descricao;
		}

		public void setApp(String app){
			this.app = app;
		}
		public String getApp(){
			return this.app;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
