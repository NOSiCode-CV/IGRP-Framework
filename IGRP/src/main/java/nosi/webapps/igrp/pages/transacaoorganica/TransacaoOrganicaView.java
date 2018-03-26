
package nosi.webapps.igrp.pages.transacaoorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.config.Config;

public class TransacaoOrganicaView extends View {
	
	
	public Field transacao;
	public Field transacao_check;
	public Field nome;
	public Field p_id;
	public Field p_type;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_3;
	public IGRPButton btn_gravar;
	public IGRPButton btn_gestao_de_transacoes;
	public TransacaoOrganicaView(){

		this.setPageTitle("Associar Transacao a Organica");
			
		table_1 = new IGRPTable("table_1","");
		form_1 = new IGRPForm("form_1","");
		transacao = new CheckBoxField(model,"transacao");
		transacao.setLabel(gt("Ativo"));
		transacao.propertie().add("name","p_transacao").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		
		transacao_check = new CheckBoxField
		(model,"transacao_check");
		transacao_check.propertie().add("name","p_transacao").add("type","checkbox").add("maxlength","30").add("switch","false").add("check","true").add("desc","true");
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome (code)"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		
		p_type = new HiddenField(model,"p_type");
		p_type.setLabel(gt(""));
		p_type.propertie().add("name","p_type").add("type","hidden").add("maxlength","30").add("java-type","String").add("tag","type");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_3 = new IGRPToolsBar("toolsbar_3");

		btn_gravar = new IGRPButton("Gravar","igrp","TransacaoOrganica","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_gestao_de_transacoes = new IGRPButton("Gestão de transações","igrp","TransacaoOrganica","gestao_de_transacoes","_blank","black|fa-exchange","","");
		btn_gestao_de_transacoes.propertie.add("type","specific").add("rel","gestao_de_transacoes");
		
	}
		
	@Override
	public void render(){
		

		table_1.addField(transacao);
		table_1.addField(transacao_check);
		table_1.addField(nome);


		form_1.addField(p_id);
		form_1.addField(p_type);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_3.addButton(btn_gestao_de_transacoes);
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_3);
	}
		
	public void setModel(TransacaoOrganica model) {
			
		table_1.loadModel(model.getTable_1());

	}
}
