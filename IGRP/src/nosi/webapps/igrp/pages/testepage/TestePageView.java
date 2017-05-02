/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.testepage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TestePageView extends View {
	public String title = "Pagina Teste";		
	
	public Field text_1;
	public Field number_1;
	public Field date_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_li_me;
	public TestePageView(TestePage model){			
		form_1 = new IGRPForm("form_1");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		date_1 = new DateField(model,"date_1");
		date_1.setLabel("Date");
		date_1.propertie().add("name","p_date_1").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_li_me = new IGRPButton("Li me","igrp","TestePage","index","_self","default|fa-angle-right","","");
		btn_li_me.propertie.add("type","specific").add("code","").add("rel","li_me");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		form_1.addField(text_1);
		form_1.addField(number_1);
		form_1.addField(date_1);

		toolsbar_1.addButton(btn_li_me);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/