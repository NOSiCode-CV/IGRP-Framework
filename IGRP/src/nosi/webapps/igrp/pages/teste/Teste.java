/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.teste;
import nosi.core.webapp.Model;

public class Teste extends Model{		
	private String text_1;
	private String date_1;
	private String email_1;
	
	public void setText_1(String text_1){
		this.text_1 = text_1;
	}
	public String getText_1(){
		return this.text_1;
	}
	
	public void setDate_1(String date_1){
		this.date_1 = date_1;
	}
	public String getDate_1(){
		return this.date_1;
	}
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}

}
/*-------------------------*/