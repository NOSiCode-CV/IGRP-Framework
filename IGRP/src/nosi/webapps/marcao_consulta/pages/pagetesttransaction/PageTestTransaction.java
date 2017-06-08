/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcao_consulta.pages.pagetesttransaction;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class PageTestTransaction extends Model{		
	@RParam(rParamName = "p_text_1")
	private String text_1;
	@RParam(rParamName = "p_number_1")
	private float number_1;
	
	public void setText_1(String text_1){
		this.text_1 = text_1;
	}
	public String getText_1(){
		return this.text_1;
	}
	
	public void setNumber_1(float number_1){
		this.number_1 = number_1;
	}
	public float getNumber_1(){
		return this.number_1;
	}


}
/*-------------------------*/