/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.example;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class Example extends Model{		
	@RParam(rParamName = "p_select_1")
	private String select_1;
	@RParam(rParamName = "p_email_1")
	private String email_1;
	@RParam(rParamName = "p_password_1")
	private String password_1;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setSelect_1(String select_1){
		this.select_1 = select_1;
	}
	public String getSelect_1(){
		return this.select_1;
	}
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}
	
	public void setPassword_1(String password_1){
		this.password_1 = password_1;
	}
	public String getPassword_1(){
		return this.password_1;
	}


	public class Table_1{
		private String plaintext_1;
		private String plaintext_2;
		public void setPlaintext_1(String plaintext_1){
			this.plaintext_1 = plaintext_1;
		}
		public String getPlaintext_1(){
			return this.plaintext_1;
		}

		public void setPlaintext_2(String plaintext_2){
			this.plaintext_2 = plaintext_2;
		}
		public String getPlaintext_2(){
			return this.plaintext_2;
		}

	}
}
/*-------------------------*/