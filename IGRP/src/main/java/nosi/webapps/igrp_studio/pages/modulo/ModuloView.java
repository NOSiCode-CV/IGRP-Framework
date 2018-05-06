
package nosi.webapps.igrp_studio.pages.modulo;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;



public class ModuloView extends View {

	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field modulo;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar;

	public ModuloView(){

		this.setPageTitle("Módulo");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Novo Módulo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","50").add("required","true").add("java-type","");
		
		modulo = new TextField(model,"modulo");
		modulo.setLabel(gt("Módulo"));
		modulo.propertie().add("name","p_modulo").add("type","text").add("maxlength","50").add("required","true");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_guardar = new IGRPButton("Guardar","igrp_studio","Modulo","guardar","submit_form","success|fa-save","","");
		btn_guardar.propertie.add("type","specific").add("rel","guardar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao);
		form_1.addField(modulo);

		toolsbar_1.addButton(btn_guardar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(Modulo model) {
		
		aplicacao.setValue(model);
		modulo.setValue(model);	

		
	}
}