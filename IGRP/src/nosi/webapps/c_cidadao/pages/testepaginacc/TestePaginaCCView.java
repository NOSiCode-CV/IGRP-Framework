/*-------------------------*/

/*Create View*/

package nosi.webapps.c_cidadao.pages.testepaginacc;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TestePaginaCCView extends View {
	public String title = "";		
	
	public Field number_1;
	public Field date_1;
	public Field email_1;
	public Field view_img;
	public IGRPView view_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_mesma_pagina;
	public TestePaginaCCView(TestePaginaCC model){			
		view_1 = new IGRPView("view_1");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("maxlength","30");
		date_1 = new DateField(model,"date_1");
		date_1.setLabel("Date");
		date_1.propertie().add("name","p_date_1").add("type","date").add("format","IGRP_datePicker").add("maxlength","30");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30");
		view_img = new TextField(model,"view_img");
		view_img.setLabel("");
		view_img.propertie().add("maxlength","300");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_mesma_pagina = new IGRPButton("Mesma Pagina","c_cidadao","TestePaginaCC","mesma_pagina","_self","default|fa-angle-right","","");
		btn_mesma_pagina.propertie.add("type","specific").add("code","").add("rel","mesma_pagina");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		view_1.addField(number_1);
		view_1.addField(date_1);
		view_1.addField(email_1);
		view_1.addField(view_img);

		toolsbar_1.addButton(btn_mesma_pagina);
		this.addToPage(view_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/