package nosi.webapps.igrp.pages.editartransacao;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class EditarTransacaoView extends View {

	public Field sectionheader_1_text;
	public Field descricao;
	public Field status;
	public Field status_check;
	public Field id;
	public Field aplicacao;
	public Field codigo;
	public IGRPForm sectionheader_1;
	public IGRPForm form_1;
	public IGRPView view_1;

	public IGRPButton btn_gravar;

	public EditarTransacaoView(){

		this.setPageTitle("Editar Transacao");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		view_1 = new IGRPView("view_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Editar transação"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Nome"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","150").add("required","true").add("readonly","false").add("disabled","false");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("readonly","false").add("disabled","false").add("switch","true").add("check","true");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		
		aplicacao = new TextField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","text").add("maxlength","30");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30");
		


		btn_gravar = new IGRPButton("Gravar","igrp","EditarTransacao","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","form").add("rel","gravar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(descricao);
		form_1.addField(status);
		form_1.addField(id);

		view_1.addField(aplicacao);
		view_1.addField(codigo);

		form_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(view_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		descricao.setValue(model);
		status.setValue(model);
		id.setValue(model);
		aplicacao.setValue(model);
		codigo.setValue(model);	

		}
}
