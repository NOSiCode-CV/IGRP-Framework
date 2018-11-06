package nosi.webapps.igrp_studio.pages.wizard_export_step_1;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Wizard_export_step_1View extends View {

	public Field exportacao_aplicacao___passo_1;
	public Field selecionar_opcao;
	public Field application_id;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_seguinte;

	public Wizard_export_step_1View(){

		this.setPageTitle("Export Wizard Step 1");
			
		form_1 = new IGRPForm("form_1","");

		exportacao_aplicacao___passo_1 = new SeparatorField(model,"exportacao_aplicacao___passo_1");
		exportacao_aplicacao___passo_1.setLabel(gt("Exportação Aplicação - Passo 1"));
		exportacao_aplicacao___passo_1.propertie().add("name","p_exportacao_aplicacao___passo_1").add("type","separator").add("maxlength","250");
		
		selecionar_opcao = new CheckBoxListField(model,"selecionar_opcao");
		selecionar_opcao.setLabel(gt("Selecionar Opção"));
		selecionar_opcao.propertie().add("name","p_selecionar_opcao").add("type","checkboxlist").add("domain","").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false").add("child_size","12");
		
		application_id = new HiddenField(model,"application_id");
		application_id.setLabel(gt(""));
		application_id.propertie().add("name","p_application_id").add("type","hidden").add("maxlength","250").add("java-type","int").add("tag","application_id");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_seguinte = new IGRPButton("Seguinte","igrp_studio","Wizard_export_step_1","seguinte","submit","primary|fa-angle-double-right","","");
		btn_seguinte.propertie.add("type","specific").add("rel","seguinte");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(exportacao_aplicacao___passo_1);
		form_1.addField(selecionar_opcao);
		form_1.addField(application_id);


		toolsbar_1.addButton(btn_seguinte);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		exportacao_aplicacao___passo_1.setValue(model);
		selecionar_opcao.setValue(model);
		application_id.setValue(model);	

		}
}
