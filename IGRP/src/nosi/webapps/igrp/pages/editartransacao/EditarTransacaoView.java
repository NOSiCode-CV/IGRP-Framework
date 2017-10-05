/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.editartransacao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class EditarTransacaoView extends View {
	public String title = "Editar Transacao";		
	
	public Field codigo;
	public Field descricao;
	public Field aplicacao;
	public Field status;
	public Field id;
	public Field status_check;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public EditarTransacaoView(EditarTransacao model){			
		form_1 = new IGRPForm("form_1");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("Codigo");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel("Descricao");
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","150").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		status = new CheckBoxField(model,"status");
		status.setLabel("Ativo?");
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		id = new HiddenField(model,"id");
		id.setLabel("");
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","EditarTransacao","gravar","submit","info|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","igrp","EditarTransacao","voltar","_self","warning|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		form_1.addField(codigo);
		form_1.addField(descricao);
		form_1.addField(aplicacao);
		form_1.addField(status);
		form_1.addField(id);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/