
package nosi.webapps.igrp.pages.task;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class TaskView extends View {
	
	
	public Field aplicacao;
	public Field processo;
	public Field selecionar;
	public Field selecionar_check;
	public Field descricao;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public TaskView(Task model){

		this.setPageTitle("Atribuição de Tarrefas");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","Lista de Tarrefas");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicacao"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("java-type","");
		
		processo = new ListField(model,"processo");
		processo.setLabel(gt("Processo"));
		processo.propertie().add("name","p_processo").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("java-type","");
		
		selecionar = new CheckBoxField(model,"selecionar");
		selecionar.setLabel(gt(""));
		selecionar.propertie().add("name","p_selecionar").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		selecionar_check = new CheckBoxField
		(model,"selecionar_check");
		selecionar_check.propertie().add("name","p_selecionar").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","Task","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		

		form_1.addField(aplicacao);
		form_1.addField(processo);

		table_1.addField(selecionar);
		table_1.addField(selecionar_check);
		table_1.addField(descricao);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
