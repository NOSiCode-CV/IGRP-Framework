package nosi.webapps.igrp.pages.processo_partilhado_gacl;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Processo_partilhado_gaclView extends View {

	public Field sectionheader_1_text;
	public Field processoetapa;
	public Field run;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;

	public IGRPButton btn_executar;

	public Processo_partilhado_gaclView(){

		this.setPageTitle("Processo Partilhado GAcl");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Processo Partilhado Inter-Instancias</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		processoetapa = new PlainTextField(model,"processoetapa");
		processoetapa.setLabel(gt("Processo|Etapa"));
		processoetapa.propertie().add("name","p_processoetapa").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","100").add("showLabel","true").add("group_in","");
		
		run = new PlainTextField(model,"run");
		run.setLabel(gt("Run"));
		run.propertie().add("name","p_run").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","2000").add("showLabel","true").add("group_in","");
		


		btn_executar = new IGRPButton("Executar","igrp","Processo_partilhado_gacl","executar","submit","primary|fa-angle-right","","");
		btn_executar.propertie.add("id","button_2887_8075").add("type","specific").add("class","primary").add("rel","executar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(processoetapa);
		table_1.addField(run);

		table_1.addButton(btn_executar);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		processoetapa.setValue(model);
		run.setValue(model);	

		table_1.loadModel(((Processo_partilhado_gacl) model).getTable_1());
		}
}
