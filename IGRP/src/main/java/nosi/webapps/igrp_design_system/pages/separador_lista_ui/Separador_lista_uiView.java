package nosi.webapps.igrp_design_system.pages.separador_lista_ui;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Separador_lista_uiView extends View {

	public Field separatorlist_1_text_1;
	public Field separatorlist_1_select_1;
	public Field separatorlist_1_date_1;
	public Field separatorlist_1_email_1;
	public IGRPSeparatorList separatorlist_1;


	public Separador_lista_uiView(){

		this.setPageTitle("Separador Lista UI");
			
		separatorlist_1 = new IGRPSeparatorList("separatorlist_1","Separator List");

		separatorlist_1_text_1 = new TextField(model,"separatorlist_1_text_1");
		separatorlist_1_text_1.setLabel(gt("Text"));
		separatorlist_1_text_1.propertie().add("name","p_separatorlist_1_text_1").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("disablehtml","true").add("placeholder",gt("")).add("desclabel","false").add("desc","true");
		
		separatorlist_1_select_1 = new ListField(model,"separatorlist_1_select_1");
		separatorlist_1_select_1.setLabel(gt("Select"));
		separatorlist_1_select_1.propertie().add("name","p_separatorlist_1_select_1").add("type","select").add("placeholder",gt("")).add("multiple","false").add("tags","false").add("load_service_data","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("desc","true");
		
		separatorlist_1_date_1 = new DateField(model,"separatorlist_1_date_1");
		separatorlist_1_date_1.setLabel(gt("Date"));
		separatorlist_1_date_1.propertie().add("name","p_separatorlist_1_date_1").add("type","date").add("enableTime","false").add("range","false").add("disableWeekends","false").add("disabledBeforetoday","false").add("daysoff","false").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("class","primary").add("desc","true");
		
		separatorlist_1_email_1 = new EmailField(model,"separatorlist_1_email_1");
		separatorlist_1_email_1.setLabel(gt("Email"));
		separatorlist_1_email_1.propertie().add("name","p_separatorlist_1_email_1").add("type","email").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("")).add("desclabel","false").add("desc","true");
		


		
	}
		
	@Override
	public void render(){
		
		separatorlist_1.addField(separatorlist_1_text_1);
		separatorlist_1.addField(separatorlist_1_select_1);
		separatorlist_1.addField(separatorlist_1_date_1);
		separatorlist_1.addField(separatorlist_1_email_1);

		this.addToPage(separatorlist_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		separatorlist_1_text_1.setValue(model);
		separatorlist_1_select_1.setValue(model);
		separatorlist_1_date_1.setValue(model);
		separatorlist_1_email_1.setValue(model);	

		separatorlist_1.loadModel(((Separador_lista_ui) model).getSeparatorlist_1());
		}
}
