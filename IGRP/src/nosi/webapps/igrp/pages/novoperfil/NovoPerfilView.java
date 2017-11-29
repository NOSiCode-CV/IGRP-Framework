
package nosi.webapps.igrp.pages.novoperfil;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class NovoPerfilView extends View {
	
	
	public Field sectionheader_1_text;
	public Field aplicacao;
	public Field organica;
	public Field codigo;
	public Field descricao;
	public Field perfil;
	public Field activo;
	public Field activo_check;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public NovoPerfilView(NovoPerfil model){
		this.setPageTitle("Registar Perfil");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Gestão de Perfil - Novo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","");
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Orgânica"));
		
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","");
		codigo = new TextField(model,"codigo");
		codigo.setLabel(gt("Código"));
		
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		perfil = new ListField(model,"perfil");
		perfil.setLabel(gt("Perfil"));
		
		perfil.propertie().add("name","p_perfil").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false").add("domain","");
		activo = new CheckBoxField(model,"activo");
		activo.setLabel(gt("Activo?"));
		
		activo.propertie().add("name","p_activo").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","igrp","NovoPerfil","gravar","submit","info|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(aplicacao);
		form_1.addField(organica);
		form_1.addField(codigo);
		form_1.addField(descricao);
		form_1.addField(perfil);
		form_1.addField(activo);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
