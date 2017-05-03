/*---------------------- Create Model ----------------------*/
package nosi.webapps.c_cidadao.pages.testepaginacc;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class TestePaginaCC extends Model{		
	@RParam(rParamName = "p_number_1")
	private float number_1;
	@RParam(rParamName = "p_date_1")
	private String date_1;
	@RParam(rParamName = "p_email_1")
	private String email_1;
	@RParam(rParamName = "")
	private String view_img;
	
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
	
	public void setEmail_1(String email_1){
		this.email_1 = email_1;
	}
	public String getEmail_1(){
		return this.email_1;
	}
	
	public void setView_img(String view_img){
		this.view_img = view_img;
	}
	public String getView_img(){
		return this.view_img;
	}


}
/*-------------------------*/