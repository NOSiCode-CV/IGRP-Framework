/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.lookuplistuser;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

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
	public List<Table_1> gettable_1(){
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


	public static class Table_1{
		private String email_1;
		private String login_1;
		private String nome_1;
		private String p_id;
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

		public void setP_id(String p_id){
			this.p_id = p_id;
		}
		public String getP_id(){
			return this.p_id;
		}

	}
}
/*-------------------------*/