/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.testeima;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class TesteIma extends Model{		
	@RParam(rParamName = "p_number_1")
	private float number_1;
	@RParam(rParamName = "p_date_1")
	private String date_1;
	@RParam(rParamName = "p_text_1")
	private String text_1;
	
	public void setNumber_1(float number_1){
		this.number_1 = number_1;
	}
	public float getNumber_1(){
		return this.number_1;
	}
	
	public void setDate_1(String date_1){
		this.date_1 = date_1;
	}
	public String getDate_1(){
		return this.date_1;
	}
	
	public void setText_1(String text_1){
		this.text_1 = text_1;
	}
	public String getText_1(){
		return this.text_1;
	}


}
/*-------------------------*/