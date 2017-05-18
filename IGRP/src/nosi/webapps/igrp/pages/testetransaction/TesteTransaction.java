/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.testetransaction;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class TesteTransaction extends Model{		
	@RParam(rParamName = "p_number_1")
	private float number_1;
	@RParam(rParamName = "p_email_1")
	private String email_1;
	@RParam(rParamName = "p_text_1")
	private String text_1;

	private ArrayList<Table_1> table_1 = new ArrayList<>();
	public void setTable_1(ArrayList<Table_1> table_1){
		this.table_1 = table_1;
	}
	public ArrayList<Table_1> gettable_1(){
		return this.table_1;
	}
	
	public void setNumber_1(float number_1){
		this.number_1 = number_1;
	}
	public float getNumber_1(){
		return this.number_1;
	}
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}
	
	public void setText_1(String text_1){
		this.text_1 = text_1;
	}
	public String getText_1(){
		return this.text_1;
	}


	public class Table_1{
		private float number_1;
		private String text_1;
		private String email_1;
		public void setNumber_1(float number_1){
			this.number_1 = number_1;
		}
		public float getNumber_1(){
			return this.number_1;
		}

		public void setText_1(String text_1){
			this.text_1 = text_1;
		}
		public String getText_1(){
			return this.text_1;
		}

		public void setEmail_1(String email_1){
			this.email_1 = email_1;
		}
		public String getEmail_1(){
			return this.email_1;
		}

	}
}
/*-------------------------*/