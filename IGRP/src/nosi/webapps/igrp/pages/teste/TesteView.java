/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.teste;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TesteView extends View {		
	
	public Field text_1;
	public Field date_1;
	public Field email_1;
	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_button_1;
	public IGRPForm form_1;

	public TesteView(Teste model){			
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_button_1 = new IGRPButton("Button","","","","_blank","default|fa-angle-right","default||fa-angle-right|www","http://igrp.teste.gov.cv/images/IGRP/undefined");
		btn_button_1.propertie.add("type","specific").add("code","").add("rel","button_1");
		form_1 = new IGRPForm("form_1");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		date_1 = new DateField(model,"date_1");
		date_1.setLabel("Date");
		date_1.propertie().add("name","p_date_1").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

	}
		
	@Override
	public void render(){
		form_1.addField(text_1);
		form_1.addField(date_1);
		form_1.addField(email_1);

		toolsbar_1.addButton(btn_button_1);
		this.addToPage(toolsbar_1);
		this.addToPage(form_1);
	}
}
/*-------------------------*/