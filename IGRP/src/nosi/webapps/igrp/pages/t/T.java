/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp.pages.t;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class T extends Model{		
	@RParam(rParamName = "p_text_1")
	private String text_1;
	@RParam(rParamName = "")
	private String view_img;
	
	public void setText_1(String text_1){
		this.text_1 = text_1;
	}
	public String getText_1(){
		return this.text_1;
	}
	
	public void setView_img(String view_img){
		this.view_img = view_img;
	}
	public String getView_img(){
		return this.view_img;
	}


}
/*-------------------------*/