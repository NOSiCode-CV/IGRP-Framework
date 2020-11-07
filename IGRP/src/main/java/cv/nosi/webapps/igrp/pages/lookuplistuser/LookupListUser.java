package cv.nosi.webapps.igrp.pages.lookuplistuser;

import java.util.ArrayList;
import java.util.List;

import cv.nosi.core.gui.components.IGRPTable;
import cv.nosi.core.webapp.annotation.RParam;
import cv.nosi.core.webapp.mvc.Model;
import cv.nosi.core.webapp.util.helpers.database.BaseQueryInterface;

public class LookupListUser extends Model{		

	@RParam(rParamName = "p_email")
	private String email;

	@RParam(rParamName = "p_login")
	private String login;

	@RParam(rParamName = "p_nome")
	private String nome;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setLogin(String login){
		this.login = login;
	}
	public String getLogin(){
		return this.login;
	}
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String email_1;
		private String login_1;
		private String nome_1;
		private String id;
		public void setEmail_1(String email_1){
			this.email_1 = email_1;
		}
		public String getEmail_1(){
			return this.email_1;
		}

		public void setLogin_1(String login_1){
			this.login_1 = login_1;
		}
		public String getLogin_1(){
			return this.login_1;
		}

		public void setNome_1(String nome_1){
			this.nome_1 = nome_1;
		}
		public String getNome_1(){
			return this.nome_1;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
