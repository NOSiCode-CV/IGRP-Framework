package nosi.webapps.igrp.pages.menuorganica;
import nosi.core.webapp.Model;
import java.util.ArrayList;

public class MenuOrganica extends Model{	
	private String id;
	private String type;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}


	private ArrayList<Table_1> table_1 = new ArrayList<>();
	
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}

	public class Table_1{
		private int menu;
		private String descricao;
		private int menu_check;
		public void setMenu(int menu){
			this.menu = menu;
		}
		
		public int getMenu(){
			return this.menu;
		}

		public void setDescricao(String descricao){
			this.descricao = descricao;
		}
		
		public String getDescricao(){
			return this.descricao;
		}

		public int getMenu_check() {
			return menu_check;
		}

		public void setMenu_check(int menu_check) {
			this.menu_check = menu_check;
		}

	}
}