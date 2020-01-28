package nosi.webapps.igrp.pages.transacaoorganica;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class TransacaoOrganicaView extends View {

	public Field help;
	public Field transacao;
	public Field transacao_check;
	public Field nome;
	public Field id;
	public Field type;
	public IGRPView view_1;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_3;
	public IGRPButton btn_gravar;
	public IGRPButton btn_gestao_de_transacoes;

	public TransacaoOrganicaView(){

		this.setPageTitle("Associar Transacao a Organica");
			
		view_1 = new IGRPView("view_1","");

		table_1 = new IGRPTable("table_1","");

		form_1 = new IGRPForm("form_1","");

		help = new LinkField(model,"help");
		help.setLabel(gt("Help"));
		help.setValue(Core.getIGRPLink("igrp","Dominio","index"));

									help.propertie().add("name","p_help").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","primary").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true");
		
		transacao = new CheckBoxField(model,"transacao");
		transacao.setLabel(gt(" "));
		transacao.propertie().add("name","p_transacao").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","int").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		transacao_check = new CheckBoxField(model,"transacao_check");
		transacao_check.propertie().add("name","p_transacao").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","int").add("showLabel","true").add("group_in","").add("check","true").add("desc","true");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome (code)"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		
		type = new HiddenField(model,"type");
		type.setLabel(gt(""));
		type.propertie().add("name","p_type").add("type","hidden").add("maxlength","30").add("java-type","String").add("tag","type");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_3 = new IGRPToolsBar("toolsbar_3");

		btn_gravar = new IGRPButton("Gravar","igrp","TransacaoOrganica","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar").add("refresh_components","");

		btn_gestao_de_transacoes = new IGRPButton("Gestão de transações","igrp","TransacaoOrganica","gestao_de_transacoes","submit_popup","black|fa-exchange","","");
		btn_gestao_de_transacoes.propertie.add("type","specific").add("rel","gestao_de_transacoes").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		view_1.addField(help);


		table_1.addField(transacao);
		table_1.addField(transacao_check);
		table_1.addField(nome);


		form_1.addField(id);
		form_1.addField(type);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_3.addButton(btn_gestao_de_transacoes);
		this.addToPage(view_1);
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_3);
	}
		
	@Override
	public void setModel(Model model) {
		
		help.setValue(model);
		transacao.setValue(model);
		nome.setValue(model);
		id.setValue(model);
		type.setValue(model);	

		table_1.loadModel(((TransacaoOrganica) model).getTable_1());
		}
}
