package nosi.webapps.igrp.pages.task;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class TaskView extends View {

	public Field aplicacao;
	public Field processo;
	public Field descricao;
	public Field ordem;
	public IGRPForm form_1;
	public IGRPFormList table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;

	public TaskView(){

		this.setPageTitle("Task");
			
		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPFormList("table_1","Lista de Tarefas");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicacao"));
		aplicacao.propertie().add("remote",Core.getIGRPLink("igrp","Task","index")).add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		processo = new ListField(model,"processo");
		processo.setLabel(gt("Processo"));
		processo.propertie().add("remote",Core.getIGRPLink("igrp","Task","index")).add("name","p_processo").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		descricao = new PlainTextField(model,"descricao");
		descricao.setLabel(gt("Descrição (task ID)"));
		descricao.propertie().add("name","p_descricao").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","250").add("desc","true");
		
		ordem = new PlainTextField(model,"ordem");
		ordem.setLabel(gt("Ordem (tabela Task Component)"));
		ordem.propertie().add("name","p_ordem").add("type","plaintext").add("disable_output_escaping","false").add("html_class","").add("maxlength","250").add("desc","true");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Task","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(aplicacao);
		form_1.addField(processo);


		table_1.addField(descricao);
		table_1.addField(ordem);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		processo.setValue(model);
		descricao.setValue(model);
		ordem.setValue(model);	

		table_1.loadModel(((Task) model).getTable_1());
		}
}
