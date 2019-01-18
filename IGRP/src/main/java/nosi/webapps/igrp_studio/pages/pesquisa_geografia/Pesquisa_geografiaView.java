package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class Pesquisa_geografiaView extends View {

	public Field sectionheader_1_text;
	public Field pais;
	public Field table_1_text_1;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;


	public Pesquisa_geografiaView(){

		this.setPageTitle("Pesquisa Geografia");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Pesquisa Geografia"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		pais = new ListField(model,"pais");
		pais.setLabel(gt("País"));
		pais.propertie().add("name","p_pais").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		table_1_text_1 = new TextField(model,"table_1_text_1");
		table_1_text_1.setLabel(gt("Text"));
		table_1_text_1.propertie().add("name","p_table_1_text_1").add("type","text").add("maxlength","30");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(pais);

		table_1.addField(table_1_text_1);

		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		pais.setValue(model);
		table_1_text_1.setValue(model);	

		table_1.loadModel(((Pesquisa_geografia) model).getTable_1());
		}
}
