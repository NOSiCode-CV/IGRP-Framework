
package nosi.webapps.igrp.pages.editartransacao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class EditarTransacaoView extends View {
	
	
	public Field descricao;
	public Field status;
	public Field status_check;
	public Field nada;
	public Field aplicacao;
	public Field codigo;
	public Field p_id;
	public Field sectionheader_1_text;
	public IGRPForm form_1;
	public IGRPForm sectionheader_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public EditarTransacaoView(EditarTransacao model){

		this.setPageTitle("Editar Transacao");
			
		form_1 = new IGRPForm("form_1","");
		sectionheader_1 = new IGRPForm("sectionheader_1","");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Nome"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","150").add("required","true");
		
		status = new CheckBoxField(model,"status");
		status.setLabel(gt("Ativo?"));
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("check","true");
		
		nada = new SeparatorField(model,"nada");
		nada.setLabel(gt(" "));
		nada.propertie().add("name","p_nada").add("type","separator").add("maxlength","30");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicacao"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("domain","").add("java-type","int");
		
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","100").add("required","true");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Editar transação"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","EditarTransacao","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		

		form_1.addField(descricao);
		form_1.addField(status);
		form_1.addField(nada);
		form_1.addField(aplicacao);
		form_1.addField(codigo);
		form_1.addField(p_id);

		sectionheader_1.addField(sectionheader_1_text);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(sectionheader_1);
		this.addToPage(toolsbar_1);
	}
}
